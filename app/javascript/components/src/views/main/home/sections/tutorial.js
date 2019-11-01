import React, { useState } from 'react'
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
import {
  ResponsiveTitle,
  ResponsiveText,
  ResponsiveWrapper,
  ResponsiveButton
} from './styles'

const Tutorial = () => {
  const [{ slide }, setState] = useState({ slide: true })
  return (
    <>
      <Row className="position-relative flex-row-reverse align-items-start my-70">
        <Col xs={12} lg={6}>
          <Row noGutters className="justify-content-end">
            {slide ? <SlideOne /> : <SlideTwo />}
            <img
              src="/assets/static/img/cellphone.png"
              className="position-absolute cellphone"
              alt=""
              width="100%"
            />
            <img
              src="/assets/static/img/ondas.png"
              className="d-block special-margin-ondas"
              alt=""
              width="80%"
            />
            <IconButton
              size="small"
              variant="outlined"
              color="primary"
              className="position-absolute first_point"
              onClick={() => setState({ slide: true })}
              style={{ zIndex: '99' }}
            >
              <FiberManual style={{ fontSize: '0.7rem' }} />
            </IconButton>
            <IconButton
              size="small"
              variant="outlined"
              color="primary"
              className="position-absolute second_point"
              onClick={() => setState({ slide: false })}
              style={{ zIndex: '99' }}
            >
              <FiberManual style={{ fontSize: '0.7rem' }} />
            </IconButton>
          </Row>
        </Col>
        <Col xs={12} lg={6} className="mt-70 special-back-tutorial">
          <Row className="p-50 justify-content-center align-items-start pt-70">
            <Col xs={12} md={7} className="justify-content-center">
              <ResponsiveWrapper className="mt-30">
                <ResponsiveTitle className="fw-bold mt-40 px-10" variant="h6">
                  Hoy no es fácil encontrar un empleo flexible por horas
                </ResponsiveTitle>
                <ResponsiveText
                  className="my-25 text-left px-10"
                  style={{ lineHeight: '1.75', color: '#999999' }}
                  variant="body2"
                >
                  En nuestra plataforma puedes encontrar un porcentaje de afinidad
                  que te ayuda a ver primero las ofertas que realmente se adaptan
                  a tu perfil, adicionalmente te damos la oportunidad que seas relevante
                  en aquellas ofertas en las que realmente quieres participar.
                </ResponsiveText>
                {/*<ResponsiveButton
                  color="primary"
                  className="my-10"
                  variant="outlined"
                  aria-label="Leer más"
                >
                  <ResponsiveText
                    variant="caption"
                    style={{ textTransform: 'none' }}
                  >
                    Leer más »
                  </ResponsiveText>
                </ResponsiveButton>*/}
              </ResponsiveWrapper>
            </Col>
          </Row>
        </Col>
      </Row>
    </>
  )
}

export default Tutorial
