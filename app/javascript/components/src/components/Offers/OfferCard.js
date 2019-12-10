import PropTypes from 'prop-types'
import React from 'react'
import Card from '@material-ui/core/Card'
import CardActionArea from '@material-ui/core/CardActionArea'
import CardMedia from '@material-ui/core/CardMedia'
import Button from '@material-ui/core/Button'
import { Row, Col } from 'reactstrap'
import classNames from 'classnames'
import OfferContent from './OfferContent'
// The quick action icons are not used yet
// import ShareIcon from '@material-ui/icons/Share'
// import Delete from '@material-ui/icons/Delete'
// import IconButton from '@material-ui/core/IconButton'
// import FavoriteIcon from '@material-ui/icons/Favorite'
// import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
const OfferCard = ({
  offer,
  path_applied_offers,
  csrf_param,
  csrf_token,
  offer_translations
}) => {
  const value_button = offer.is_applied
    ? offer_translations.button_disactive
    : offer_translations.button_active

  const {
    tag_without_required_experience,
    tag_immediate_start,
    tag_new_offer
  } = offer_translations
  return (
    <Col className="m-offer cardOffer position-relative m-0 justify-content-center align-items-center px-0">
      <div className="bg-buttons-carusel MuiPaper-rounded position-absolute d-flex flex-column align-items-center justify-content-center">
        <Row noGutters className="w-100 justify-content-center">
          <button
            type="button"
            className="w-80 a-button offerButton__seeOffer bg-white my-10 fw-bold"
          >
            <a href={`/offers/${offer['id_offer']}`}>
              {offer_translations.see_offer}
            </a>
          </button>
        </Row>
        <Row noGutters className="w-100 justify-content-center">
          <form
            action={path_applied_offers}
            method="post"
            className="w-100 justify-content-center row"
          >
            <input type="hidden" name={csrf_param} value={csrf_token} />
            <input type="hidden" name="_method" value="post" />
            <input
              type="hidden"
              name="applied_offer[offer_id]"
              value={offer.id_offer}
            />
            <button
              variant="contained"
              type="submit"
              className={classNames(
                'a-button offerButton__apply btn-apply w-80 my-10 text-white fw-bold',
                {
                  'a-button--disabled': offer.is_applied
                }
              )}
            >
              {/* TO-DO-VLADO: made a review of the responsive 
                   <span className="d-none d-lg-inline">
                     {value_button_lg}
                   </span> */}
              {value_button}
            </button>
          </form>
        </Row>
        {/* TO-DO-ANYONE: ACTIVE THE SUPER-APPLY
             <Row noGutters className="w-100 justify-content-center">
               <Button
                 style={{ borderRadius: '30px' }}
                 variant="contained"
                 className="w-70 my-10 blueGreen-btn fw-bold"
                 size="large"
               >
                 {offer_translations.btn_super_apply}
               </Button>
             </Row> */}
        {/* TO-DO-ANYONE: ACTIVE THE FAVORITE FEATURE
             <Row noGutters className="w-100 justify-content-between px-50 mt-20">
               <IconButton aria-label="Add to favorites" className="text-danger">
                 <FavoriteIcon />
               </IconButton>
               <IconButton aria-label="Share" className="text-success">
                 <ShareIcon />
               </IconButton>
               <IconButton aria-label="Add to favorites" className="text-info">
                 <Delete />
               </IconButton>
             </Row> */}
        {/* TO-DO-ANYONE: ACTIVE THE SHARE OPTIONS
             <Row
               noGutters
               className="w-80 justify-content-between mt-20"
               style={{
                 borderRadius: '40px',
                 background: 'rgba(240, 255, 255,.8)'
               }}
             >
               <IconButton aria-label="Add to favorites" className="text-info">
                 <FontAwesomeIcon
                   className="mx-auto"
                   icon={['fab', 'facebook-messenger']}
                 />
               </IconButton>
               <IconButton aria-label="Share" className="text-info">
                 <FontAwesomeIcon
                   className="mx-auto"
                   icon={['fab', 'facebook-square']}
                 />
               </IconButton>
               <IconButton aria-label="Add to favorites">
                 <FontAwesomeIcon className="mx-auto" icon={['fab', 'whatsapp']} />
               </IconButton>
               <IconButton aria-label="Add to favorites">
                 <FontAwesomeIcon className="mx-auto" icon={['fab', 'twitter']} />
               </IconButton>
             </Row> */}
      </div>
      <Card className="h-100 tarjeta a-shadow__offerCard">
        <CardActionArea className="offerWrapper">
          <div className="offerImage__wrapper">
            <CardMedia
              component="img"
              alt="Oferta laboral"
              height="100%"
              image={offer.job_category_image}
              title="Oferta laboral"
            />
          </div>
          <OfferContent
            offer={offer}
            translations={{
              tag_new_offer,
              tag_immediate_start,
              tag_without_required_experience
            }}
          />
        </CardActionArea>
      </Card>
    </Col>
  )
}

export default OfferCard

OfferCard.propTypes = {
  path_applied_offers: PropTypes.string.isRequired,
  csrf_param: PropTypes.string,
  csrf_token: PropTypes.string,
  offer: PropTypes.shape({
    is_applied: PropTypes.bool,
    id_offer: PropTypes.number.isRequired,
    title: PropTypes.string.isRequired,
    description: PropTypes.string,
    immediate_start: PropTypes.bool,
    job_category_image: PropTypes.string.isRequired,
    required_experience: PropTypes.bool,
    new_offer: PropTypes.bool,
    city: PropTypes.shape({
      description: PropTypes.string.isRequired
    }),
    company: PropTypes.shape({
      name: PropTypes.string.isRequired
    }),
    salary: PropTypes.shape({
      from: PropTypes.number,
      currency: PropTypes.shape({
        description: PropTypes.string
      })
    })
  }),
  offer_translations: PropTypes.shape({
    button_active: PropTypes.string.isRequired,
    button_disactive: PropTypes.string.isRequired,
    btn_apply: PropTypes.string.isRequired,
    btn_lg_apply_offer: PropTypes.string.isRequired,
    btn_apply_offer: PropTypes.string.isRequired,
    see_offer: PropTypes.string.isRequired,
    btn_super_apply: PropTypes.string.isRequired,
    tag_new_offer: PropTypes.string.isRequired,
    tag_immediate_start: PropTypes.string.isRequired,
    tag_without_required_experience: PropTypes.string.isRequired
  })
}
