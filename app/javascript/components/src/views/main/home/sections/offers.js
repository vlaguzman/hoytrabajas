import PropTypes from 'prop-types'
import React from 'react'
import { Row, Col } from 'reactstrap'
import Button from '@material-ui/core/Button'
import Cards from './components/gallery_cards/gallery_card'
import Carousel from '../../../../components/Carousel/CarouselRow'

const Gallery = ({ offers }) => {
  return (
    <div className="">
      <h1>Encuentra la mejor oferta para ti</h1>
      <Carousel
        slidesToShowResp={1}
        centerMode
        slidesToShow={3.7}
        autoplay={false}
      >
        {offers.map(e => {
          return <Cards key={e.title} offer={e} />
        })}
      </Carousel>
      <Row className="justify-content-center align-items-center  my-30 ">
        <Col xs={9} md={4}>
          <Button
            color="primary"
            size="large"
            variant="outlined"
            className="my-20 text-wrap"
            style={{ borderRadius: '50px' }}
            href="/offers"
          >
            ver más ofertas
          </Button>
        </Col>
      </Row>
    </div>
  )
}
export default Gallery

Gallery.propTypes = {
  offers: PropTypes.shape({
    map: PropTypes.array
  })
}
