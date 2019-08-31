import React, { useState, useEffect, useContext, createContext } from 'react'
import auth0 from 'auth0-js'
import Router from 'next/router'
import { AUTH_CONFIG, API_CONFIG } from './auth0-variables'

export const auth0Context = createContext({
  loading: false, // to check if is loading or not
  isAuthenticated: false, // to check if authenticated or not
  user: {}, // store all the user basic details
  userProfile: {}, // store all the user profile details
  accessToken: '', // accessToken of user for Auth0
  handleAuthentication: () => {}, // handle Auth0 login process
  login: () => {}, // to start the login process
  logout: () => {} // logout the user
})

export const useAuth0 = () => useContext(auth0Context)

const webAuth = new auth0.WebAuth({
  domain: AUTH_CONFIG.domain,
  clientID: AUTH_CONFIG.clientId,
  redirectUri: AUTH_CONFIG.callbackUrl,
  audience: `https://${AUTH_CONFIG.domain}/api/v2/`,
  responseType: 'id_token token',
  scope:
    'openid profile read:current_user update:current_user_metadata create:current_user_metadata'
})

export const Auth0Provider = ({ children }) => {
  const [isAuthenticated, setIsAuthenticated] = useState(false)
  const [accessToken, setAccessToken] = useState(false)
  const [auth0Manage, setAuth0Manage] = useState(false)
  const [user, setUser] = useState(null)
  const [userProfile, setUserProfile] = useState(null)
  const [loading, setLoading] = useState(true)

  const initAuth0 = async ({ accessToken, userId }) => {
    const auth0Manage = new auth0.Management({
      domain: AUTH_CONFIG.domain,
      token: accessToken
    })
    setAuth0Manage(auth0Manage)
    await auth0Manage.getUser(userId, (err, response) => {
      if (err) {
        console.log(err)
      } else if (response) {
        // dispatch({ type: 'GET_USER_SUCCESS', payload: response })
        setUserProfile(response)
        setIsAuthenticated(true)
        setLoading(false)
      }
    })
  }

  const handleAuthentication = () => {
    setLoading(true)
    webAuth.parseHash((err, authResult) => {
      if (authResult && authResult.accessToken) {
        setSession(authResult)
        initAuth0({
          accessToken: authResult.accessToken,
          userId: authResult.idTokenPayload.sub
        })
        getUserProfile({
          accessToken: authResult.accessToken,
          userId: authResult.idTokenPayload.sub
        })
        // store.dispatch({ type: 'LOGIN_USER_SUCCESS', payload: authResult })
      } else if (err) {
        console.log(err)
        alert(`Error: ${err.error}. Check the console for further details.`)
      }
    })
  }

  const setSession = data => {
    const user = {
      id: data.idTokenPayload.sub
    }
    setAccessToken(data.accessToken)
    setIsAuthenticated(true)
    setUser(user)

    const expiresAt = JSON.stringify(
      data.expiresIn * 1000 + new Date().getTime()
    )
    localStorage.setItem(
      'user_id',
      data.idTokenPayload.sub ? data.idTokenPayload.sub : ''
    )
    localStorage.setItem('access_token', data.accessToken)
    localStorage.setItem('id_token', data.idToken)
    localStorage.setItem('expires_at', expiresAt)
  }

  const updateToken = () => {
    webAuth.checkSession(
      {
        audience: 'hoytrabajas.app'
      },
      (err, authResult) => {
        if (err) {
          console.log(err)
        } else {
          setAccessToken(authResult.accessToken)
        }
      }
    )
  }

  const renewToken = () => {
    webAuth.renewAuth({}, (err, authResult) => {
      initAuth0({
        accessToken: authResult.accessToken,
        userId: authResult.idTokenPayload.sub
      })
    })
  }

  const hasValidToken = () => {
    // Check whether the current time is past the
    // access token's expiry time
    const expiresAt = JSON.parse(localStorage.getItem('expires_at'))
    return new Date().getTime() < expiresAt
  }

  const getUserProfile = userId => {
    setLoading(true)
    webAuth.getUser =
      (userId,
      (err, response) => {
        if (err) {
          console.log('Ha ocurrido un error al obtener los datos del usuario.')
          console.log(err)
        } else if (response) {
          // dispatch({ type: 'GET_USER_SUCCESS', payload: response })
          setUserProfile(response)
          setLoading(false)
        }
      })
  }

  const updateUserMetadata = ({ userId, data }) => {
    setLoading(true)
    auth0Manage.patchUserMetadata(
      userId,
      {
        ...data
      },
      (err, response) => {
        if (err) {
          console.log(
            'Ha ocurrido un error al actualizar los datos del usuario.'
          )
          return err
        }
        setLoading(false)
      }
    )
  }

  const updateUserRole = ({ roleId }) => {
    webAuth.checkSession(
      {
        audience: 'hoytrabajas.app'
      },
      (err, authResult) => {
        if (err) {
          console.log(err)
        } else {
          setAccessToken(authResult.accessToken)
          // eslint-disable-next-line
          fetch(`https://${API_CONFIG.domain}/api/private/rol/${roleId}`, {
            method: 'PUT',
            // prettier-ignore
            headers: { 'Authorization': `Bearer ${authResult.accessToken}` }
          })
            .then(res => {
              return res.json()
            })
            .then(res => {
              Router.push('/')
            })
            .catch(error => {})
            .then(() => console.log('User role updated.'))
        }
      }
    )
  }

  const login = () => {
    webAuth.authorize()
  }

  const logout = () => {
    setIsAuthenticated(false)
    setAccessToken(null)
    setUser(null)
    setUserProfile(null)
    localStorage.removeItem('access_token')
    localStorage.removeItem('id_token')
    localStorage.removeItem('expires_at')
    webAuth.logout({
      returnTo: AUTH_CONFIG.returnTo,
      clientID: AUTH_CONFIG.clientId
    })
    Router.push('/')
  }

  async function asyncInitAuth(token, userId) {
    await initAuth0({ accessToken: token, userId })
  }

  useEffect(() => {
    const token = localStorage.getItem('access_token')
    const validToken = hasValidToken()
    if (token && validToken) {
      console.log('Token válido...')
      if (!isAuthenticated) {
        console.log('Se actualizará la información del usuario...')
        const userId = localStorage.getItem('user_id')
        const user = {
          id: userId
        }
        setAccessToken(token)
        setUser(user)
        if (!auth0Manage) {
          asyncInitAuth(token, userId)
        }
      } else {
        console.log('Información del usuario ya actualizada.')
        setLoading(false)
      }
    } else if (token && !validToken) {
      console.log('La sesión del usuario ha expirado.')
    } else {
      console.log('El usuario no posee un token activo.')
      if (!window.location.pathname.includes('/callback')) setLoading(false)
    }
  }, [])

  return (
    <auth0Context.Provider
      value={{
        loading,
        isAuthenticated,
        user,
        userProfile,
        accessToken,
        auth0Manage,
        updateToken,
        renewToken,
        getUserProfile,
        updateUserMetadata,
        updateUserRole,
        handleAuthentication,
        login,
        logout
      }}
    >
      {children}
    </auth0Context.Provider>
  )
}
