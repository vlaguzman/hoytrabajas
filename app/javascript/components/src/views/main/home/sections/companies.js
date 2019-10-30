import React from 'react'
import PropTypes from 'prop-types'
import Typography from '@material-ui/core/Typography'
import { Row, Col } from 'reactstrap'
import CompaniesList from './components/companiesList'
import CarouselRow from '../../../../components/Carousel/CarouselRow'
import { ResponsiveTitle } from './styles'

const catalogo = Array(13).fill(null)

const CompaniesSection = () => {
  return (
    <div className="pcx">
      <div
        className="mt-20 mb-40 d-flex flex-column justify-content-center align-items-center"
        style={{ textAlign: 'center' }}
      >
        <ResponsiveTitle className="fw-bold" variant="h5">
          Ellos hoy confian en nosotros
        </ResponsiveTitle>
        <Typography className="home__small-subtitle" variant="h5">
          para encontrar su empleado ideal
        </Typography>
      </div>
      <Row className="flex-wrap justify-content-center align-items-center d-none d-md-flex px-20">
        <CompaniesList {...{ catalogo }} />
      </Row>
      <Row className="justify-content-center align-items-center d-md-none w-90 mx-auto">
        <CarouselRow
          className="w-75"
          slidesToShow={3}
          infinite
          dots={false}
          slidesToShowResp={1.68}
          centerMode
        >
          {catalogo.map((e, i) => (
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
          ))}
        </CarouselRow>
      </Row>
    </div>
  )
}

export default CompaniesSection
