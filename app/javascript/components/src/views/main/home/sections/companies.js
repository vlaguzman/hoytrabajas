import React from 'react'
import Typography from '@material-ui/core/Typography'
import { Row, Col } from 'reactstrap'
import CompaniesList from 'Views/main/home/sections/components/companiesList'
import CarouselRow from 'Components/Carousel/CarouselRow'
import { map } from 'lodash'



export default ({ catalogo, title: { main, subtitle } }) => {
  return (
    <div className="my-50">
      <div className="mt-20 mb-40 d-flex flex-column justify-content-center align-items-center">
        <Typography className="fw-bold" variant="h5">
          {main}
        </Typography>
        <Typography className="fw-bold" variant="caption">
          {subtitle}
        </Typography>
      </div>
      <Row
        className="flex-wrap justify-content-center align-items-center d-none d-md-flex px-20"
      >
        <CompaniesList {...{ catalogo }} />
      </Row>
      <Row
        className="justify-content-center align-items-center d-md-none w-90 mx-auto" >
        <CarouselRow className='w-75' slidesToShow={3} infinite={true} dots={false}
           slidesToShowResp={1.68} centerMode={true}>
        {
      map(catalogo,(e, i) => {
        return (
          <Col
            // xs={12}
            key={i}
            className="justify-content-center align-items-center"
            style={{
              // maxWidth: '138.3px',
              // maxHeight: '138.3',
              overflow: 'hidden'
            }}
          >
            <img
              className="w-100"
              src={`/static/img/logos/clientes-ht-${i + 1}.jpg`}
              alt="client"
            />
          </Col>
        )
      })}
        </CarouselRow>
      </Row>
    </div>
  )
}
