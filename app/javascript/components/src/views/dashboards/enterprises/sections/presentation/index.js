import React, {Fragment} from 'react'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import Button from '@material-ui/core/Button'

const Presentation = () => {
  return (
    <Fragment>
    <Row className="position-absolute" style={{ top: '0px', left: '0px' }}>
      <Col>
        <img
          width="100%"
          src="/static/img/bg-dashboard.png"
          alt="background"
        />
      </Col>
    </Row>
    <Row className="my-70 d-none d-lg-flex" />
    <Row className="my-30 d-lg-none" />
    <Row noGutters className="w-100 bg_dashCand p-30 pt-50">
    <Col xs={12} lg={6} className='d-lg-none'>
        <Row className="justify-content-center">
          <img
            width="100%"
            src="/static/img/back-dash-empresa.png"
            alt="background"
          />
        </Row>
      </Col>
      <Col xs={12} lg={6} className="align-items-center d-none d-lg-inline">
        <Row noGutters className="p-20 justify-content-center">
          <div>
            <Col>
              <Typography className="text-left" variant="h2">
                Lorem ipsum dolor
              </Typography>
              <Typography className="text-left text-warning" variant="h2">
                quis nostrud.
              </Typography>
            </Col>
            <Typography className="my-25 w-60" variant="body2">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque
              lectus ligula, lacinia in.
            </Typography>
            <Button
              className="mt-25 fw-bold"
              color="primary"
              style={{ borderRadius: '30px', textTransform: 'none' }}
              variant="contained"
            >
              <span className="text-white">Crecer a Premium</span>
            </Button>
          </div>
        </Row>
      </Col>
      <Col xs={12} lg={6} className="align-items-center d-lg-none mt-70">
        <Row noGutters className="justify-content-center">
          <Typography className="text-left text-center fw-bold mb-0" variant="h5">
              Lorem ipsum dolor
            </Typography>
            <Typography className="text-left text-center fw-bold text-warning" variant="h5">
              quis nostrud.
            </Typography>
            <Typography className="my-25 w-100 text-center" variant="body2">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque
              lectus ligula, lacinia in.
            </Typography>
            <Button
              className="mt-25 fw-bold mx-auto"
              color="primary"
              style={{ borderRadius: '30px', textTransform: 'none' }}
              variant="contained">
              <span className="text-white">Crecer a Premium</span>
            </Button>
        </Row>
      </Col>
      <Col xs={12} lg={6} className='d-lg-flex d-none'>
        <Row className="justify-content-end">
          <img
            width="75%"
            src="/static/img/back-dash-empresa.png"
            alt="background"
          />
        </Row>
      </Col>
    </Row>
  </Fragment>   
  )
}

export default Presentation





