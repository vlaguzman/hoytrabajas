import React from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import Button from '@material-ui/core/Button'

const Presentation = ({
  title_one,
  title_two,
  title_decription,
  welcome_to_your,
  dashborad,
  grow_to_premium,
  presentation_description
}) => {
  return (
    <>
      <Row className="position-absolute" style={{ top: '0px', left: '0px' }}>
        <Col>
          <img
            width="100%"
            src="/assets/static/img/bg-dashboard.png"
            alt="background"
          />
        </Col>
      </Row>
      <Row className="my-70 d-none d-lg-flex" />
      <Row className="my-30 d-lg-none" />
      <Row noGutters className="w-100 bg_dashCand p-30 pt-50">
        <Col xs={12} lg={6} className="d-lg-none">
          <Row className="justify-content-center">
            <img
              width="100%"
              src="/assets/static/img/back-dash-candidato.png"
              alt="background"
            />
          </Row>
        </Col>
        <Col xs={12} lg={6} className="align-items-center d-none d-lg-inline">
          <Row noGutters className="p-20 justify-content-center">
            <div>
              <Typography className="text-left" variant="h2">
                {title_one}
              </Typography>
              <Typography className="text-left text-warning" variant="h2">
                {title_two}
              </Typography>
              <Typography className="my-25 w-60" variant="body2">
                {title_decription}
              </Typography>
              {/* <Button
                className="mt-25 fw-bold"
                color="primary"
                style={{ borderRadius: '30px', textTransform: 'none' }}
                variant="contained"
              >
                <span className="text-white">Volver premiun </span>
              </Button> */}
            </div>
          </Row>
        </Col>
        <Col xs={12} lg={6} className="align-items-center d-lg-none mt-70">
          <Row noGutters className="justify-content-center">
            <Col className="p-0 m-0">
              <Typography
                className="text-left text-center fw-bold mb-0"
                variant="h5"
              >
                {welcome_to_your}
              </Typography>
              <Typography
                className="text-left text-center fw-bold text-warning"
                variant="h5"
              >
                {dashborad}
              </Typography>
            </Col>
            <Typography className="my-25 w-100 text-center" variant="body2">
              {presentation_description}
            </Typography>
            <Button
              className="mt-25 fw-bold mx-auto"
              color="primary"
              style={{ borderRadius: '30px', textTransform: 'none' }}
              variant="contained"
            >
              <span className="text-white">{grow_to_premium}</span>
            </Button>
          </Row>
        </Col>
        <Col xs={12} lg={6} className="d-lg-flex d-none">
          <Row className="justify-content-end">
            <img
              width="75%"
              src="/assets/static/img/back-dash-candidato.png"
              alt="background"
            />
          </Row>
        </Col>
      </Row>
    </>
  )
}

export default Presentation

Presentation.propTypes = {
  title_one: PropTypes.string,
  title_two: PropTypes.string,
  title_decription: PropTypes.string,
  welcome_to_your: PropTypes.string,
  dashborad: PropTypes.string,
  grow_to_premium: PropTypes.string,
  presentation_description: PropTypes.string
}
