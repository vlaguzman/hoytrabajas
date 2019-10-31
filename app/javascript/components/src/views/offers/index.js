import PropTypes from 'prop-types'
import React from 'react'
import Offers from '../../components/Offers'

const OffersPage = ({ offers, offer_translations }) => (
  <>
    <h1
      className="sec-title mb-40 pt-20 mx-10 text-center"
      style={{ marginTop: '100px' }}
    >
      {offer_translations.index.title}
    </h1>
    <Offers
      offers={offers}
      offer_translations={offer_translations}
      initialRows={3}
      hasAllOffers
      rowIncrement={2}
    />
  </>
)

export default OffersPage

OffersPage.propTypes = {
  offers: PropTypes.array.isRequired,
  offer_translations: PropTypes.shape({
    index: PropTypes.shape({
      title: PropTypes.string.isRequired,
      btn_more_offers: PropTypes.string.isRequired
    })
  })
}
