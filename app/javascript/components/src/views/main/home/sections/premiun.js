import React, { Fragment } from 'react'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import Card from '@material-ui/core/Card'
import CardActionArea from '@material-ui/core/CardActionArea'
import CardActions from '@material-ui/core/CardActions'
import CardContent from '@material-ui/core/CardContent'
import CardMedia from '@material-ui/core/CardMedia'
import Button from '@material-ui/core/Button'

const cards = content =>
  content.map(({ img, headline, desc }, i) => {
    return (
      <div key={i} className="col-12 col-lg-4 align-items-stretch my-30">
        <Card className="h-100">
          <CardContent>
            <img
              className="d-block mx-auto"
              src={`/assets/static/img/${img}`}
              alt={headline}
            />
            <Typography
              className="m-20 h-30"
              gutterBottom
              variant="h6"
              align="center"
              component="h2"
            >
              <strong>{headline}</strong>
            </Typography>
            <Typography
              className="m-20"
              variant="body1"
              color="textSecondary"
              component="p"
            >
              {desc}
            </Typography>
          </CardContent>
          <CardActions disableSpacing>
            <Button className="text-primary mx-auto">ver más</Button>
          </CardActions>
        </Card>
      </div>
    )
  })

export default ({ content, button }) => {
  return (
    <Fragment>
      <Row noGutters className="bg-paola w-90 mx-auto mt-70" />
      <Row className="pcx justify-content-center my-10" noGutters>
        <Col xs={10} className="text-center mt-60 marker">
          <Typography className="fw-bold marker" variant="h4">
            Paola hoy es <span className="text-primary">Premium</span>
          </Typography>
          <Typography className="fw-bold" variant="caption">
            Muchas ventajas para encontrar tu empleo ideal
          </Typography>
          <Typography className="my-30" variant="caption" style={{fontFamily: 'Rubik', color: 'lightgrey'}}> 
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec
            aliquam faucibus libero, sit amet fringilla odio accumsan in. 
          </Typography>
        </Col>
      </Row>
      <Col className="pcx">
        <div className="row justify-content-between align-items-stretch w-90 mx-auto">
          {cards(content)}
        </div>
        <div className="d-flex justify-content-center align-items-center w-100 my-30">
          <Col xs={12} md={4}>
            <Button
              color="primary"
              variant="outlined"
              className="mt-20 mb-60"
              style={{ borderRadius: '20px' }}
            >
              <span className="fw-bold" style={{ whiteSpace: 'normal' }}>
                {button}
              </span>
            </Button>
          </Col> 
        </div>
      </Col>
    </Fragment>
  )
}
