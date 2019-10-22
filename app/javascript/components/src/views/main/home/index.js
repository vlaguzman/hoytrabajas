import PropTypes from 'prop-types'
import React, { Fragment } from 'react'
import Card from '@material-ui/core/Card'
import CardContent from '@material-ui/core/CardContent'
import Button from '@material-ui/core/Button'
import TextField from '@material-ui/core/TextField'
import Typography from '@material-ui/core/Typography'
import { Row, Col } from 'reactstrap'
import AppLayout from '../../../components/Layout/AppLayout'
import Introduccion from './sections/introduccion'
import CoverSection from './sections/cover'
import GallerySection from './sections/gallery'
import PremiunSection from './sections/premiun'
import CompaniesSection from './sections/companies'
import TurorialSection from './sections/tutorial'
import Newsletter from './sections/newsletter'
import { contenido } from './data'
// import ScrollAnimation from 'react-animate-on-scroll'

const HomePage = ({
  offers,
  csrf_param,
  csrf_token,
  user_signed_in,
  offer_translations
}) => {
  const {
    cover,
    premiun,
    filterForm,
    common: { categorias },
    companies,
    gallery,
    categories
  } = contenido
  return (
    <div className="home-wrapper">
      <CoverSection {...cover} {...{ categorias }} {...{ filterForm }} />
      <GallerySection
        {...gallery}
        offers={offers}
        offer_translations={offer_translations}
      />
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
      <PremiunSection {...premiun} />
      <CompaniesSection {...companies} />
      <Newsletter />
    </div>
  )
}

export default HomePage

HomePage.propTypes = {
  offers: PropTypes.shape({
    map: PropTypes.object
  }),
  csrf_param: PropTypes.string,
  csrf_token: PropTypes.string,
  user_signed_in: PropTypes.bool,
  offer_translations: PropTypes.object
}
