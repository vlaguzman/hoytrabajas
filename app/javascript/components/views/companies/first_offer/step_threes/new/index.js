import React from 'react'
import PropTypes from 'prop-types'
import { DynamicCompaniesStepThree } from '../../../../../src/views/DynamicViews'
import AppLayout from '../../../../../src/components/Layout/AppLayout'

const CompaniesStepThreePage = props => {
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
      <DynamicCompaniesStepThree {...props} />
    </AppLayout>
  )
}

export default CompaniesStepThreePage

CompaniesStepThreePage.propTypes = {
  log_out_companies: PropTypes.string.isRequired,
  company_signed_in: PropTypes.bool.isRequired,
  user_signed_in: PropTypes.bool.isRequired,
  log_out_user: PropTypes.string.isRequired,
  csrf_param: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired
}
