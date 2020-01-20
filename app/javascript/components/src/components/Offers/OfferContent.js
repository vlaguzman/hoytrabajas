import PropTypes from 'prop-types'
import React from 'react'
import Typography from '@material-ui/core/Typography'
import Avatar from '@material-ui/core/Avatar'
import { Row } from 'reactstrap'
import CardContent from '@material-ui/core/CardContent'
import StarsIcon from '@material-ui/icons/Stars'
import { wordsShortener, capitalizeFirstLetter } from '../../helpers'

const OnDemandBlock = ({ content }) => (
  <div className="offerTag a-tag-with_icon a-tag-orange_inverse">
    <StarsIcon />
    {content}
  </div>
)

OnDemandBlock.propTypes = {
  content: PropTypes.string.isRequired
}

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

ImmediateStartBlock.propTypes = {
  content: PropTypes.string.isRequired
}

const NewFlagBlock = ({ content }) => (
  <div className="offerNewBadge a-badge__newOffer">{content}</div>
)

NewFlagBlock.propTypes = {
  content: PropTypes.string.isRequired
}

const OfferContent = ({ offer, translations }) => {
  const {
    tag_immediate_start,
    tag_new_offer,
    tag_without_required_experience,
    tag_on_demand
  } = translations
  return (
    <CardContent className="offerContent pt-0 pb-5">
      <Avatar
        className="offerCompanyIcon"
        src={offer['company']['url_image_logo']}
      />
      {offer.new_offer && <NewFlagBlock content={tag_new_offer} />}
      {offer.salary && offer.salary.from && (
        <div className="a-typo__subtitle2 a-badge__price px-0">
          <span>{`${offer.salary.currency.description} ${offer.salary.from}`}</span>
        </div>
      )}
      <h2 className="offerTitle a-typo__subtitle1 my-0">
        {capitalizeFirstLetter(wordsShortener(offer.title, 26))}
      </h2>
      <h4 className="offerSubtitle a-typo__subtitle2 mb-10">
        {wordsShortener(offer.company.name, 31)}
      </h4>
      <p className="offerDescription a-typo__subtitle2 mb-5">
        {capitalizeFirstLetter(wordsShortener(offer.description, 58))}
      </p>
      <div className="mt-auto">
        <div className="m-0 d-flex justify-content-between align-items-end mb-10">
          {offer.on_demand === 'up' && (
            <OnDemandBlock content={tag_on_demand} />
          )}
          {!offer.required_experience && (
            <RequiredExperienceBlock
              content={tag_without_required_experience}
            />
          )}
          {offer.immediate_start && (
            <ImmediateStartBlock content={tag_immediate_start} />
          )}
        </div>
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
        </div> */}
      </div>
    </CardContent>
  )
}

export default OfferContent

OfferContent.propTypes = {
  translations: PropTypes.shape({
    tag_new_offer: PropTypes.string.isRequired,
    tag_immediate_start: PropTypes.string.isRequired,
    tag_without_required_experience: PropTypes.string.isRequired,
    tag_on_demand: PropTypes.string.isRequired
  }).isRequired,
  offer: PropTypes.shape({
    title: PropTypes.string.isRequired,
    description: PropTypes.string,
    immediate_start: PropTypes.bool,
    required_experience: PropTypes.bool,
    new_offer: PropTypes.bool,
    on_demand: PropTypes.string,
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
