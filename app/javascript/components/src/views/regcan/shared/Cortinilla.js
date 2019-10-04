import React from 'react'
import { Row, Col } from 'reactstrap'
import Paper from '@material-ui/core/Paper'
import Button from '@material-ui/core/Button'
import Typography from '@material-ui/core/Typography'

const Cortinilla = ({
  title: { line1, line2 },
  content,
  buttonText,
  img,
  redirectTo,
  enlace
}) => {
  return (
    <Paper className="col-md-5 col-10">
      <Row className="w-100 justify-content-center p-20" noGutters>
        <Col className="align-items-center justify-content-center" xs={8}>
          <Row
            className="my-20 align-items-center justify-content-center"
            noGutters
          >
            <Typography variant="h5" className="text-center fw-bold">
              {line1}
            </Typography>
            <Typography variant="h5" className="text-center fw-bold">
              {line2}
            </Typography>
          </Row>
          <Row className="my-20 align-items-center justify-content-center">
            <img src={img} alt={img} />
          </Row>
          <Row className="my-20 align-items-center justify-content-center">
            <Typography variant="caption" className="text-center fw-bold">
              {content}
            </Typography>
          </Row>
          <Row className="my-20 align-items-center justify-content-center">
            <a href={redirectTo}>
              <Button
                // onClick={() => push(redirectTo)}
                type="button"
                style={{ borderRadius: '25px' }}
                variant="contained"
                color="primary"
                size="large"
                className="p-20"
              >
                <Typography
                  variant="caption"
                  className="text-wrap text-white text-center fw-bold "
                >
                  {buttonText}
                </Typography>
              </Button>
            </a>
            {enlace && (
              <div className="my-25">
                <a
                  className="text-muted"
                  style={{ textDecoration: 'underline' }}
                  href="/"
                >
                  {enlace}
                </a>
              </div>
            )}
          </Row>
        </Col>
      </Row>
    </Paper>
  )
}

export default Cortinilla
