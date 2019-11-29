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
    session_translation,
    companies_registration_path,
    users_registration_path,
    companies_sessions_path,
    users_sessions_path,
    my_offers
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
        companies_registration_path={companies_registration_path}
        users_registration_path={users_registration_path}
        companies_sessions_path={companies_sessions_path}
        users_sessions_path={users_sessions_path}
      >
        <DynamicBoardsEnterprises my_offers={my_offers} />
      </AppLayout>
    </div>
  )
}

export default DashBoarEnterprisesPage

DashBoarEnterprisesPage.propTypes = {
  my_offers: PropTypes.object.isRequired,
  log_out_companies: PropTypes.string.isRequired,
  company_signed_in: PropTypes.bool.isRequired,
  user_signed_in: PropTypes.bool.isRequired,
  log_out_user: PropTypes.string.isRequired,
  csrf_param: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired,
  session_translation: PropTypes.object.isRequired,
  companies_registration_path: PropTypes.string.isRequired,
  users_registration_path: PropTypes.string.isRequired,
  companies_sessions_path: PropTypes.string.isRequired,
  users_sessions_path: PropTypes.string.isRequired
}
