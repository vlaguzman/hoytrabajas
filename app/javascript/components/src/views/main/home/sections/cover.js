import React from 'react'
import { Row, Col } from 'reactstrap'
import PropTypes from 'prop-types'
import FilterFormSection from './filterForm'

const WelcomeText = ({ translations, common, new_offer_path, filterForm }) => {
  const {
    welcome_text,
    filterForm: filterFormTranslations,
    call_to_action_text
  } = translations

  return (
    <Row className="align-items-center justify-content-center mb-60">
      <Col
        className="align-items-center justify-content-center t-home__cover"
        xs={12}
      >
        <h4 className="welcomeText a-typo__titleH4 color__blue-main d-none d-sm-inline">
          {welcome_text}
        </h4>
        <div className="welcomeImage">
          <img src="/assets/static/img/bg-home.png" alt="Buildings" />
        </div>
        <FilterFormSection
          {...{ common, ...filterForm }}
          translations={filterFormTranslations}
        />
        <p className="addOffer">
          {call_to_action_text.text}{' '}
          <a className="addOffer__link color__blue-main" href={new_offer_path}>
            {call_to_action_text.link}
          </a>
        </p>
      </Col>
    </Row>
  )
}

export default WelcomeText

WelcomeText.propTypes = {
  welcome_text: PropTypes.string.isRequired,
  new_offer_path: PropTypes.string.isRequired,
  subtitle: PropTypes.string.isRequired,
  common: PropTypes.object.isRequired,
  filterForm: PropTypes.object.isRequired,
  translations: PropTypes.shape({
    welcome_text: PropTypes.string.isRequired,
    filterForm: PropTypes.object.isRequired,
    call_to_action_text: PropTypes.shape({
      text: PropTypes.string.isRequired,
      link: PropTypes.string.isRequired
    })
  })
}
