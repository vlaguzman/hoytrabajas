import React, { Fragment } from 'react'
import { Row, Col } from 'reactstrap'
import Button from '@material-ui/core/Button';
// import IntlMessages from 'Util/IntlMessages'
import Cards from './components/gallery_cards/gallery_card'
import Carousel from '../../../../components/Carousel/CarouselRow'

const ofertas = Array(6).fill(null)

export default () => {
  // listast: map, filter, reduce
  // map (list, f(x)) -> list
  // lista = [2, 3, 7], f(x){x+1}     map(lista, f)->[3, 4, 8]
  // filter (lista, f) -> lista   f(x){x>4} filtre(lita, f)->[7]
  // reduce (lista, f) -> escalar sum, max, min, avg
  //reduce(lista, sum) -> 12
  //reduce(lista, min) -> 2
  //reduce(lista, pares_sumados) -> [5, 10]

  let lasOfertas = ofertas.map((e, i) => {
       return (  <Cards key = {i} /> )
      })
  return (
    <div className="">
      <h1>Offers</h1>
      <div className="sec-title mt-20 mb-40 mx-10  text-center">
        el trabajo ideal &nbsp;<span className="text-primary">si existe</span>&nbsp;
        esta en hoy trabajas
      </div>
      <Carousel slidesToShowResp={1} centerMode={true} infinite={true} slidesToShow={3.7} autoplay={false} >
        {lasOfertas}
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
            ver más ofertas
          </Button>
        </Col>
      </Row>
    </div>
  )
}
