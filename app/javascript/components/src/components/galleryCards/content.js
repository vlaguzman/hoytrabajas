import React from 'react'
import Button from '@material-ui/core/Button'
import Typography from '@material-ui/core/Typography'
import Avatar from '@material-ui/core/Avatar'
import Divider from '@material-ui/core/Divider'
import { Badge, Row, Col } from 'reactstrap'
import CardContent from '@material-ui/core/CardContent'

const Content = () => {
  return (
    <CardContent className="position-relative pb-5">
      <Avatar
        className="position-absolute"
        style={{ top: '-10rem', left: '6%', width: '4rem', height: '4rem' }}
        src="/assets/static/img/logos/clientes-ht-3.jpg"
      />
      <Badge
        color="primary"
        className="px-4 position-absolute font-weight-bolder new_badge"
        style={{ top: '-0.8rem', right: '1rem' }}
      >
        <span className="font-weight-bolder position-relative ml-20">
          <i
            className="ti-eye mr-5 pt-5 position-absolute"
            style={{ fontSize: '1rem', top: '-7px', left: '-20px' }}
          />
          <strong>Nuevo</strong>
        </span>
      </Badge>
      <Badge
        color="light"
        className="p-14 position-absolute font-weight-bolder text-dark bg-white"
        style={{ top: '-1.4rem', left: '1rem', fontSize: '0.93rem' }}
      >
        <span className="font-weight-bolder">
          <strong>COP 1&apos;200.000</strong>
        </span>
      </Badge>
      <Typography
        gutterBottom
        variant="h6"
        component="h1"
        className="mb-0 mt-10 fw-bold"
        style={{ fontSize: '18px' }}
      >
        Aux. de cocina comida rápida
      </Typography>
      <Typography
        gutterBottom
        variant="subtitle1"
        component="div"
        className="mb-10"
        style={{ fontWeight: '500', fontSize: '14px' }}
      >
        Paisa Wings
      </Typography>
      <Typography className="text-secondary" variant="body1" component="p">
        Importante franquicia sangucheria peruana ubicada en reconocidos…
      </Typography>
      <Typography variant="body1" className="my-10 text-secondary">
        <i
          className="ti-location-pin fw-bold mr-5"
          style={{ fontSize: '1rem' }}
        />
        Bogotá
        <i
          className="ti-hand-point-up fw-bold mr-5"
          style={{ fontSize: '1rem' }}
        />
        100
      </Typography>
      <Row className="mr-0 justify-content-between align-items-end px-10 mb-10">
        <Row className="mr-0 px-10">
          <Badge color="primary" className="text-uppercase mr-5 d-block">
            <small>Sin Experiencia</small>
          </Badge>
          <Badge color="success" className="text-uppercase d-block">
            <small>Inicio inmediato</small>
          </Badge>
        </Row>
      </Row>
      <Divider variant="middle" className="mx-0" />
      <Row className="justify-content-between mt-10 mr-0">
        <Typography
          variant="h6"
          className="text-muted text-right ml-10"
          component="span"
        >
          <strong>64%</strong>
          <Typography
            style={{ textTransform: 'none' }}
            component="span"
            variant="body1"
          >
            {' '}
            de afinidad{' '}
          </Typography>
        </Typography>
        <Typography variant="body1" className="fw-bold mt-10" component="span">
          <i
            className="ti-timer fw-bold text-primary mr-5"
            style={{ fontSize: '1rem' }}
          />
          24:00
        </Typography>
        {/* <Typography variant="body1" >
              <i className="ti-eye fw-bold text-primary mr-5" style={{fontSize: '1rem'}}></i> 
              2 días atrás
            </Typography> */}
      </Row>
    </CardContent>
  )
}

export default Content
