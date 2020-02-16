import React from 'react'
import PropTypes from 'prop-types'
import Slider from 'react-slick'
import FilterFormSection from './filterForm'

const bannerImages = [
  '/assets/static/img/home-banner2.jpg',
  '/assets/static/img/home-banner3.jpg'
]

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
      <Slider
        className="homeBanner__slider"
        autoplay
        slidesToScroll={1}
        slidesToShow={1}
        arrows={false}
        dots={false}
        swipeToSlide
        autoplaySpeed={4000}
      >
        {bannerImages.map(image => (
          <img src={image} alt="Home Banner" className="homeBanner__image" />
        ))}
      </Slider>
      <div className="homeBanner__responsive" />
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
