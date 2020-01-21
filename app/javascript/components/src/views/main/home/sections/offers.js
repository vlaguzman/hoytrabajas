import React from 'react'
import PropTypes from 'prop-types'
import Offers from '../../../../components/Offers'
import OffersCarousel from '../../../../components/Offers/OffersCarousel'

const OffersSection = props => {
  const {
    csrf_param,
    csrf_token,
    path_applied_offers,
    offers,
    offers_path,
    section_title,
    offer_translations
  } = props

  return (
    <div className="o-offers__wrapper">
      <h4 className="offersTitle color__blue-main">{section_title}</h4>
      <div className="offers__gridWrapper">
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
      <div className="offers__carouselWrapper">
        <OffersCarousel
          offers={offers}
          offers_path={offers_path}
          offer_translations={offer_translations}
          csrf_param={csrf_param}
          csrf_token={csrf_token}
          path_applied_offers={path_applied_offers}
          maxOffers={10}
        />
      </div>
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
