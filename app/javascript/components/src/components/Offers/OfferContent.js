import PropTypes from 'prop-types'
import React from 'react'
import Typography from '@material-ui/core/Typography'
import Avatar from '@material-ui/core/Avatar'
import { Row } from 'reactstrap'
import CardContent from '@material-ui/core/CardContent'
import { capitalizeFirstLetter } from '../../helpers'
import CardCountDown from './CardCountDown'

String.prototype.toUpperCaseFirstLetter = function() {
  return capitalizeFirstLetter(this)
}

String.prototype.toUpperCaseAllFirstLetter = function() {

  return this.split(" ").map( word => capitalizeFirstLetter(word) ).join(" ")
}

const OnDemandBlock = ({ content }) => (
  <div className="a-tag-with_icon a-tag-orange_inverse truncate">
    {content}
  </div>
)

OnDemandBlock.propTypes = {
  content: PropTypes.string.isRequired
}

const RequiredExperienceBlock = ({ content }) => (
  <div className="a-tag__orange mr-5 truncate">{content}</div>
)

RequiredExperienceBlock.propTypes = {
  content: PropTypes.string.isRequired
}

const ImmediateStartBlock = ({ content }) => (
  <div color="success" className="a-tag__aqua truncate">
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
    tag_on_demand,
    candidates
  } = translations

  return (
    <CardContent className="offerContent pt-0 pb-5">
      {offer.confidential === false && (
        <Avatar
          className="offerCompanyIcon"
          src={offer['company']['url_image_logo']}
        />
      )}
      {offer.new_offer && <NewFlagBlock content={tag_new_offer} />}
      {offer.salary && offer.salary.from && (
        <div className="a-typo__subtitle2 a-badge__price px-0">
          <span>{`${offer.salary.currency.description} ${offer.salary.from}`}</span>
        </div>
      )}
      <h2 className="offerTitle a-typo__subtitle1 my-0 truncateText">
        {offer.title ? offer.title.toUpperCaseAllFirstLetter() : ''}
      </h2>
      {offer.confidential === false && (
        <h4 className="offerSubtitle companyName a-typo__subtitle2 mb-10 truncateText">
          {offer.company.name ? offer.company.name.toUpperCaseAllFirstLetter() : ''}
        </h4>
      )}
      <p className="offerDescription a-typo__subtitle2 mb-5 truncateParagraph">
        {offer.description ? offer.description.toUpperCaseFirstLetter() : ''}
      </p>
      <div className="mt-auto">
        <div className="d-flex justify-content-between align-items-end mb-10">
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
        <Typography variant="caption" className="offerLocation text-secondary">
          <i className="offerLocationIcon material-icons">room</i>
          {offer.city.description}
          <i className="offerApplicationIcon material-icons">touch_app</i>
          {offer['applied_offers']} {candidates}
        </Typography>
        <div className="m-affinityAndPercentageBox d-flex align-items-center justify-content-between">
          <Typography variant="h6" className={`${!offer['affinity_percentage'] && 'alignAffinity'} offerAffinity`} component="span">
            {offer['affinity_percentage'] && offer['affinity_percentage']}
          </Typography>

          {offer['raw_close_date'] && (<CardCountDown closeDate={new Date(offer['raw_close_date']) } />) }
        </div>
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
    tag_on_demand: PropTypes.string.isRequired,
    candidates: PropTypes.string.isRequired
  }).isRequired,
  offer: PropTypes.shape({
    title: PropTypes.string.isRequired,
    description: PropTypes.string,
    immediate_start: PropTypes.bool,
    required_experience: PropTypes.bool,
    new_offer: PropTypes.bool,
    on_demand: PropTypes.string,
    affinity_percentage: PropTypes.string,
    applied_offers: PropTypes.number,
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
