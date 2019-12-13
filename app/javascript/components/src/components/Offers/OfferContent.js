import PropTypes from 'prop-types'
import React from 'react'
import Typography from '@material-ui/core/Typography'
import Avatar from '@material-ui/core/Avatar'
import { Row } from 'reactstrap'
import CardContent from '@material-ui/core/CardContent'
import { wordsShortener, capitalizeFirstLetter } from '../../helpers'

const RequiredExperienceBlock = ({ content }) => (
  <div className="offerTag a-tag__orange mr-5">{content}</div>
)

RequiredExperienceBlock.propTypes = {
  content: PropTypes.string.isRequired
}

const ImmediateStartBlock = ({ content }) => (
  <div color="success" className="offerTag a-tag__aqua">
    {content}
  </div>
)

const onDemandBlock = () => (
  <Badge color="primary" className="mr-5 d-block">
    <small>OnDemand</small>
  </Badge>
)

NewFlagBlock.propTypes = {
  content: PropTypes.string.isRequired
}

const onDemandBlock = ({ content }) => (
  <div className="offerNewBadge a-badge__newOffer">{content}</div>
)

/*onDemandBlock.propTypes = {
  content: PropTypes.string.isRequired
}*/

const NewFlagBlock = () => (
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
)

NewFlagBlock.propTypes = {
  content: PropTypes.string.isRequired
}

const wordsShortener = (words, maxSize) => {
  return words.length > maxSize ? `${words.substring(0, maxSize)}...` : words
}

>>>>>>> create offer on demand, and add statesman gem, and add models and config to this
const OfferContent = ({ offer, translations }) => {
  const {
    tag_immediate_start,
    tag_new_offer,
    tag_without_required_experience
  } = translations
  return (
    <CardContent className="offerContent pt-0 pb-5">
      <Avatar
        className="offerCompanyIcon"
        src={offer['company']['url_image_logo']}
      />
      {offer['new_offer'] && NewFlagBlock()}
      <Badge
        color="light"
        className="p-14 position-absolute font-weight-bolder text-dark bg-white"
        style={{ top: '-1.4rem', left: '1rem', fontSize: '0.93rem' }}
      >
        <span className="font-weight-bolder">
          <strong>{offer['salary']['currency']['description']}</strong>
          <strong>{offer['salary']['from']}</strong>
        </span>
      </Badge>
      <Typography
        gutterBottom
        variant="h6"
        component="h1"
        className="mb-0 mt-10 fw-bold"
        style={{ fontSize: '18px' }}
      >
        {WordsShortener(offer['title'], 26)}
      </Typography>
      <Typography
        gutterBottom
        variant="subtitle1"
        component="div"
        className="mb-10"
        style={{ fontWeight: '500', fontSize: '14px' }}
      >
        {WordsShortener(offer['company']['name'], 31)}
      </Typography>
      <Typography
        className="text-secondary mb-10"
        variant="body2"
        component="p"
      >
        {WordsShortener(offer['description'], 58)}
      </Typography>
      {/* <Typography variant="caption" className="text-secondary">
        <i
          className="ti-location-pin fw-bold mr-5"
          style={{ fontSize: '1rem' }}
        />{' '}
        {offer['city']['description']}
        <i
          className="ti-hand-point-up fw-bold ml-20"
          style={{ fontSize: '1rem' }}
        />
        100
      </Typography> */}
      <Row className="mr-0 justify-content-between align-items-end px-10 my-10">
        <Row className="mr-0 px-10">
          {offer['required_experience'] === false && RequiredExperienceBlock()}
          {offer['immediate_start'] && InmediateStartBlock()}
          {offer['on_demand'] === 'up' && onDemandBlock()}
        </Row>
        <Typography
          variant="caption"
          className="offerLocation mt-10 text-secondary"
        >
          <i className="ti-location-pin fw-bold" style={{ fontSize: '1rem' }} />{' '}
          {offer.city.description}
          {/* TODO Javier : add number of applications */}
          {/* <i
            className="ti-hand-point-up fw-bold ml-10"
            style={{ fontSize: '1rem' }}
          />{' '}
          100 Candidatos */}
        </Typography>
        {/* TODO anyone : add % of affinity and timer */}
        {/* <div className="d-flex align-items-center justify-content-between mt-10">
          <Typography variant="h6" className="offerAffinity" component="span">
            64%
          </Typography>
          <Typography
            variant="body1"
            className="fw-bold offerTimer color__slategray-dark"
            component="span"
          >
            <i
              className="ti-timer fw-bold mt-5 mr-5"
              style={{ fontSize: '12px' }}
            />
            <span>24:00</span>
          </Typography>
        </Typography> */}
        {/* <Typography variant="body1" className="fw-bold mt-10" component="span">
          <i
            className="ti-timer fw-bold text-primary mr-5"
            style={{ fontSize: '1rem' }}
          />
          24:00
        </Typography> */}
        {/* <Typography variant="body1" >
              <i className="ti-eye fw-bold text-primary mr-5" style={{fontSize: '1rem'}}></i>
              2 días atrás
            </Typography> */}
      </Row>
    </CardContent>
  )
}

export default OfferContent

OfferContent.propTypes = {
  translations: PropTypes.shape({
    tag_new_offer: PropTypes.string.isRequired,
    tag_immediate_start: PropTypes.string.isRequired,
    tag_without_required_experience: PropTypes.string.isRequired
  }).isRequired,
  offer: PropTypes.shape({
    title: PropTypes.string.isRequired,
    description: PropTypes.string,
    immediate_start: PropTypes.bool,
    required_experience: PropTypes.bool,
    new_offer: PropTypes.bool,
    city: PropTypes.shape({
      description: PropTypes.string.isRequired
    }),
    company: PropTypes.shape({
      name: PropTypes.string.isRequired,
      url_image_logo: PropTypes.string.isRequired
    }),
    salary: PropTypes.shape({
      from: PropTypes.number,
      currency: PropTypes.shape({
        description: PropTypes.string.isRequired
      })
    })
  })
}
