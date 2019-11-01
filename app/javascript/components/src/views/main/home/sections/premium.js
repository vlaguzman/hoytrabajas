import React, { useMemo } from 'react'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import Card from '@material-ui/core/Card'
import CardActions from '@material-ui/core/CardActions'
import CardContent from '@material-ui/core/CardContent'
import Button from '@material-ui/core/Button'
import { ResponsiveText, ResponsiveButton } from './styles'

const content = [
  {
    img: 'push.png',
    headline: 'Aplicacion pro',
    desc: 'Ser mas relevante en las aplicaciones que mas te gustan'
  },
  {
    img: 'tag.png',
    headline: 'Ofertas indicadas',
    desc: 'Gracias a los porcentajes de afinidad revisa las mejores ofertas para ti'
  },
  {
    img: 'call.png',
    headline: 'Chat directo con el empleador',
    desc: 'Habla directamente con el empleador para conecer de primera mano su feedback'
  }
]

const buttonText = 'Conoce los beneficios premium'

const PremiumSection = () => {
  const cards = useMemo(
    () =>
      content.map(({ img, headline, desc }, i) => {
        return (
          <Col
            key={img}
            className="home__premium-card-wrapper align-items-stretch my-30"
            xs={12}
            md={4}
          >
            <Card className="h-100 home__premium-card-shadow">
              <CardContent>
                <img
                  className="d-block mx-auto"
                  src={`/assets/static/img/${img}`}
                  alt={headline}
                />
                <Typography
                  className="home__premium-card-title m-20 h-30"
                  gutterBottom
                  variant="h6"
                  align="center"
                  component="h2"
                >
                  <strong>{headline}</strong>
                </Typography>
                <ResponsiveText
                  className="m-20"
                  variant="body1"
                  color="textSecondary"
                  component="p"
                >
                  {desc}
                </ResponsiveText>
              </CardContent>
              <CardActions disableSpacing>
                <Button
                  className="text-primary mx-auto"
                  style={{
                    fontSize: '16px',
                    fontWeight: 500,
                    textTransform: 'none'
                  }}
                >
                  Leer más »
                </Button>
              </CardActions>
            </Card>
          </Col>
        )
      }),
    [content]
  )

  return (
    <>
      <Row noGutters className="bg-paola w-90 mx-auto mt-50" />
      <Row className="pcx justify-content-center my-10" noGutters>
        <Col xs={10} className="text-center mt-60 marker">
          <Typography className="fw-bold marker" variant="h4">
            Paola hoy es <span className="text-primary">Premium</span>
          </Typography>
          <Typography className="fw-bold home__small-subtitle" variant="caption">
            Muchas ventajas para encontrar tu empleo ideal
          </Typography>
          <Typography
            className="my-30 d-none d-md-block"
            variant="caption"
            style={{ fontFamily: 'Rubik', color: `rgba(0, 0, 0, 0.54)` }}
          >
            
          </Typography>
        </Col>
      </Row>
      <Col className="pcx">
        <div className="row justify-content-between align-items-stretch w-100 mx-auto">
          {cards}
        </div>
        <div className="d-flex justify-content-center align-items-center w-100 my-30">
          <Col xs={12} md={4}>
            <ResponsiveButton
              color="primary"
              variant="outlined"
              className="mt-20 mb-60"
              // style={{ padding: `20px 0`, width: '100%' }}
            >
              <ResponsiveText
                variant="caption"
                style={{ whiteSpace: 'normal', textTransform: 'none' }}
              >
                {buttonText}
              </ResponsiveText>
            </ResponsiveButton>
          </Col>
        </div>
      </Col>
    </>
  )
}

export default PremiumSection
