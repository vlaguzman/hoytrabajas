import React from 'react'
import PropTypes from 'prop-types'
// import { Row } from 'reactstrap'
// import Introduccion from './sections/introduccion'
import CoverSection from './sections/cover'
import OffersSection from './sections/offers'
// import PremiumSection from './sections/premium'
import CompaniesSection from './sections/companies'
// import TurorialSection from './sections/tutorial'
import content from './data'

const HomePage = ({
  offers,
  csrf_param,
  csrf_token,
  path_applied_offers,
  new_offer_path,
  home_translations,
  offer_translations,
  filterForm,
  common
}) => {
  const { companies } = content
  const { cover, offers: offersTranslations } = home_translations

  return (
    <div className="home-wrapper">
      <CoverSection
        {...{ common, filterForm }}
        translations={cover}
        new_offer_path={new_offer_path}
      />
      <OffersSection
        csrf_param={csrf_param}
        csrf_token={csrf_token}
        offers={offers}
        path_applied_offers={path_applied_offers}
        section_title={offersTranslations.title}
        offer_translations={offer_translations}
      />
      {/* <Introduccion />
      <div
        className="w-100 position-absolute d-none d-lg-block clipping-shit"
        style={{ height: '1000px', background: 'rgba(211, 211, 211, 0.3)' }}
      />
      <Row className="mt-70 d-none d-lg-flex" />
      <Row className="mt-70 d-none d-lg-flex" />
      <TurorialSection />
      <Row className="mb-70 d-none d-lg-flex" />
      <Row className="mb-70 d-none d-lg-flex" />
      <Row className="mb-70 d-none d-lg-flex" />
      <PremiumSection {...premium} /> */}
      <CompaniesSection {...companies} />
    </div>
  )
}

export default HomePage

HomePage.propTypes = {
  path_applied_offers: PropTypes.string.isRequired,
  new_offer_path: PropTypes.string.isRequired,
  offers: PropTypes.object.isRequired,
  csrf_param: PropTypes.string,
  csrf_token: PropTypes.string,
  home_translations: PropTypes.object.isRequired,
  offer_translations: PropTypes.object,
  common: PropTypes.object,
  filterForm: PropTypes.object
}
