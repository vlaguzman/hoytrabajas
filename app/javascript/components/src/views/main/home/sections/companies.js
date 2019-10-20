import React from 'react'
import PropTypes from 'prop-types'
import Typography from '@material-ui/core/Typography'
import { Row, Col } from 'reactstrap'
import CompaniesList from '../../../../views/main/home/sections/components/companiesList'
import CarouselRow from '../../../../components/Carousel/CarouselRow'
import AppLayout from '../../../../components/Layout/AppLayout'


const catalogo = Array(13).fill(null)

export default () => {
  return (
    <div className="my-50">
      <div className="mt-20 mb-40 d-flex flex-column justify-content-center align-items-center">
        <Typography className="fw-bold" variant="h5">
          Ellos hoy confian en nosotros
        </Typography>
        <Typography className="fw-bold" variant="caption">
          para encontrar su empleado ideal
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
      catalogo.map((e,i) => (
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
              src={`/assets/static/img/logos/clientes-ht-${i + 1}.jpg`}
              alt="client"
            />
          </Col>
        )
      )}
        </CarouselRow>
      </Row>
    </div>
  )
}
