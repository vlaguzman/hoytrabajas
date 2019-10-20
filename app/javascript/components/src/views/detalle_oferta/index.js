import React from 'react'
// import Head from 'next/head'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import Paper from '@material-ui/core/Paper'
import PropTypes from 'prop-types'
import CardContent from '@material-ui/core/CardContent'
import Card from '@material-ui/core/Card'
import Chip from '@material-ui/core/Chip'
import Button from '@material-ui/core/Button'
import Divider from '@material-ui/core/Divider'
import { Badge } from 'reactstrap'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import Avatar from '@material-ui/core/Avatar'
import classNames from 'classnames'
import Cards from '../main/home/sections/components/gallery_cards/gallery_card'
import Carousel from '../../components/Carousel/CarouselRow'

import AppLayout from '../../components/Layout/AppLayout'

const relatedOffersCards = relatedOffers => {
  return relatedOffers.map(relatedOffer => (
    <Cards key={relatedOffer['title']} offer={relatedOffer} />
  ))
}

const DetallePage = ({
  offer,
  relatedOffers,
  pathAppliedOffers,
  translationOffer,
  csrf_name,
  csrf_token,
  log_out_companies,
  company_signed_in,
  user_signed_in,
  session_translation,
  log_out_user
}) => {
  const valueButton = offer.is_applied ? 'Aplicado' : 'Aplicar a esta oferta'

  return (
    <div className="detalle-wrapper">
      {/* <Row style={{background: 'white', height: '5rem'}}></Row> */}

      <AppLayout
        log_out_companies={log_out_companies}
        company_signed_in={company_signed_in}
        user_signed_in={user_signed_in}
        log_out_user={log_out_user}
        csrf_param={csrf_name}
        csrf_token={csrf_token}
        session_translation={session_translation}
      >
        <Row
          className="position-relative"
          style={{ background: 'white', height: '13rem' }}
        >
          <div
            className="position-absolute w-100"
            style={{ background: '#fff9e4', height: '16rem' }}
          />
        </Row>

        <Row className="pcx align-items-start mb-30">
          <Col xs={8}>
            <Paper className="p-50">
              <Row className="justify-content-between mx-0">
                <Typography className="fw-bold" variant="h5" component="span">
                  {offer.title}
                </Typography>
                <Chip
                  color="primary"
                  className="text-white"
                  label={
                    <>
                      <Typography
                        className="fw-bold"
                        variant="h6"
                        component="span"
                      >
                        64%
                      </Typography>
                      &nbsp;
                      <Typography
                        className="fw-bold"
                        variant="body1"
                        component="span"
                      >
                        {translationOffer.affinity}
                      </Typography>
                    </>
                  }
                />
              </Row>
              <Row className="my-10 mx-0">
                <Chip
                  className="mr-10"
                  variant="outlined"
                  label="Tecnología y programación"
                />
                {offer.immediate_start && (
                  <Badge color="primary">Incorporación inmediata </Badge>
                )}
              </Row>
              <Row className="my-10 mx-0">
                <Typography variant="caption">
                  <span className="fw-bold">{translationOffer.close}</span>
                  {offer.close_date}
                </Typography>
                <Typography className="ml-10" variant="caption">
                  {' '}
                  <span className="fw-bold"> 26</span>
                  {translationOffer.aplications}
                </Typography>
              </Row>
              <Divider variant="middle" className="mx-0 my-10" />
              <Typography variant="body1">{offer.description}</Typography>
              <form action={pathAppliedOffers} method="post">
                <input type="hidden" name={csrf_name} value={csrf_token} />
                <input type="hidden" name="_method" value="post" />
                <input
                  type="hidden"
                  name="applied_offer[offer_id]"
                  value={offer.id_offer}
                />
                <Button
                  variant="contained"
                  type="submit"
                  color="primary"
                  className={classNames('text-white my-50', {
                    'button-disabled': offer.is_applied
                  })}
                  style={{ borderRadius: '50px' }}
                >
                  {valueButton}
                </Button>
              </form>
              <Row className="justify-content-between">
                <Col xs={6}>
                  <Typography variant="body1" className="">
                    {translationOffer.targeted_offer}
                  </Typography>
                </Col>
                <Col xs={6}>
                  <Typography variant="body1" className="fw-bold">
                    {offer.sex.description}
                  </Typography>
                </Col>
              </Row>
              <Row className="justify-content-between">
                <Col xs={6}>
                  <Typography variant="body1" className="">
                    {translationOffer.age}
                  </Typography>
                </Col>
                <Col xs={6}>
                  <Typography
                    variant="body1"
                    className="fw-bold"
                  >{`${offer.age_range.from} a ${offer.age_range.to}`}</Typography>
                </Col>
              </Row>
              <Row className="justify-content-between">
                <Col xs={6}>
                  <Typography variant="body1" className="">
                    {translationOffer.vacancy_numbers}
                  </Typography>
                </Col>
                <Col xs={6}>
                  <Typography variant="body1" className="fw-bold">
                    {offer.vacancies_quantity}
                  </Typography>
                </Col>
              </Row>
              <Row className="justify-content-between">
                <Col xs={6}>
                  <Typography variant="body1" className="">
                    {translationOffer.recident}
                  </Typography>
                </Col>
                <Col xs={6}>
                  <Typography variant="body1" className="fw-bold">
                    {offer.city.description}
                  </Typography>
                </Col>
              </Row>
              <Row className="justify-content-between">
                <Col xs={6}>
                  <Typography variant="body1" className="">
                    {translationOffer.experience}
                  </Typography>
                </Col>
                <Col xs={6}>
                  <Typography variant="body1" className="fw-bold">
                    {' '}
                    {offer.required_experience
                      ? 'Requerida'
                      : 'No requerida'}{' '}
                  </Typography>
                </Col>
              </Row>
              <Row className="justify-content-between">
                <Col xs={6}>
                  <Typography variant="body1" className="">
                    {translationOffer.lenguage}
                  </Typography>
                </Col>
                <Col xs={6}>
                  <Typography variant="body1" className="fw-bold">
                    {' '}
                    {offer.languages.map(language => (
                      <div>{language}</div>
                    ))}{' '}
                  </Typography>
                </Col>
              </Row>
              <Divider variant="middle" className="mx-0 my-30" />

              <Row className="justify-content-between">
                <Col xs={6}>
                  <Typography variant="body1" className="">
                    {translationOffer.type_ofert}
                  </Typography>
                </Col>
                <Col xs={6}>
                  <Typography variant="body1" className="fw-bold">
                    {offer.offer_type.description}
                  </Typography>
                </Col>
              </Row>
              <Row className="justify-content-between">
                <Col xs={6}>
                  <Typography variant="body1" className="">
                    {translationOffer.work_mode}
                  </Typography>
                </Col>
                <Col xs={6}>
                  <Typography variant="body1" className="fw-bold">
                    {offer.work_mode.description}
                  </Typography>
                </Col>
              </Row>
              <Row className="justify-content-between">
                <Col xs={6}>
                  <Typography variant="body1" className="">
                    {translationOffer.terms}
                  </Typography>
                </Col>
                <Col xs={6}>
                  <Typography variant="body1" className="fw-bold">
                    {offer.contract_type.description}
                  </Typography>
                </Col>
              </Row>
              <Row className="justify-content-between">
                <Col xs={6}>
                  <Typography variant="body1" className="">
                    {translationOffer.salary}
                  </Typography>
                </Col>
                <Col xs={6}>
                  <Typography
                    variant="body1"
                    className="fw-bold"
                  >{`${offer.salary.currency.description} ${offer.salary.from}/${offer.salary.salary_period.description}`}</Typography>
                </Col>
              </Row>
              <Row className="justify-content-between">
                <Col xs={6}>
                  <Typography variant="body1" className="">
                    {translationOffer.days}
                  </Typography>
                </Col>
                <Col xs={6}>
                  <Typography variant="body1" className="fw-bold">
                    {offer.available_work_days.map(value => (
                      <div>{value}</div>
                    ))}
                  </Typography>
                </Col>
              </Row>
              <Row className="justify-content-between">
                <Col xs={6}>
                  <Typography variant="body1" className="">
                    {translationOffer.working_day}
                  </Typography>
                </Col>
                <Col xs={6}>
                  <Typography variant="body1" className="fw-bold">
                    {offer.working_days.map(value => (
                      <div>{value}</div>
                    ))}
                  </Typography>
                </Col>
              </Row>
              <Row className="justify-content-between">
                <Col xs={6}>
                  <Typography variant="body1" className="">
                    {translationOffer.benefits}
                  </Typography>
                </Col>
                <Col xs={6}>
                  <Typography variant="body1" className="fw-bold">
                    {translationOffer.transport_aid}
                  </Typography>
                </Col>
              </Row>
            </Paper>
          </Col>

          {/* Company data */}
          <Col xs={4}>
            <Card>
              <CardContent className="p-50 position-relative">
                <Avatar
                  className="position-absolute MuiPaper-elevation5"
                  style={{
                    right: '3rem',
                    top: '1.9rem',
                    width: '2.8rem',
                    height: '2.8rem'
                  }}
                >
                  H
                </Avatar>
                <Typography
                  variant="subtitle1"
                  className="fw-bold"
                  component="p"
                >
                  {offer.company.name}
                </Typography>
                <Typography variant="caption">
                  {offer.company.description}
                </Typography>
                <img
                  className="img-fluid my-20"
                  src="https://www.kulud-pharmacy.com/wp-content/uploads/2018/01/687474703a2f2f692e696d6775722e636f6d2f4f32454f4378662e706e67.png"
                />
                <Row className="justify-content-between">
                  <Col xs={9}>
                    <Typography variant="body1" className="">
                      {offer.address}
                    </Typography>
                  </Col>
                  <Col xs={3}>
                    <FontAwesomeIcon
                      className="ml-auto text-primary"
                      icon={['fas', 'map-marker-alt']}
                      size="sm"
                    />
                  </Col>
                </Row>
                <Row className="justify-content-between">
                  <Col xs={9}>
                    <Typography
                      variant="body1"
                      className=""
                    >{`${offer.company.employees_range.description} ${translationOffer.employees}`}</Typography>
                  </Col>
                  <Col xs={3}>
                    <FontAwesomeIcon
                      className="ml-auto text-primary"
                      icon={['fas', 'users']}
                      size="sm"
                    />
                  </Col>
                </Row>
                <Row className="justify-content-between">
                  <Col xs={9}>
                    <Typography
                      variant="body1"
                      className=""
                      style={{ color: 'grey' }}
                    >
                      <u>{translationOffer.contact_company}</u>
                    </Typography>
                  </Col>
                  <Col xs={3}>
                    <FontAwesomeIcon
                      className="ml-auto text-primary"
                      icon={['fas', 'envelope']}
                      size="sm"
                    />
                  </Col>
                </Row>
                <Row className="justify-content-between">
                  <Col xs={9}>
                    <Typography variant="body1" className="fw-bold">
                      {offer.company.web_site}
                    </Typography>
                  </Col>
                  <Col xs={3}>
                    <FontAwesomeIcon
                      className="ml-auto text-primary"
                      icon={['fas', 'globe']}
                      size="sm"
                    />
                  </Col>
                </Row>
                <Divider variant="middle" className="mx-0 my-10" />
                <Row style={{ height: '2rem' }}>
                  <div
                    className="h-100 p-5 text-center ml-10 mr-5"
                    style={{
                      borderRadius: '50%',
                      border: '1px solid orange',
                      width: '2rem'
                    }}
                  >
                    <FontAwesomeIcon
                      className="mx-auto text-primary"
                      icon={['fab', 'facebook-f']}
                      size="sm"
                    />
                  </div>
                  <div
                    className="h-100 p-5 text-center mr-5"
                    style={{
                      borderRadius: '50%',
                      border: '1px solid orange',
                      width: '2rem'
                    }}
                  >
                    <FontAwesomeIcon
                      className="mx-auto text-primary"
                      icon={['fab', 'instagram']}
                      size="sm"
                    />
                  </div>
                  <div
                    className="h-100 p-5 text-center mr-5"
                    style={{
                      borderRadius: '50%',
                      border: '1px solid orange',
                      width: '2rem'
                    }}
                  >
                    <FontAwesomeIcon
                      className="mx-auto text-primary"
                      icon={['fab', 'twitter']}
                      size="sm"
                    />
                  </div>
                  <div
                    className="h-100 p-5 text-center mr-5"
                    style={{
                      borderRadius: '50%',
                      border: '1px solid orange',
                      width: '2rem'
                    }}
                  >
                    <FontAwesomeIcon
                      className="mx-auto text-primary"
                      icon={['fab', 'whatsapp']}
                      size="sm"
                    />
                  </div>
                </Row>
              </CardContent>
            </Card>
            <div className="p-30 w-100">
              <img
                className="img-fluid"
                src="https://placeimg.com/480/640/tech"
              />
            </div>
          </Col>
        </Row>

        <Row className="w-100 pcx my-20">
          <Typography variant="h5" className="fw-bold">
            {translationOffer.related_offers}
          </Typography>
        </Row>

        <Row className="pr-20 pl-50">
          <Carousel slidesToShow={3.7} autoplay={false}>
            {relatedOffersCards(relatedOffers)}
          </Carousel>
        </Row>
      </AppLayout>
    </div>
  )
}

export default DetallePage

DetallePage.propTypes = {
  log_out_companies: PropTypes.string.isRequired,
  company_signed_in: PropTypes.bool.isRequired,
  user_signed_in: PropTypes.bool.isRequired,
  log_out_user: PropTypes.string.isRequired,
  csrf_name: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired,
  relatedOffers: PropTypes.array.isRequired,
  session_translation: PropTypes.object.isRequired,
  pathAppliedOffers: PropTypes.string.isRequired,
  offer: PropTypes.shape({
    sex: PropTypes.object,
    city: PropTypes.object,
    offer_type: PropTypes.object,
    work_mode: PropTypes.object,
    contract_type: PropTypes.object,
    age_range: PropTypes.object,
    lenguages: PropTypes.array,
    available_work_days: PropTypes.array,
    salary: PropTypes.object,
    working_days: PropTypes.array,
    job_aids: PropTypes.array,
    company: PropTypes.object,
    is_applied: PropTypes.bool,
    id_offer: PropTypes.number,
    close_date: PropTypes.string,
    title: PropTypes.string,
    immediate_start: PropTypes.bool,
    description: PropTypes.string,
    vacancies_quantity: PropTypes.number,
    required_experience: PropTypes.bool,
    languages: PropTypes.array,
    address: PropTypes.string
  }),
  translationOffer: PropTypes.shape({
    type_ofert: PropTypes.string,
    work_mode: PropTypes.string,
    terms: PropTypes.string,
    salary: PropTypes.string,
    days: PropTypes.string,
    working_day: PropTypes.string,
    benefits: PropTypes.string,
    transport_aid: PropTypes.string,
    employees: PropTypes.string,
    contact_company: PropTypes.string,
    related_offers: PropTypes.string,
    targeted_offer: PropTypes.string,
    age: PropTypes.string,
    vacancy_numbers: PropTypes.string,
    recident: PropTypes.string,
    experience: PropTypes.string,
    lenguage: PropTypes.string,
    close: PropTypes.string,
    affinity: PropTypes.string,
    aplications: PropTypes.string
  })
}
