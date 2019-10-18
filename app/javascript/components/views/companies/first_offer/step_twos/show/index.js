import React from 'react'
import PropTypes from 'prop-types'
import { DynamicCompaniesStepTwo } from '../../../../../src/views/DynamicViews'
import AppLayout from '../../../../../src/components/Layout/AppLayout'

const CompaniesStepTwoPage = props => {
  const {
    csrf_param,
    csrf_token,
    user_signed_in,
    company_signed_in,
    log_out_user,
    log_out_companies
  } = props

  return (
    <AppLayout
      csrf_param={csrf_param}
      csrf_token={csrf_token}
      user_signed_in={user_signed_in}
      company_signed_in={company_signed_in}
      log_out_user={log_out_user}
      log_out_companies={log_out_companies}
    >
      <DynamicCompaniesStepTwo {...props} />
    </AppLayout>
  )
}

export default CompaniesStepTwoPage

CompaniesStepTwoPage.propTypes = {
  log_out_companies: PropTypes.string.isRequired,
  company_signed_in: PropTypes.bool.isRequired,
  user_signed_in: PropTypes.bool.isRequired,
  log_out_user: PropTypes.string.isRequired,
  csrf_param: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired
}
