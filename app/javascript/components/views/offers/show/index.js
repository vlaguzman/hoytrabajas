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
    offer_translations,
    title_aditional_description
  } = props

  return (
    <AppLayout>
      <DynamicOffers
        offers={offers}
        offer_translations={offer_translations}
        path_applied_offers={path_applied_offers}
        csrf_param={csrf_param}
        csrf_token={csrf_token}
        title_aditional_description={title_aditional_description}
      />
    </AppLayout>
  )
}

export default OffersPage

OffersPage.propTypes = {
  offers: PropTypes.array.isRequired,
  csrf_param: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired,
  title_aditional_description: PropTypes.string,
  path_applied_offers: PropTypes.object.isRequired,
  offer_translations: PropTypes.shape({
    index: PropTypes.shape({
      title: PropTypes.string.isRequired,
      btn_more_offers: PropTypes.string.isRequired
    })
  })
}
