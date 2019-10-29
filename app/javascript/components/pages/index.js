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
  log_out_user,
  log_out_companies,
  session_translation,
  offer_translations,
  filterForm
}) => {
  return (
    <div className="main-wrapper">
      <AppLayout
        csrf_param={csrf_param}
        csrf_token={csrf_token}
        user_signed_in={user_signed_in}
        company_signed_in={company_signed_in}
        log_out_user={log_out_user}
        log_out_companies={log_out_companies}
        session_translation={session_translation}
        shouldChangeColorOfNav
      >
        <DynamicHome offers={offers} offer_translations={offer_translations} filterForm={filterForm} />
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
  session_translation: PropTypes.object.isRequired,
  offers: PropTypes.object.isRequired,
  offer_translations: PropTypes.object.isRequired,
  filterForm: PropTypes.object.isRequired
}
