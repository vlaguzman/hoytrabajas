import PropTypes from 'prop-types'
import React from 'react'
import styled from 'styled-components'
import Offers from '../../components/Offers'

const StyledWrapper = styled.div`
  margin-top: 180px;
  @media (max-width: 900px) {
    margin-top: 80px;
  }
`

const OffersPage = ({
  offers,
  offer_translations,
  csrf_param,
  csrf_token,
  path_applied_offers
}) => (
  <StyledWrapper>
    <h1
      className="sec-title mb-40 pt-20 mx-10 text-center"
      style={{ marginTop: '100px' }}
    >
      {offer_translations.index.title}
    </h1>
    <Offers
      offers={offers}
      offer_translations={offer_translations}
      path_applied_offers={path_applied_offers}
      csrf_param={csrf_param}
      csrf_token={csrf_token}
      initialRows={3}
      hasAllOffers
      rowIncrement={2}
    />
  </StyledWrapper>
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
