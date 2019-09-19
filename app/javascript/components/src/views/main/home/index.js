import React, { Fragment } from 'react'
import Card from '@material-ui/core/Card'
import CardContent from '@material-ui/core/CardContent'
import Button from '@material-ui/core/Button'
import TextField from '@material-ui/core/TextField'
import Typography from '@material-ui/core/Typography'
import { Row, Col } from 'reactstrap';
import Introduccion from './sections/introduccion';
import CoverSection from './sections/cover'
import GallerySection from './sections/gallery'
import PremiunSection from './sections/premiun'
import CompaniesSection from './sections/companies'
import TurorialSection from './sections/tutorial'
import Newsletter from './sections/newsletter'
import { contenido } from './data'
// import ScrollAnimation from 'react-animate-on-scroll'

const HomePage = ({ match }) => {
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
      <h1>Ellos hoy confian en nosotros</h1>
      <CoverSection {...cover} {...{categorias}} {...{filterForm}} />
      <GallerySection {...gallery} />
      <Introduccion/>
      <div className='w-100 position-absolute d-none d-lg-block clipping-shit' style={{height: '1000px', background: 'rgba(211, 211, 211, 0.3)'}} ></div>
      <Row className='mt-70 d-none d-lg-flex'></Row>
      <Row className='mt-70 d-none d-lg-flex'></Row>
      <TurorialSection />
      <Row className='mb-70 d-none d-lg-flex'></Row>
      <Row className='mb-70 d-none d-lg-flex'></Row>
      <Row className='mb-70 d-none d-lg-flex'></Row>
      <PremiunSection {...premiun} />
      <CompaniesSection {...companies} />
      <Newsletter />
    </div>
  )
}

{
  /* <ScrollAnimation 
animateIn="fadeIn"
animateOut='fadeOut' 
scrollableParentSelector='.rct-scroll > div'>
</ScrollAnimation> */
}

export default HomePage
