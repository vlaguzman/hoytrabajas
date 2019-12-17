import React from 'react'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import Divider from '@material-ui/core/Divider'
import AppConfig from '../../../constants/AppConfig'

const UnderFooter = ({underFooterTranslations={}, termAndConditionsPath=''}) => {
  return (
    <div className="row" style={{ backgroundColor: 'rgba(41, 39, 39, 1)' }}>
      <Row
        className="px-70 justify-content-between text-white py-25 d-none d-md-flex w-100"
        style={{ backgroundColor: 'rgba(41, 39, 39, 1)' }}
      >
        <Col xs={12} md={6} className="">
          <Row
            noGutters
            className="justify-content-start align-items-center my-20"
          >
            <Col xs={5} md={3} className="">
              <img
                src="/assets/static/img/appLogoW.svg"
                className="d-block"
                alt="site logo"
                width="100%"
              />
            </Col>
            <Col xs={7} md={9}>
              <Typography
                variant="caption"
                component="span"
                className="d-inline-block mt-5 ml-5"
              >
                Un proyecto 100% Colombiano
              </Typography>
            </Col>
          </Row>
          <Divider
            variant="middle"
            className="d-md-none"
            style={{ background: 'rgb(93, 90, 90)' }}
          />
        </Col>
        <Col className="">
          <Row
            noGutters
            className="justify-content-end align-items-center h-100"
          >
            <Col xs={12} md={2} className="text-center">
              <Typography variant="body2">
                <a href="/companies">Empresas</a>
              </Typography>
            </Col>
            <Col xs={12} md={2} className="text-center">
              <Typography variant="body2">
                <a href="/job_categories">Categorias de empleo</a>
              </Typography>
            </Col>
            <Col xs={12} md={2} className="text-center">
              <Typography variant="body2">
                <a href="/faqs">FAQs</a>
              </Typography>
            </Col>
            <Col xs={12} md={2} className="text-center">
              <Typography variant="body2">Contacto</Typography>
            </Col>
            <Col xs={12} md={4} className="text-center">
              <a href={termAndConditionsPath} target='blank'>
                <Typography variant="body2">{underFooterTranslations.terms_and_conditions}</Typography>
              </a>
            </Col>
          </Row>
        </Col>
      </Row>

      <Row
        className="px-40 justify-content-between text-white py-25 d-md-none"
        style={{ backgroundColor: 'rgba(41, 39, 39, 1)' }}
      >
        <Col className="mb-50">
          <Row noGutters className="justify-content-end h-100">
            <Col xs={12} md={2} className="align-items-center">
              <Typography variant="body2">FAQs</Typography>
            </Col>
            <Col xs={12} md={2} className="align-items-center">
              <Typography variant="body2">Contacto</Typography>
            </Col>
            <Col xs={12} md={4} className="align-items-center">
              <a href={termAndConditionsPath} target='blank'>
                <Typography variant="body2">{underFooterTranslations.terms_and_conditions}</Typography>
              </a>
            </Col>
          </Row>
        </Col>
        <Col xs={12} md={6} className="">
          <Divider
            variant="middle"
            className="d-md-none"
            style={{ background: 'rgb(93, 90, 90)' }}
          />
          <Row
            noGutters
            className="justify-content-start align-items-center  mt-20 mb-10"
          >
            <Col xs={5} md={3} className="">
              <img
                src="/assets/static/img/appLogoW.svg"
                className="d-block"
                alt="site logo"
                width="100%"
              />
            </Col>
            <Col xs={7} md={9}>
              <Typography
                variant="caption"
                component="span"
                className="d-inline-block mt-5"
              >
                Un proyecto 100% Colombiano
              </Typography>
            </Col>
          </Row>
          <div
            className="d-inline-block text-white text-left w-100"
            style={{ marginBottom: '2%' }}
          >
            {' '}
            <small className="">Con el apoyo de : </small>{' '}
            <img
              className="rockstart"
              alt="rockstart"
              src="/assets/static/img/logo_rock.png"
            />{' '}
          </div>
          <div
            className="d-inline-block text-white text-left w-100"
            style={{ marginBottom: '5%' }}
          >
            <small className="text-muted">
              Desarrollo: {AppConfig.copyRightText}
            </small>
          </div>
        </Col>
      </Row>
      <Divider
        variant="middle"
        className="px-50 mx-auto px-50 w-75 d-none d-md-block"
        style={{ background: 'rgb(93, 90, 90)' }}
      />
      <Col
        className="align-items-center justify-content-center pcx mt-50 d-none d-md-block"
        style={{ backgroundColor: 'rgba(41, 39, 39, 1)' }}
      >
        <Col className="d-flex flex-column justify-content-center w-100">
          <div
            className="d-inline-block text-white text-center w-100"
            style={{ marginBottom: '2%' }}
          >
            {' '}
            <small className="">Con el apoyo de : </small>{' '}
            <img
              className="rockstart"
              alt="rockstart"
              src="/assets/static/img/logo_rock.png"
            />{' '}
          </div>
          <div
            className="d-inline-block text-white text-center w-100"
            style={{ marginBottom: '5%' }}
          >
            <small className="text-muted">
              Desarrollo: {AppConfig.copyRightText}
            </small>
          </div>
        </Col>
      </Col>
    </div>
  )
}

export default UnderFooter
