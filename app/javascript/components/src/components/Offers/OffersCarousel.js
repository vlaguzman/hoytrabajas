import React from 'react'
import PropTypes from 'prop-types'
import CarouselRow from '../Carousel/CarouselRow'
import OfferCard from './OfferCard'

const OffersCarousel = ({
  offers,
  offer_translations,
  path_applied_offers,
  csrf_param,
  csrf_token,
  offers_path,
  maxOffers
}) => {
  return offers && offers.length > 0 ? (
    <>
      <CarouselRow slidesToShowResp={1} autoplay={false} infinite>
        {offers.map((offer, idx) => {
          if (maxOffers && idx + 1 > maxOffers) return null
          return (
            <OfferCard
              key={offer['title']}
              offer={offer}
              offer_translations={offer_translations}
              path_applied_offers={path_applied_offers}
              csrf_param={csrf_param}
              csrf_token={csrf_token}
            />
          )
        })}
      </CarouselRow>
      <div className="w-100 d-flex px-15 mt-60" style={{ color: 'white' }}>
        <a
          type="button"
          id="loadMoreOffers"
          className="a-button a-button--secondary a-button--big m-auto"
          href={offers_path}
        >
          {offer_translations.index.btn_all_offers}
        </a>
      </div>
    </>
  ) : (
    <h6 className="text-center my-30">{offer_translations.index.no_offers}</h6>
  )
}

OffersCarousel.propTypes = {
  path_applied_offers: PropTypes.string.isRequired,
  csrf_param: PropTypes.string,
  csrf_token: PropTypes.string,
  offers_path: PropTypes.string,
  offers: PropTypes.array.isRequired,
  maxOffers: PropTypes.number,
  offer_translations: PropTypes.shape({
    index: PropTypes.shape({
      no_offers: PropTypes.string.isRequired
    })
  })
}

export default OffersCarousel
