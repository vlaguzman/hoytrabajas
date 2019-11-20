import React from 'react'
import PropTypes from 'prop-types'
import Offers from '../../../../components/Offers'

const textContent = {
  title: {
    main: 'El trabajo ideal',
    highlighted: 'si existe',
    last: 'esta en Hoy Trabajas'
  }
}

const OffersSection = props => {
  const {
    csrf_param,
    csrf_token,
    path_applied_offers,
    offers,
    offer_translations
  } = props

  return (
    <>
      <div className="sec-title mt-20 mb-40 mx-10  text-center">
        {textContent.title.main} <br className="d-sm-none" />
        <span className="text-primary">{textContent.title.highlighted}</span>
        &nbsp;
        {textContent.title.last}
      </div>
      <Offers
        offers={offers}
        offer_translations={offer_translations}
        csrf_param={csrf_param}
        csrf_token={csrf_token}
        path_applied_offers={path_applied_offers}
        initialRows={3}
        rowIncrement={3}
        maxOffers={12}
      />
    </>
  )
}

export default OffersSection

OffersSection.propTypes = {
  path_applied_offers: PropTypes.string.isRequired,
  csrf_param: PropTypes.string,
  csrf_token: PropTypes.string,
  offers: PropTypes.array.isRequired,
  offer_translations: PropTypes.shape({
    index: PropTypes.shape({
      no_offers: PropTypes.string.isRequired,
      btn_more_offers: PropTypes.string.isRequired
    })
  })
}
