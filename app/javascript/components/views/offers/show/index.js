import React from 'react'
import PropTypes from 'prop-types'
import { DynamicOffers } from '../../../src/views/DynamicViews'
import AppLayout from '../../../src/components/Layout/AppLayout'

const OffersPage = props => {
  const {
    offers,
    csrf_param,
    csrf_token,
    path_applied_offers,
    user_signed_in,
    company_signed_in,
    log_out_user,
    log_out_companies,
    session_translation,
    offer_translations
  } = props

  return (
    <AppLayout
      csrf_param={csrf_param}
      csrf_token={csrf_token}
      user_signed_in={user_signed_in}
      company_signed_in={company_signed_in}
      log_out_user={log_out_user}
      log_out_companies={log_out_companies}
      session_translation={session_translation}
    >
      <DynamicOffers 
        offers={offers}
        offer_translations={offer_translations}
        path_applied_offers={path_applied_offers}
        csrf_param={csrf_param}
        csrf_token={csrf_token}
       />
    </AppLayout>
  )
}

export default OffersPage

OffersPage.propTypes = {
  offers: PropTypes.array.isRequired,
  log_out_companies: PropTypes.string.isRequired,
  company_signed_in: PropTypes.bool.isRequired,
  user_signed_in: PropTypes.bool.isRequired,
  log_out_user: PropTypes.string.isRequired,
  csrf_param: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired,
  path_applied_offers: PropTypes.object.isRequired,
  session_translation: PropTypes.object.isRequired,
  offer_translations: PropTypes.shape({
    index: PropTypes.shape({
      title: PropTypes.string.isRequired,
      btn_more_offers: PropTypes.string.isRequired
    })
  })
}
