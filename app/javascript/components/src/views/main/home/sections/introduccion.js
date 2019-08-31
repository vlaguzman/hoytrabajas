import React from 'react'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import Button from '@material-ui/core/Button'
import Card from '@material-ui/core/Card'
import CardContent from '@material-ui/core/CardContent'

const Introduccion = () => {
  return (
    <Row 
    className="bg-white my-70 special-padding align-items-start px-50 bg-white justify-content-around">
      <Col xs={12} lg={6} className="px-0 py-25 pr-25 justify-content-start">
        <img
          src="/static/img/femcomp.png"
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
            <Typography className="my-25 text-left px-10" style={{lineHeight: '1.75', color: '#999999'}} variant="body2">
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
              eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
              enim ad minim veniam, quis nostrud exercitation ullamco laboris
              nisi ut aliquip ex ea commodo consequat.
            </Typography>
            <Button
              color="primary"
              className="text-uppercase mt-10 w-40 mb-40"
              variant="outlined"
              aria-label="Delete"
              size="large"
              style={{ borderRadius: '20px' }}
            >
              <Typography
                className="fw-bold"
                variant="caption"
                // style={{ fontSize: '.55rem' }}
              >
                Leer Más
              </Typography>
            </Button>
          </CardContent>
        </Card>
        <div className="d-lg-none px-20">
            <Typography className="fw-bold mt-25" variant="h6">
              Encontrar el empleado ideal nunca fue tan fácil
            </Typography>
            <Typography className="my-25 text-justify" variant="body2">
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
              eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
              enim ad minim veniam, quis nostrud exercitation ullamco laboris
              nisi ut aliquip ex ea commodo consequat.
            </Typography>
            <Button
              color="primary"
              className="text-uppercase my-10"
              variant="outlined"
              aria-label="Delete"
              style={{ borderRadius: '20px' }}
            >
              <Typography
                className=""
                variant="caption"
                style={{ fontSize: '.55rem' }}
              >
                Leer Más
              </Typography>
            </Button>
        </div>
      </Col>
    </Row>
  )
}

export default Introduccion
