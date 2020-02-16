import React from 'react'
import PropTypes from 'prop-types'
import ArrowForwardIcon from '@material-ui/icons/ArrowForward'

const Newsletter = ({ translations }) => {
  return (
    <div className="t-home__newsletter">
      <div className="newsletter__wrapper">
        <div className="newsletter__title">
          <h4 className="homeTitle a-typo__titleH4 color__blue-main">
            {translations.title}
          </h4>
          <h5 className="homeSubtitle a-typo__titleH5">
            {translations.subtitle}
          </h5>
        </div>
        <div className="newsletter__inputWrapper a-shadow__1">
          <div className="newsletter__image">
            <img
              src="/assets/static/img/home-newsletter.png"
              alt="Newsletter icon"
            />
          </div>
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
