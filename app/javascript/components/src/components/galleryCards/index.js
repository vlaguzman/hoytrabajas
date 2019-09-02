import React, { Fragment } from 'react'
import Card from '@material-ui/core/Card'
import CardActionArea from '@material-ui/core/CardActionArea'
import CardActions from '@material-ui/core/CardActions'
import CardMedia from '@material-ui/core/CardMedia'
// import { Button } from 'reactstrap';
import Button from '@material-ui/core/Button'
import { Row, Col } from 'reactstrap'
import IconButton from '@material-ui/core/IconButton'
import FavoriteIcon from '@material-ui/icons/Favorite'
import Delete from '@material-ui/icons/Delete'
import ShareIcon from '@material-ui/icons/Share'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'

import Content from './content'

const GalleryCards = ({ cards }) => {
  return (
    <Fragment>
      {cards.map((e, i) => {
        return (
          <Col
            xs={12}
            sm={6}
            lg={4}
            key={i}
            className="cardOffer position-relative mb-30 justify-content-center align-items-center pr-40 pl-0"
          >
            <div className="bg-buttons MuiPaper-rounded position-absolute d-flex flex-column align-items-center justify-content-center">
              <Row noGutters className="w-100 justify-content-center">
                <Button
                  style={{ borderRadius: '30px' }}
                  variant="contained"
                  className="w-70 my-10 text-white fw-bold"
                  size="large"
                  color="primary"
                >
                  <span className='d-none d-lg-inline' >Aplica a esta oferta</span>
                  <span className='d-lg-none' >Aplicar oferta</span>
                </Button>
              </Row>
              <Row noGutters className="w-100 justify-content-center">
                <Button
                  style={{ borderRadius: '30px' }}
                  variant="contained"
                  className="w-70 bg-white my-10 text-primary fw-bold"
                  size="large"
                >
                  ver oferta
                </Button>
              </Row>
              <Row noGutters className="w-100 justify-content-center">
                <Button
                  style={{ borderRadius: '30px' }}
                  variant="contained"
                  className="w-70 my-10 blueGreen-btn fw-bold"
                  size="large"
                >
                  Super Apply (pago)
                </Button>
              </Row>
              <Row
                noGutters
                className="w-100 justify-content-between px-50 mt-20"
              >
                <IconButton
                  aria-label="Add to favorites"
                  className="text-danger"
                >
                  <FavoriteIcon />
                </IconButton>
                <IconButton aria-label="Share" className="text-success">
                  <ShareIcon />
                </IconButton>
                <IconButton aria-label="Add to favorites" className="text-info">
                  <Delete />
                </IconButton>
              </Row>
              <Row
                noGutters
                className="w-80 justify-content-between mt-20"
                style={{
                  borderRadius: '40px',
                  background: 'rgba(240, 255, 255,.8)'
                }}
              >
                <IconButton aria-label="Add to favorites" className="text-info">
                  <FontAwesomeIcon className='mx-auto' icon={['fab', 'facebook-messenger']}  /> 
                </IconButton>
                <IconButton aria-label="Share" className="text-info">
                  <FontAwesomeIcon className='mx-auto' icon={['fab', 'facebook-square']}  /> 
                </IconButton>
                <IconButton aria-label="Add to favorites">
                  <FontAwesomeIcon className='mx-auto' icon={['fab', 'whatsapp']}  /> 
                </IconButton>
                <IconButton aria-label="Add to favorites">
                  <FontAwesomeIcon className='mx-auto' icon={['fab', 'twitter']}  />  
                </IconButton>
              </Row>
            </div>
            <div className="content">
              <Card className="tarjeta" raised>
                <CardActionArea>
                  <CardMedia
                    component="img"
                    alt="Contemplative Reptile"
                    height="180"
                    width="300"
                    image="https://picsum.photos/id/397/300/180"
                    title="Contemplative Reptile"
                  />
                  <Content />
                </CardActionArea>
              </Card>
            </div>
          </Col>
        )
      })}
    </Fragment>
  )
}

export default GalleryCards
