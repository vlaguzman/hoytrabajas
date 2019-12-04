import React from 'react'
import PropTypes from 'prop-types'
import { DynamicHome } from '../src/views/DynamicViews'
import AppLayout from '../src/components/Layout/AppLayout'

const HomePage = ({
  offers,
  csrf_param,
  csrf_token,
  user_signed_in,
  company_signed_in,
  companies_registration_path,
  users_registration_path,
  companies_sessions_path,
  users_sessions_path,
  log_out_user,
  log_out_companies,
  path_applied_offers,
  session_translation,
  user_facebook_omniauth_authorize_path,
  offer_translations,
  filterForm,
  common
}) => {
  return (
    <div className="main-wrapper">
      <AppLayout
        csrf_param={csrf_param}
        csrf_token={csrf_token}
        user_signed_in={user_signed_in}
        company_signed_in={company_signed_in}
        companies_registration_path={companies_registration_path}
        companies_sessions_path={companies_sessions_path}
        log_out_companies={log_out_companies}
        users_registration_path={users_registration_path}
        users_sessions_path={users_sessions_path}
        log_out_user={log_out_user}
        session_translation={session_translation}
        user_facebook_omniauth_authorize_path={
          user_facebook_omniauth_authorize_path
        }
        shouldChangeColorOfNav
      >
        <DynamicHome
          offers={offers}
          offer_translations={offer_translations}
          path_applied_offers={path_applied_offers}
          csrf_param={csrf_param}
          csrf_token={csrf_token}
          filterForm={filterForm}
          common={common}
        />
      </AppLayout>
    </div>
  )
}
export default HomePage

HomePage.propTypes = {
  csrf_param: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired,
  user_signed_in: PropTypes.bool.isRequired,
  company_signed_in: PropTypes.bool.isRequired,
  log_out_user: PropTypes.string.isRequired,
  log_out_companies: PropTypes.string.isRequired,
  companies_registration_path: PropTypes.string.isRequired,
  users_registration_path: PropTypes.string.isRequired,
  path_applied_offers: PropTypes.string.isRequired,
  companies_sessions_path: PropTypes.string.isRequired,
  users_sessions_path: PropTypes.string.isRequired,
  session_translation: PropTypes.object.isRequired,
  user_facebook_omniauth_authorize_path: PropTypes.object.isRequired,
  offers: PropTypes.object.isRequired,
  offer_translations: PropTypes.object.isRequired,
  filterForm: PropTypes.object.isRequired,
  common: PropTypes.object.isRequired
}
