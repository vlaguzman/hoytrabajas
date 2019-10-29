import React, { useState, useEffect, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row } from 'reactstrap'
import Button from '@material-ui/core/Button'
import styled from 'styled-components'
import Cards from './components/gallery_cards/gallery_card'
import useWindowSize from '../../../../hooks/useWindowSize'

const OfferCardsWrapper = styled.div`
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  padding: 0 3.5%;
  @media (max-width: 575px) {
    grid-template-columns: 1fr;
    padding: 0 10%;
  }
  @media (max-width: 900px) and (min-width: 576px) {
    grid-template-columns: repeat(2, 1fr);
  }
`

const StyledCards = styled(Cards)`
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

const textContent = {
  title: {
    main: 'El trabajo ideal',
    highlighted: 'si existe',
    last: 'esta en Hoy Trabajas'
  }
}

const Gallery = props => {
  const { offers, offer_translations } = props

  const windowSize = useWindowSize()
  const defaultLimit = windowSize.width > 566 ? 9 : 6

  const [offersToDisplay, setOffersToDisplay] = useState(3)
  const [offersLimit, setOffersLimit] = useState(defaultLimit)

  useEffect(() => {
    if (windowSize.width > 566) setOffersLimit(9)
    else setOffersLimit(6)
  }, [windowSize.width])

  const updateOffers = () => {
    if (offersToDisplay >= offersLimit) {
      window.location.assign('/offers')
    } else if (windowSize.width > 566) {
      setOffersToDisplay(prevLimit => prevLimit + 3)
      setOffersLimit(9)
    } else {
      setOffersToDisplay(prevLimit => prevLimit + 3)
      setOffersLimit(6)
    }
  }

  const offerCards = useMemo(
    () =>
      offers.length >= 1 ? (
        offers.map((o, index) =>
          index < offersToDisplay ? (
            <StyledCards
              key={o['title']}
              offer={o}
              offer_translations={offer_translations}
            />
          ) : null
        )
      ) : (
        <h1 className="text-center"> {offer_translations.index.no_offers}</h1>
      ),
    [offers, offersToDisplay]
  )

  return (
    <div className="">
      <div className="sec-title mt-20 mb-40 mx-10  text-center">
        {textContent.title.main}
        {windowSize.width > 566 ? ' ' : <br />}
        <span className="text-primary">{textContent.title.highlighted}</span>
        &nbsp;
        {textContent.title.last}
      </div>
      <OfferCardsWrapper>{offerCards}</OfferCardsWrapper>
      <Row className="justify-content-center align-items-center  my-30 ">
        <StyledButton
          color="primary"
          windowSize="large"
          variant="outlined"
          className="my-20 text-wrap"
          onClick={() => updateOffers()}
        >
          {offersToDisplay < offersLimit
            ? `${offer_translations.index.btn_more_offers} »`
            : 'Ver el listado de ofertas »'}
        </StyledButton>
      </Row>
    </div>
  )
}

export default Gallery

Gallery.propTypes = {
  offers: PropTypes.array.isRequired,
  offer_translations: PropTypes.shape({
    index: PropTypes.shape({
      no_offers: PropTypes.string.isRequired,
      btn_more_offers: PropTypes.string.isRequired
    })
  })
}
