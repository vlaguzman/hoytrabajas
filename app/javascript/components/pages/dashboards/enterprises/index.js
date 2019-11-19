import React from 'react'
import PropTypes from 'prop-types'
import { DynamicBoardsEnterprises } from '../../../src/views/DynamicViews'
import AppLayout from '../../../src/components/Layout/AppLayout'

const DashBoarEnterprisesPage = props => {
  const {
    csrf_param,
    csrf_token,
    user_signed_in,
    company_signed_in,
    log_out_user,
    log_out_companies,
    session_translation
  } = props

  return (
    <div className="dashboardEnterprises-wrapper pcx">
      <AppLayout
        csrf_param={csrf_param}
        csrf_token={csrf_token}
        user_signed_in={user_signed_in}
        company_signed_in={company_signed_in}
        log_out_user={log_out_user}
        log_out_companies={log_out_companies}
        session_translation={session_translation}
      >
        <DynamicBoardsEnterprises />
      </AppLayout>
    </div>
  )
}

export default DashBoarEnterprisesPage

DashBoarEnterprisesPage.propTypes = {
  log_out_companies: PropTypes.string.isRequired,
  company_signed_in: PropTypes.bool.isRequired,
  user_signed_in: PropTypes.bool.isRequired,
  log_out_user: PropTypes.string.isRequired,
  csrf_param: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired,
  session_translation: PropTypes.object.isRequired
}
