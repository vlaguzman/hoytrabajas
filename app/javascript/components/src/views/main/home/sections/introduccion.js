import React from 'react'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import Button from '@material-ui/core/Button'
import Card from '@material-ui/core/Card'
import CardContent from '@material-ui/core/CardContent'
import {
  ResponsiveTitle,
  ResponsiveText,
  ResponsiveWrapper,
  ResponsiveButton
} from './styles'

const Introduccion = () => {
  return (
    <Row className="bg-white my-70 special-padding align-items-start px-50 bg-white justify-content-around">
      <Col xs={12} lg={6} className="px-0 py-25 pr-25 justify-content-start">
        <img
          src="/assets/static/img/femcomp.png"
          className="img-fluid"
          alt=""
        />
      </Col>
      <Col xs={12} lg={5} className="">
        <Card className="light_shadow12 d-lg-flex d-none">
          <CardContent className="px-70 py-30">
            <Typography className="fw-bold mt-40 px-10" variant="h6">
              Encontrar el empleado ideal nunca fue tan fácil
            </Typography>
            <Typography
              className="my-25 text-left px-10"
              style={{ lineHeight: '1.75', color: '#999999' }}
              variant="body2"
            >
              Ingresa a nuestra plataforma, llena los formularios con los datos de tu empresa, registra tu oferta laboral y luego BITO, nuestro robot haciendo uso de algoritmos de inteligencia artificial va a identificar los candidatos indicados para tu ofert
            </Typography>
            {/*<Button
              color="primary"
              className="text-uppercase mt-10 w-40 mb-40"
              variant="outlined"
              aria-label="Leer más"
              size="large"
              style={{ borderRadius: '50px' }}
            >
              <Typography className="fw-bold" variant="caption">
                Leer más »
              </Typography>
            </Button>*/}
          </CardContent>
        </Card>
        <ResponsiveWrapper className="d-lg-none px-20">
          <ResponsiveTitle className="fw-bold mt-25" variant="h6">
            Encontrar el empleado ideal nunca fue tan fácil
          </ResponsiveTitle>
          <ResponsiveText className="my-25 text-justify" variant="body2">
              Ingresa a nuestra plataforma, llena los formularios con los datos de tu empresa, registra tu oferta laboral y luego BITO, nuestro robot haciendo uso de algoritmos de inteligencia artificial va a identificar los candidatos indicados para tu ofert
          </ResponsiveText>
          {/*<ResponsiveButton
            color="primary"
            className="my-10"
            variant="outlined"
            aria-label="Leer más"
          >
            <ResponsiveText variant="caption" style={{ textTransform: 'none' }}>
              Leer más »
            </ResponsiveText>
          </ResponsiveButton>*/}
        </ResponsiveWrapper>
      </Col>
    </Row>
  )
}

export default Introduccion
