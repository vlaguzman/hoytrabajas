import React from 'react';
import Slider from 'react-slick';
import PropTypes from 'prop-types';

const CarouselRow = ({ children }) => {
    const settings = {
      dots: true,
      // lazyLoad: true,
      infinite: true,
      speed: 500,
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: false,
      autoplay: false,
      autoplaySpeed: 5000,
      cssEase: "linear",
      adaptiveHeight: false,
      responsive: [
        {
          breakpoint: 1024,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1,
          }
        },
        {
          breakpoint: 425,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1,
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
    };
    return (
      <Slider {...settings} className="align-items-stretch h-100 my-25" >
        {children}
      </Slider>
    );
}

CarouselRow.propTypes = {
  items: PropTypes.array,
}

export default CarouselRow;