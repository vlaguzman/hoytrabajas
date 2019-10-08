import PropTypes from 'prop-types'
import React, { Fragment } from 'react'
import { Row, Col } from 'reactstrap'
import Button from '@material-ui/core/Button'
import Cards from './components/gallery_cards/gallery_card'
import Carousel from '../../../../components/Carousel/CarouselRow'

const CarruselBlock = cards => (
  <div>
    <Carousel
      slidesToShowResp={1}
      centerMode
      slidesToShow={3.7}
      autoplay={false}
    >
      {cards}
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

const Gallery = ({ offers, title: { main, highlighted, last } }) => {
  const cards = offers.map(o => {
    return <Cards key={o['title']} offer={o} />
  })
  return (
    <div className="">
      <div className="sec-title mt-20 mb-40 mx-10  text-center">
        {main} &nbsp;<span className="text-primary">{highlighted}</span>&nbsp;
        {last}
      </div>
      {cards.length >= 1 ? (
        CarruselBlock(cards)
      ) : (
        <h1 className="text-center">No hay ningún trabajo en este momento</h1>
      )}
    </div>
  )
}
export default Gallery

Gallery.propTypes = {
  offers: PropTypes.shape({
    map: PropTypes.array
  }),
  title: PropTypes.shape({
    main: PropTypes.string.isRequired,
    highlighted: PropTypes.string.isRequired,
    last: PropTypes.string.isRequired
  })
}
