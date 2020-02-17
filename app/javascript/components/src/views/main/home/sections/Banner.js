import React from 'react'
import PropTypes from 'prop-types'

const Banner = ({ translations }) => {
  return (
    <div className="t-home__banner">
      <div className="bannerContainer a-shadow__1 d-flex align-items-center">
        <h5 className="bannerText fw-bold color__blue-main">
          {translations.title}
        </h5>
        <img
          src="/assets/static/img/img-contact-candidate.png"
          alt="Banner"
          height="100%"
        />
      </div>
    </div>
  )
}

Banner.propTypes = {
  translations: PropTypes.shape({
    title: PropTypes.string.isRequired
  }).isRequired
}

export default Banner
