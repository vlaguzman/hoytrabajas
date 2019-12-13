import React from 'react'
import PropTypes from 'prop-types'
import Offers from '../../../../components/Offers'

const OffersSection = props => {
  const {
    csrf_param,
    csrf_token,
    path_applied_offers,
    offers,
    section_title,
    offer_translations
  } = props

  return (
    <div className="o-offers__wrapper">
      <h4 className="color__blue-main mb-60">{section_title}</h4>
      <Offers
        offers={offers}
        offer_translations={offer_translations}
        csrf_param={csrf_param}
        csrf_token={csrf_token}
        path_applied_offers={path_applied_offers}
        initialRows={3}
        rowIncrement={3}
        maxOffers={24}
      />
    </div>
  )
}

export default OffersSection

OffersSection.propTypes = {
  path_applied_offers: PropTypes.string.isRequired,
  csrf_param: PropTypes.string,
  csrf_token: PropTypes.string,
  offers: PropTypes.array.isRequired,
  section_title: PropTypes.string.isRequired,
  offer_translations: PropTypes.shape({
    index: PropTypes.shape({
      no_offers: PropTypes.string.isRequired,
      btn_more_offers: PropTypes.string.isRequired
    })
  })
}
