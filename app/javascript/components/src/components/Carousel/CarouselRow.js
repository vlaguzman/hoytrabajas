import React from 'react'
import Slider from 'react-slick'
import PropTypes from 'prop-types'

const CarouselRow = props => {
  const {
    children,
    slidesToShow = 3,
    arrows,
    slidesToShowTablet = null,
    slidesToShowResp = 1,
    centerModeResp = true,
    autoplay = true,
    centerMode = false,
    infinite = false,
    infiniteResp = true,
    dots = true
  } = props

  const settings = {
    dots,
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
        breakpoint: 992,
        settings: {
          slidesToShow: slidesToShowTablet || 2,
          slidesToScroll: 1
        }
      },
      {
        breakpoint: 762,
        settings: {
          slidesToShow: slidesToShowTablet || 1,
          slidesToScroll: 1
        }
      },
      {
        breakpoint: 576,
        settings: {
          slidesToShow: slidesToShowResp,
          slidesToScroll: 1,
          centerMode: centerModeResp,
          infinite: infiniteResp
        }
      },
      {
        breakpoint: 377,
        settings: {
          slidesToShow: slidesToShowResp,
          slidesToScroll: 1,
          centerMode: centerModeResp,
          infinite: infiniteResp
        }
      },
      {
        breakpoint: 327,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1,
          centerMode: centerModeResp,
          infinite: infiniteResp
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
  items: PropTypes.array,
  children: PropTypes.array,
  slidesToShow: PropTypes.number,
  arrows: PropTypes.bool,
  slidesToShowTablet: PropTypes.number,
  slidesToShowResp: PropTypes.number,
  centerModeResp: PropTypes.bool,
  autoplay: PropTypes.bool,
  centerMode: PropTypes.bool,
  infinite: PropTypes.bool,
  infiniteResp: PropTypes.bool,
  dots: PropTypes.bool
}

export default CarouselRow
