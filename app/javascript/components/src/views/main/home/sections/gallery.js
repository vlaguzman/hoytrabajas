import PropTypes from 'prop-types'
import React from 'react'
import { Row, Col } from 'reactstrap'
import Button from '@material-ui/core/Button'
import Cards from './components/gallery_cards/gallery_card'
import Carousel from '../../../../components/Carousel/CarouselRow'

const CarruselBlock = (cards, btn_more_offers) => (
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
          {btn_more_offers}
        </Button>
      </Col>
    </Row>
  </div>
)

const Gallery = ({
  offers,
  title: { main, highlighted, last },
  offer_translations
}) => {
  const cards = offers.map(o => {
    return (
      <Cards
        key={o['title']}
        offer={o}
        offer_translations={offer_translations}
      />
    )
  })
  return (
    <div className="">
      <div className="sec-title mt-20 mb-40 mx-10  text-center">
        {main} &nbsp;<span className="text-primary">{highlighted}</span>&nbsp;
        {last}
      </div>
      {cards.length >= 1 ? (
        CarruselBlock(cards, offer_translations.index.btn_more_offers)
      ) : (
        <h1 className="text-center"> {offer_translations.index.no_offers}</h1>
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
  }),
  offer_translations: PropTypes.shape({
    index: PropTypes.shape({
      no_offers: PropTypes.string.isRequired,
      btn_more_offers: PropTypes.string.isRequired
    })
  })
}
