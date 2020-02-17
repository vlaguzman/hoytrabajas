import React from 'react'
import PropTypes from 'prop-types'
import Slider from 'react-slick'

const Steps = ({ translations }) => {
  const { title, stepsTitles, altText } = translations

  const renderSteps = () =>
    Object.keys(stepsTitles).map((key, index) => (
      <div className="homeStep" key={key}>
        <img
          src={`/assets/static/img/home-step-${key}`}
          alt={`${altText} ${index}`}
          className="stepImage"
        />
        <h5 className="stepTitle">{stepsTitles[key]}</h5>
      </div>
    ))

  return (
    <div className="t-home__steps">
      <h4 className="homeTitle color__blue-main">{title}</h4>
      <div className="homeGrid">{renderSteps()}</div>
      <Slider
        className="responsiveSlider"
        slidesToShow={1}
        slidesToScroll={1}
        arrows={false}
        dots
        centerMode={false}
        swipeToSlide
        autoplay
      >
        {renderSteps()}
      </Slider>
    </div>
  )
}

Steps.propTypes = {
  translations: PropTypes.shape({
    title: PropTypes.string.isRequired,
    stepsTitles: PropTypes.object.isRequired,
    altText: PropTypes.string.isRequired
  })
}

export default Steps
