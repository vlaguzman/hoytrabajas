import React from 'react'
import { useAuth0 } from 'Auth/authContext'
import redirect from 'Helpers/redirect'
import loadingSVG from 'Auth/loading.svg'

const style = {
  position: 'absolute',
  display: 'flex',
  justifyContent: 'center',
  height: '100vh',
  width: '100vw',
  top: 0,
  bottom: 0,
  left: 0,
  right: 0,
  backgroundColor: 'white'
}

const IsLoggedIn = ({ children, path = null }) => {
  const { loading, isAuthenticated } = useAuth0()

  if (loading) {
    return (
      <div style={style}>
        <img src={loadingSVG} alt="loading" />
      </div>
    )
  }

  if (!isAuthenticated) redirect({}, path || '/')

  return children
}

export default IsLoggedIn
