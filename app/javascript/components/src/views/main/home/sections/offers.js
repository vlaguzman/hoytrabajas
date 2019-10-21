import PropTypes from 'prop-types'
import React, { Fragment } from 'react'
import { Row, Col } from 'reactstrap'
import Button from '@material-ui/core/Button'
import Cards from './components/gallery_cards/gallery_card'
import Carousel from '../../../../components/Carousel/CarouselRow'
import AppLayout from '../../../../components/Layout/AppLayout'

const Gallery = ({
  offers,
  csrf_param,        
  csrf_token,        
  user_signed_in,    
  company_signed_in, 
  log_out_user,      
  log_out_companies, 
  session_translation,
  offer_translations
}) => {
  return (
    <div className="main-wrapper">
      <AppLayout
        csrf_param={csrf_param}
        csrf_token={csrf_token}
        user_signed_in={user_signed_in}
        company_signed_in={company_signed_in}
        log_out_user={log_out_user}
        log_out_companies={log_out_companies}
        session_translation={session_translation}
      >
        <div className="">
          <h1>{ offer_translations.index.title }</h1>
          <Carousel
            slidesToShowResp={1}
            centerMode
            slidesToShow={3.7}
            autoplay={false}
          >
            {offers.map(e => {
              return <Cards 
                        key={e.title} 
                        offer={e}
                        offer_translations={offer_translations} 
                     />
            })}
          </Carousel>
          <Row className="justify-content-center align-items-center  my-30 ">
            <Col xs={9} md={4}>
              <Button
                className="MuiButtonBase-root MuiButton-root my-20 text-wrap MuiButton-outlined MuiButton-outlinedPrimary MuiButton-sizeLarge"
                color="primary"
                size="large"
                variant="outlined"
                style={{ borderRadius: '50px' }}
                href="/offers"
              >
                { offer_translations.index.btn_more_offers }
              </Button>
            </Col>
          </Row>
        </div>
      </AppLayout>
    </div>
  )
}
export default Gallery

Gallery.propTypes = {
  offers: PropTypes.shape({
    map: PropTypes.array
  }),
  csrf_param: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired,
  user_signed_in: PropTypes.bool.isRequired,
  company_signed_in: PropTypes.bool.isRequired,
  log_out_user: PropTypes.string.isRequired,
  log_out_companies: PropTypes.string.isRequired,
  session_translation: PropTypes.object.isRequired
}
