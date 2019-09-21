import React, { Fragment, useState } from 'react'
import { Row, Col } from 'reactstrap'
import Card from '@material-ui/core/Card'
import CardContent from '@material-ui/core/CardContent'
import NavigateNext from '@material-ui/icons/NavigateNext'
import FiberManual from '@material-ui/icons/FiberManualRecord'
import Typography from '@material-ui/core/Typography'
import Button from '@material-ui/core/Button'
import IconButton from '@material-ui/core/IconButton'
import SlideOne from './tutorialSlideOne'
import SlideTwo from './tutorialSlideTwo'

const Tutorial = () => {
  const [{ slide }, setState] = useState({ slide: true })
  return (
    <Fragment>
      <Row className="position-relative flex-row-reverse align-items-start my-70">
        <Col xs={12} lg={6}>
          <Row noGutters className="justify-content-end">
            {slide ? <SlideOne /> : <SlideTwo />}
            <img
              src="/assets/static/img/cellphone.png"
              className="position-absolute cellphone"
              alt=""
              // height="100%"
              width="100%"
            />
            <img
              src="/assets/static/img/ondas.png"
              className="d-block special-margin-ondas"
              alt=""
              // height="100%"
              width="80%"
            />
            <IconButton
              size='small'
              variant="outlined"
              color="primary"
              className="position-absolute first_point"
              onClick={() => setState({ slide: true })}
              style={{zIndex: '99'}}
            >
              <FiberManual style={{fontSize: '0.7rem'}} />
            </IconButton>
            <IconButton
              size='small'
              variant="outlined"
              color="primary"
              className="position-absolute second_point"
              onClick={() => setState({ slide: false })}
              style={{zIndex: '99'}}
            >
              <FiberManual style={{fontSize: '0.7rem'}} />
            </IconButton>
          </Row>
        </Col>
        <Col xs={12} lg={6} className='mt-70 special-back-tutorial'>
          <Row className="p-50 justify-content-center align-items-start pt-70">
            <Col
              xs={12}
              md={7}
              className="justify-content-center"
            >
              <div className="mt-30">
                <Typography className="fw-bold mt-40 px-10" variant="h6">
                  Hoy no es fácil encontrar un empleo flexible por horas
                </Typography>
                <Typography className="my-25 text-left px-10" style={{lineHeight: '1.75', color: '#999999'}} variant="body2">
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
                  do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                  Ut enim ad minim veniam, quis nostrud exercitation ullamco
                  laboris nisi ut aliquip ex ea commodo consequat.
                </Typography>
                <Button
                  color="primary"
                  className="text-uppercase mt-10 w-40 mb-40"
                  variant="outlined"
                  aria-label="more"
                  size="large"
                  style={{ borderRadius: '20px' }}
                >
                  <Typography
                    className=""
                    variant="caption"
                  >
                    Leer Más
                  </Typography>
                </Button>
              </div>
            </Col>
          </Row>
        </Col>
      </Row>
    </Fragment>
  )
}

export default Tutorial
