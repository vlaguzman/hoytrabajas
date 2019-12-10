import PropTypes from 'prop-types'
import React from 'react'
import Typography from '@material-ui/core/Typography'
import Avatar from '@material-ui/core/Avatar'
import { Row } from 'reactstrap'
import CardContent from '@material-ui/core/CardContent'
import { capitalizeFirstLetter } from '../../helpers'

const RequiredExperienceBlock = ({ content }) => (
  <div className="offerTag a-tag__orange mr-5">{content}</div>
)

const InmediateStartBlock = ({ content }) => (
  <div color="success" className="offerTag a-tag__aqua">
    {content}
  </div>
)

const NewFlagBlock = ({ content }) => (
  <div className="offerNewBadge a-badge__newOffer">{content}</div>
)

const wordsShortener = (words, maxSize) => {
  return words.length > maxSize ? `${words.substring(0, maxSize)}...` : words
}

const OfferContent = ({ offer }) => {
  return (
    <CardContent className="offerContent pt-0 pb-5">
      <Avatar
        className="offerCompanyIcon"
        src={offer['company']['url_image_logo']}
      />
      {offer.new_offer && <NewFlagBlock content="Nuevo" />}
      <div className="a-badge__price px-0">
        <span>{`${offer.salary.currency.description} ${offer.salary.from}`}</span>
      </div>
      <Typography variant="h6" component="h2" className="offerTitle my-0">
        {capitalizeFirstLetter(wordsShortener(offer.title, 26))}
      </Typography>
      <Typography variant="h6" component="h4" className="offerSubtitle mb-10">
        {wordsShortener(offer.company.name, 31)}
      </Typography>
      <Typography
        variant="body2"
        component="p"
        className="offerDescription mb-10"
      >
        {capitalizeFirstLetter(wordsShortener(offer.description, 58))}
      </Typography>
      <div className="mt-auto">
        <Row className="mr-0 justify-content-between align-items-end px-10 mb-10">
          <Row className="mr-0 px-10">
            {!offer.required_experience && (
              <RequiredExperienceBlock content="Sin experiencia" />
            )}
            {offer.immediate_start && (
              <InmediateStartBlock content="Inicio inmediato" />
            )}
          </Row>
        </Row>
        <Typography variant="caption" className="mt-10 text-secondary">
          <i className="ti-location-pin fw-bold" style={{ fontSize: '1rem' }} />{' '}
          {offer.city.description}
          <i
            className="ti-hand-point-up fw-bold ml-10"
            style={{ fontSize: '1rem' }}
          />{' '}
          100 Candidatos
        </Typography>
        <div className="d-flex align-items-center justify-content-between mt-10">
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
              style={{ fontSize: '12px ' }}
            />
            <span>24:00</span>
          </Typography>
        </div>
      </div>
    </CardContent>
  )
}

export default OfferContent

OfferContent.propTypes = {
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
