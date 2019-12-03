import React from 'react'
import PropTypes from 'prop-types'
import { DynamicCompaniesStepFour } from '../../../../../src/views/DynamicViews'
import AppLayout from '../../../../../src/components/Layout/AppLayout'

const CompaniesStepFourPage = props => {
  const {
    csrf_param,
    csrf_token,
    user_signed_in,
    company_signed_in,
    log_out_user,
    log_out_companies,
    session_translation,
    user_facebook_omniauth_authorize_path
  } = props

  return (
    // TODO daniel, remove AppLayout and fix to implements datepiker
    <AppLayout
      csrf_param={csrf_param}
      csrf_token={csrf_token}
      user_signed_in={user_signed_in}
      company_signed_in={company_signed_in}
      log_out_user={log_out_user}
      log_out_companies={log_out_companies}
      session_translation={session_translation}
      user_facebook_omniauth_authorize_path={
        user_facebook_omniauth_authorize_path
      }
    >
      <DynamicCompaniesStepFour {...props} />
    </AppLayout>
  )
}

export default CompaniesStepFourPage

CompaniesStepFourPage.propTypes = {
  log_out_companies: PropTypes.string.isRequired,
  company_signed_in: PropTypes.bool.isRequired,
  user_signed_in: PropTypes.bool.isRequired,
  log_out_user: PropTypes.string.isRequired,
  csrf_param: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired,
  session_translation: PropTypes.object.isRequired,
  user_facebook_omniauth_authorize_path: PropTypes.object.isRequired
}
