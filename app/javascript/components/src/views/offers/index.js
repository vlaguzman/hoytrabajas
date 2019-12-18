import PropTypes from 'prop-types'
import React from 'react'
import styled from 'styled-components'
import Offers from '../../components/Offers'
import SoftSkills from '../../components/Charts/Skills'
import Education from '../../components/Cards/PublicProfile/Education'
import Experience from '../../components/Cards/PublicProfile/Experience'

const StyledWrapper = styled.div`
  margin: auto;
  margin-top: 180px;
  padding: 0 60px;

  @media (max-width: 576) {
    padding: 0 30px;
  }
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
    <div className="o-offers__wrapper pb-60">
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
    </div>
    {/* TEST PROFILE CMOPONENTS* /}
    {/* SKILLS */}
    <div className="mt-60">
      <h4 className="color__blue-main fw-black">Habilidades</h4>
      <SoftSkills />
    </div>
    {/* EDUCATION */}
    <div className="mt-60">
      <h4 className="color__blue-main fw-black">Formación académica</h4>
      <Education />
    </div>
    {/* EXPERIENCE */}
    <div className="mt-60">
      <h4 className="color__blue-main fw-black">Experiencia</h4>
      <Experience />
    </div>
  </StyledWrapper>
)

export default OffersPage

OffersPage.propTypes = {
  offers: PropTypes.array.isRequired,
  csrf_param: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired,
  path_applied_offers: PropTypes.string.isRequired,
  offer_translations: PropTypes.shape({
    index: PropTypes.shape({
      title: PropTypes.string.isRequired,
      btn_more_offers: PropTypes.string.isRequired
    })
  })
}
