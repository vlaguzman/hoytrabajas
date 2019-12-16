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

  const welcomeTextFirst = welcome_text.slice(0, welcome_text.search(/\d/))
  const welcomeTextBold = welcome_text.slice(
    welcome_text.search(/\d/),
    welcome_text.search(/\d/) + welcome_text.replace(/[^0-9]/g, '').length
  )
  const welcomeTextEnd = welcome_text.slice(
    welcome_text.search(/\d/) + welcome_text.replace(/[^0-9]/g, '').length
  )
  return (
    <Row className="align-items-center justify-content-center mb-60">
      <Col
        className="align-items-center justify-content-center t-home__cover"
        xs={12}
      >
        <h4 className="welcomeText mb-20 a-typo__titleH4 color__blue-main d-sm-inline">
          {welcomeTextFirst}
          <strong> {welcomeTextBold} </strong>
          {welcomeTextEnd}
        </h4>
        <div className="welcomeImage mb-30 d-none d-lg-block">
          <img src="/assets/static/img/home-banner.jpg" alt="Banner" />
        </div>
        <FilterFormSection
          {...{ common, ...filterForm }}
          translations={filterFormTranslations}
        />
        <p className="a-callToAction__inline">
          {call_to_action_text.text}{' '}
          <a className="color__blue-main" href={new_offer_path}>
            {call_to_action_text.link}
          </a>
        </p>
      </Col>
    </Row>
  )
}

export default WelcomeText

WelcomeText.propTypes = {
  new_offer_path: PropTypes.string.isRequired,
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
