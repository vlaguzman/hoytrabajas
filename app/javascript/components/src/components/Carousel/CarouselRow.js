import React from 'react'
import Slider from 'react-slick'
import PropTypes from 'prop-types'

const CarouselRow = props => {
  const {
    children,
    slidesToShow = 3,
    arrows,
    slidesToShowResp = 1,
    autoplay = true,
    centerMode = false,
    infinite = false,
    dots = true
  } = props
  const settings = {
    dots,
    // lazyLoad: true,
    infinite,
    speed: 500,
    slidesToShow,
    slidesToScroll: 1,
    centerMode,
    arrows,
    autoplay,
    swipeToSlide: true,
    autoplaySpeed: 5000,
    cssEase: 'linear',
    adaptiveHeight: false,
    responsive: [
      {
        breakpoint: 1026,
        settings: {
          slidesToShow: 2.5,
          slidesToScroll: 1
        }
      },
      {
        breakpoint: 802,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      },
      {
        breakpoint: 427,
        settings: {
          slidesToShow: slidesToShowResp,
          slidesToScroll: 1
        }
      },
      {
        breakpoint: 377,
        settings: {
          slidesToShow: slidesToShowResp,
          slidesToScroll: 1
        }
      },
      {
        breakpoint: 327,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1,
          centerMode: false
        }
      }
    ]
  }
  return (
    <Slider {...settings} className="align-items-stretch h-100 w-100 my-25">
      {children}
    </Slider>
  )
}

CarouselRow.propTypes = {
  items: PropTypes.array
}

export default CarouselRow
