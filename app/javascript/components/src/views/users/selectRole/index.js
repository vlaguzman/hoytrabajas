import React from 'react'
import Head from 'next/head'
import Paper from '@material-ui/core/Paper'
import Button from '@material-ui/core/Button'
import { useAuth0 } from '../../../auth/authContext'

const SelectRolePage = () => {
  const {
    isAuthenticated,
    accessToken,
    user,
    updateUserMetadata,
    updateUserRole
  } = useAuth0()

  const chooseRole = async roleId => {
    await updateUserMetadata({ accessToken, userId: user.id, data: { roleId } })
    await updateUserRole({ accessToken, roleId })
  }

  if (!isAuthenticated) console.log('TODO: Should redirect to another page.')

  return (
    <div className="ecom-dashboard-wrapper">
      <Head>
        <title>Escoge tu tipo de cuenta</title>
        <meta name="description" content="Reactify Crm Dashboard" />
      </Head>
      <div className="d-flex my-50 justify-content-center w-100">
        <Paper className="d-flex flex-column w-80 justify-content-center align-items-center py-60">
          <div className="user-image text-center mb-30">
            <img
              src="/assets/static/avatars/user-11.jpg"
              className="img-fluid mx-auto user-profile-image"
              alt="user images"
              width="110"
              height="110"
            />
          </div>
          <div className="session-head mb-30">
            <h2 className="font-weight-bold">Escoge tu tipo de cuenta</h2>
          </div>
          <Button
            onClick={() => chooseRole(1)}
            variant="contained"
            size="large"
            color="primary"
            className="text-wrap text-white fw-bold mt-10 w-40 animated fadeIn"
          >
            Candidato
          </Button>
          <Button
            onClick={() => chooseRole(2)}
            variant="contained"
            size="large"
            color="primary"
            className="text-wrap text-white fw-bold mt-10 w-40 animated fadeIn"
          >
            Empresa
          </Button>
        </Paper>
      </div>
    </div>
  )
}

export default SelectRolePage
