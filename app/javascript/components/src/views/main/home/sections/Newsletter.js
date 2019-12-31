import React from 'react'
import PropTypes from 'prop-types'
import ArrowForwardIcon from '@material-ui/icons/ArrowForward'

const Newsletter = ({ translations }) => {
  return (
    <div className="t-home__newsletter py-60">
      <h4 className="companiesTitle a-typo__titleH4 color__blue-main">
        {translations.title}
      </h4>
      <h5 className="companiesSubtitle a-typo__titleH5">
        {translations.subtitle}
      </h5>
      <div className="newsletter__inputWrapper a-shadow__1">
        <input
          className="newsletter__input"
          type="email"
          placeholder={translations.placeholder}
        />
        <button className="newsletter__button" type="button">
          <ArrowForwardIcon />
        </button>
      </div>
    </div>
  )
}

Newsletter.propTypes = {
  translations: PropTypes.shape({
    title: PropTypes.string.isRequired,
    subtitle: PropTypes.string.isRequired,
    placeholder: PropTypes.string.isRequired
  })
}

export default Newsletter
