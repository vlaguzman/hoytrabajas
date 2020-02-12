import React from 'react'
import PropTypes from 'prop-types'
import FilterFormSection from './filterForm'

const WelcomeText = ({
  translations,
  advanced_search_translations,
  common,
  new_offer_path,
  filterForm
}) => {
  const {
    filterForm: filterFormTranslations,
    call_to_action_text
  } = translations

  return (
    <div className="t-home__cover">
      <img
        src="/assets/static/img/home-banner2.jpg"
        alt="Banner"
        className="home__banner"
      />
      <div className="home__banner--responsive" />
      <FilterFormSection
        {...{ common, ...filterForm }}
        translations={{
          filterForm: filterFormTranslations,
          advancedSearch: advanced_search_translations
        }}
      />
      <p className="a-callToAction__inline">
        {call_to_action_text.text}{' '}
        <a className="color__blue-main" href={new_offer_path}>
          {call_to_action_text.link}
        </a>
      </p>
    </div>
  )
}

export default WelcomeText

WelcomeText.propTypes = {
  new_offer_path: PropTypes.string.isRequired,
  common: PropTypes.object.isRequired,
  filterForm: PropTypes.object.isRequired,
  advanced_search_translations: PropTypes.object.isRequired,
  translations: PropTypes.shape({
    filterForm: PropTypes.object.isRequired,
    call_to_action_text: PropTypes.shape({
      text: PropTypes.string.isRequired,
      link: PropTypes.string.isRequired
    })
  })
}
