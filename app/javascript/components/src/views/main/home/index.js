import React, { useState } from 'react'
import PropTypes from 'prop-types'
import { Row } from 'reactstrap'
import Introduccion from './sections/introduccion'
import CoverSection from './sections/cover'
import OffersSection from './sections/offers'
import PremiumSection from './sections/premium'
import CompaniesSection from './sections/companies'
import TurorialSection from './sections/tutorial'
import Newsletter from './sections/newsletter'
import { contenido } from './data'
import WelcomeModal from './sections/components/WelcomeModal'

const HomePage = ({
  offers,
  csrf_param,
  csrf_token,
  applied_offers_path,
  user_signed_in,
  offer_translations,
  filterForm
}) => {
  const {
    cover,
    premium,
    common: { categorias },
    companies
  } = contenido

  const [isModalOpen, setIsModalOpen] = useState(true)

  return (
    <div className="home-wrapper">
      <WelcomeModal isOpen={isModalOpen} toggleOpenState={setIsModalOpen} />
      <CoverSection {...cover} {...{ categorias }} {...{ filterForm }} />
      <OffersSection csrf_param={csrf_param} csrf_token={csrf_token} offers={offers} applied_offers_path={applied_offers_path} offer_translations={offer_translations} />
      <Introduccion />
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
      <PremiumSection {...premium} />
      <CompaniesSection {...companies} />
      <Newsletter />
    </div>
  )
}

export default HomePage

HomePage.propTypes = {
  offers: PropTypes.object.isRequired,
  csrf_param: PropTypes.string,
  csrf_token: PropTypes.string,
  user_signed_in: PropTypes.bool,
  offer_translations: PropTypes.object
}
