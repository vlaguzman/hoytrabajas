import React, { Fragment } from 'react'
import { Row, Col } from 'reactstrap'
import Button from '@material-ui/core/Button';
// import IntlMessages from 'Util/IntlMessages'
import Cards from './components/gallery_cards/gallery_card'
import Carousel from 'Components/Carousel/CarouselRow'
import { map } from 'lodash';


export default ({
  children,
  ofertas,
  button,
  title: { main, highlighted, last }
}) => {
  return (
    <div className="">
      <div className="sec-title mt-20 mb-40 mx-10  text-center">
        {main}&nbsp;<span className="text-primary">{highlighted}</span>&nbsp;
        {last}
      </div>
      <Carousel slidesToShowResp={1} centerMode={true} infinite={true} slidesToShow={3.7} autoplay={false} >
      {map(ofertas,(e, i) => (
        <Cards key={i} />
      ))}
      </Carousel>
      <Row className="justify-content-center align-items-center  my-30 ">
        <Col xs={9} md={4}>
          <Button
          color='primary'
            size="large"
            variant='outlined'
            className="my-20 text-wrap"
            style={{ borderRadius: '50px' }}
          >
            {button}
          </Button>
        </Col>
      </Row>
    </div>
  )
}
