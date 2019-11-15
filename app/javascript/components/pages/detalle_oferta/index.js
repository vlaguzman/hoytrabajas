import React from 'react'
import PropTypes from 'prop-types'
import { DynamicDetalle } from '../../src/views/DynamicViews'
import AppLayout from '../../src/components/Layout/AppLayout'

const MainPage = props => {
  const {
    log_out_companies,
    company_signed_in,
    user_signed_in,
    log_out_user,
    csrf_param,
    csrf_token,
    path_applied_offers,
    session_translation
  } = props

  return (
    <AppLayout
      log_out_companies={log_out_companies}
      company_signed_in={company_signed_in}
      user_signed_in={user_signed_in}
      log_out_user={log_out_user}
      csrf_param={csrf_param}
      csrf_token={csrf_token}
      session_translation={session_translation}
    >
      <DynamicDetalle
        csrf_param={csrf_param}
        csrf_token={csrf_token}
        path_applied_offers={path_applied_offers}
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
  path_applied_offers: PropTypes.object.isRequired,
  session_translation: PropTypes.object.isRequired
}
