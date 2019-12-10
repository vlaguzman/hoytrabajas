import React, { useState, useEffect, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row } from 'reactstrap'
import Button from '@material-ui/core/Button'
import styled from 'styled-components'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import OfferCard from './OfferCard'
import useWindowSize from '../../hooks/useWindowSize'

const OfferCardsWrapper = styled.div`
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-gap: 35px;
  margin: auto;
  @media (max-width: 575px) {
    grid-template-columns: 1fr;
    padding: 0 10%;
  }
  @media (max-width: 900px) and (min-width: 576px) {
    grid-template-columns: repeat(2, 1fr);
  }
  @media (max-width: 1200px) and (min-width: 901px) {
    grid-template-columns: repeat(3, 1fr);
  }
`

const StyledOfferCard = styled(OfferCard)`
  max-width: 400px;
  margin: auto;
`

const StyledButton = styled(Button)`
  text-transform: uppercase !important;
  padding: 15px 60px;
  border-radius: 50px;
  @media (max-width: 575px) {
    text-transform: none !important;
    font-size: 16px;
    line-height: 26px;
  }
`
const Offers = props => {
  const {
    offers,
    offer_translations,
    csrf_param,
    csrf_token,
    path_applied_offers,
    hasAllOffers = false,
    initialRows = 1,
    rowIncrement = 1,
    maxOffers = 12,
    loadMoreOffers = true
  } = props

  const windowSize = useWindowSize()

  const getOffersPerRow = () => {
    if (windowSize.width >= 1200) return 4
    if (windowSize.width < 1200 && windowSize.width > 900) return 3
    return 2
  }

  const [offersPerRow, setOffersPerRow] = useState(getOffersPerRow())
  const initialOffers = initialRows * offersPerRow

  const getMaxOffers = () => {
    if (!windowSize.width > 576) return 6
    if (!hasAllOffers) return maxOffers
    return 99999
  }

  const [offersToDisplay, setOffersToDisplay] = useState(initialOffers)
  const [offersLimit, setOffersLimit] = useState(getMaxOffers())

  useEffect(() => {
    setOffersPerRow(getOffersPerRow())

    if (windowSize.width < 576) setOffersLimit(6)
  }, [windowSize.width])

  const updateOffers = () => {
    if (
      !hasAllOffers &&
      (offersToDisplay >= offersLimit || offersToDisplay >= offers.length)
    ) {
      window.location.assign('/offers')
    }
    setOffersToDisplay(prevLimit => prevLimit + offersPerRow * rowIncrement)
  }

  const offerCards = useMemo(
    () =>
      offers.length >= 1 ? (
        offers.map((o, index) =>
          (!hasAllOffers && index < offersLimit && index < offersToDisplay) ||
          index < offersToDisplay ? (
            <StyledOfferCard
              key={o['title']}
              offer={o}
              offer_translations={offer_translations}
              path_applied_offers={path_applied_offers}
              csrf_param={csrf_param}
              csrf_token={csrf_token}
            />
          ) : null
        )
      ) : (
        <h1 className="text-center"> {offer_translations.index.no_offers}</h1>
      ),
    [offers, offersToDisplay, offersLimit]
  )

  return (
    <>
      <OfferCardsWrapper>{offerCards}</OfferCardsWrapper>
      {loadMoreOffers && offers.length >= 1 && offers.length > offersToDisplay && (
        <Row className="justify-content-center align-items-center  my-30 ">
          <button
            type="button"
            className="a-button a-button--secondary a-button--big my-20"
            onClick={() => updateOffers()}
          >
            {(!hasAllOffers && offersToDisplay >= offersLimit) ||
            (!hasAllOffers && offersToDisplay >= offers.length) ? (
              offer_translations.index.btn_all_offers
            ) : (
              <>
                <FontAwesomeIcon icon="search" size="sm" className="mr-10" />
                {offer_translations.index.btn_more_offers}
              </>
            )}
          </button>
        </Row>
      )}
    </>
  )
}

export default Offers

Offers.propTypes = {
  path_applied_offers: PropTypes.string.isRequired,
  csrf_param: PropTypes.string,
  csrf_token: PropTypes.string,
  offers: PropTypes.array.isRequired,
  offer_translations: PropTypes.shape({
    index: PropTypes.shape({
      no_offers: PropTypes.string.isRequired,
      btn_more_offers: PropTypes.string.isRequired,
      btn_all_offers: PropTypes.string.isRequired
    })
  }),
  hasAllOffers: PropTypes.bool,
  initialRows: PropTypes.number,
  maxOffers: PropTypes.number,
  rowIncrement: PropTypes.number,
  loadMoreOffers: PropTypes.bool
}
