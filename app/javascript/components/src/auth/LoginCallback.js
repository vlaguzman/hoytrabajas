import React, { useEffect } from 'react'
import { useRouter } from 'next/router'
import loadingSVG from './loading.svg'
import { useAuth0 } from '../auth/authContext'

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

const LoginCallback = () => {
  const { loading, isAuthenticated, handleAuthentication } = useAuth0()
  const { asPath, push, prefetch } = useRouter()
  const handleAuth = async () => {
    if (/access_token|id_token|error/.test(asPath)) {
      await handleAuthentication()
    }
  }

  useEffect(() => {
    handleAuth()
    prefetch('/users/select-role')
  }, [])

  if (loading) {
    return (
      <div style={style}>
        <img src={loadingSVG} alt="loading" />
      </div>
    )
  }

  if (isAuthenticated) {
    push('/users/select-role')
    return null
  }
  push('/main')
  return null
}

export default LoginCallback
