import PropTypes from 'prop-types'
import React from 'react'
import Card from '@material-ui/core/Card'
import CardActionArea from '@material-ui/core/CardActionArea'
import CardMedia from '@material-ui/core/CardMedia'
import Button from '@material-ui/core/Button'
import { Row, Col } from 'reactstrap'
import IconButton from '@material-ui/core/IconButton'
import FavoriteIcon from '@material-ui/icons/Favorite'
import Delete from '@material-ui/icons/Delete'
import ShareIcon from '@material-ui/icons/Share'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import classNames from 'classnames'
import OfferContent from './OfferContent'

const OfferCard = (
   { offer,
     path_applied_offers, 
     csrf_param,
     csrf_token,
     offer_translations }) => {
       const value_button = offer.is_applied ? offer_translations.btn_apply : offer_translations.button_active
       const value_button_lg = offer.is_applied ? offer_translations.btn_lg_apply_offer : offer_translations.button_active
       return (
         <Col className="cardOffer position-relative mb-30 justify-content-center align-items-center px-5">
           <div className="bg-buttons-carusel MuiPaper-rounded position-absolute d-flex flex-column align-items-center justify-content-center">
             <Row noGutters className="w-100 justify-content-center">
               <form action={path_applied_offers} method="post">
                 <input type="hidden" name={csrf_param} value={csrf_token} />
                 <input type="hidden" name="_method" value="post" />
                 <input
                   type="hidden"
                   name="applied_offer[offer_id]"
                   value={offer.id_offer}
                 />
                 <Button
                   variant="contained"
                   type="submit"
                   size="large"
                   color="primary"
                   className={classNames('btn-apply w-70 my-10 text-white fw-bold', {
                     'button-disabled': offer.is_applied
                   })}
                   style={{ borderRadius: '30px' }}
                 >
                   {/*<span className="d-none d-lg-inline">
                     {value_button_lg}
                   </span>*/}
                   {/*<span className="d-lg-none">*/}
                     {value_button}
                   {/*</span>*/}
                 </Button>
               </form>
             </Row>
             <Row noGutters className="w-100 justify-content-center">
               <Button
                 style={{ borderRadius: '30px' }}
                 variant="contained"
                 className="w-70 bg-white my-10 text-primary fw-bold"
                 size="large"
               >
                 <a href={`/offers/${offer['id_offer']}`}>
                   {offer_translations.see_offer}
                 </a>
               </Button>
             </Row>
             {/*<Row noGutters className="w-100 justify-content-center">
               <Button
                 style={{ borderRadius: '30px' }}
                 variant="contained"
                 className="w-70 my-10 blueGreen-btn fw-bold"
                 size="large"
               >
                 {offer_translations.btn_super_apply}
               </Button>
             </Row>*/}
             {/*<Row noGutters className="w-100 justify-content-between px-50 mt-20">
               <IconButton aria-label="Add to favorites" className="text-danger">
                 <FavoriteIcon />
               </IconButton>
               <IconButton aria-label="Share" className="text-success">
                 <ShareIcon />
               </IconButton>
               <IconButton aria-label="Add to favorites" className="text-info">
                 <Delete />
               </IconButton>
             </Row>*/}
             {/*<Row
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
             </Row>*/}
           </div>
           {/* <div className="content"> */}
           <Card className="tarjeta mx-5" raised>
             <CardActionArea>
               <CardMedia
                 component="img"
                 alt="Contemplative Reptile"
                 height="180"
                 width="300"
                 image="https://picsum.photos/id/397/300/180"
                 title="Contemplative Reptile"
               />
               <OfferContent offer={offer} />
             </CardActionArea>
           </Card>
           {/* </div> */}
         </Col>
       )
}

export default OfferCard

OfferCard.propTypes = {
  offer: PropTypes.shape({
    id_offer: PropTypes.number.isRequired,
    title: PropTypes.string.isRequired,
    description: PropTypes.string,
    immediate_start: PropTypes.bool,
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
    btn_lg_apply_offer: PropTypes.string.isRequired,
    btn_apply_offer: PropTypes.string.isRequired,
    see_offer: PropTypes.string.isRequired,
    btn_super_apply: PropTypes.string.isRequired
  })
}
