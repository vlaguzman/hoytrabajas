import React from 'react'
import PropTypes from 'prop-types'
import { DynamicDetalle } from '../../src/views/DynamicViews'
import AppLayout from '../../src/components/Layout/AppLayout'

const MainPage = props => {
  const {
    companies_registration_path,
    companies_sessions_path,
    log_out_companies,
    users_registration_path,
    users_sessions_path,
    company_signed_in,
    user_signed_in,
    log_out_user,
    csrf_param,
    csrf_token,
    session_translation,
    user_facebook_omniauth_authorize_path
  } = props

  return (
    <AppLayout
      companies_registration_path={companies_registration_path}
      companies_sessions_path={companies_sessions_path}
      log_out_companies={log_out_companies}
      users_registration_path={users_registration_path}
      users_sessions_path={users_sessions_path}
      log_out_user={log_out_user}
      company_signed_in={company_signed_in}
      user_signed_in={user_signed_in}
      csrf_param={csrf_param}
      csrf_token={csrf_token}
      session_translation={session_translation}
      user_facebook_omniauth_authorize_path={
        user_facebook_omniauth_authorize_path
      }
    >
      <DynamicDetalle
        csrf_param={csrf_param}
        csrf_token={csrf_token}
        {...props}
      />
    </AppLayout>
  )
}

export default MainPage

MainPage.propTypes = {
  log_out_companies: PropTypes.string.isRequired,
  company_signed_in: PropTypes.bool.isRequired,
  user_signed_in: PropTypes.bool.isRequired,
  log_out_user: PropTypes.string.isRequired,
  csrf_param: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired,
  session_translation: PropTypes.object.isRequired,
  user_facebook_omniauth_authorize_path: PropTypes.object.isRequired,
  companies_registration_path: PropTypes.string.isRequired,
  companies_sessions_path: PropTypes.string.isRequired,
  users_registration_path: PropTypes.string.isRequired,
  users_sessions_path: PropTypes.string.isRequired
}
