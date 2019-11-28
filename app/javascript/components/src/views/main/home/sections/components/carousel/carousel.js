import React from 'react'
import Slider from 'react-slick'
import PropTypes from 'prop-types'
import map from 'lodash/map'
import Unidad from '../categories_components/categoryUnit'

const CarouselRow = ({ items = [], handleJobCategory }) => {
  const settings = {
    dots: false,
    // lazyLoad: true,
    infinite: true,
    speed: 500,
    slidesToShow: 8,
    slidesToScroll: 1,
    arrows: true,
    autoplay: false,
    autoplaySpeed: 5000,
    cssEase: 'linear',
    adaptiveHeight: false,
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 4,
          slidesToScroll: 1
        }
      },
      {
        breakpoint: 425,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2
        }
      },
      {
        breakpoint: 375,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
    ]
  }
  return (
    <Slider {...settings} className=" p-10 my-25 carusel">
      {map(items['categorias'], (item, i) => (
        <Unidad key={i} {...item} handleJobCategory={handleJobCategory} />
      ))}
    </Slider>
  )
}

CarouselRow.propTypes = {
  items: PropTypes.array,
  handleJobCategory: PropTypes.func
}

export default CarouselRow
