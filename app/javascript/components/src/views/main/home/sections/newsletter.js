import React from 'react'
import { Row, Col } from 'reactstrap'
import Fab from '@material-ui/core/Fab'
import FormControl from '@material-ui/core/FormControl'
import Input from '@material-ui/core/Input'
import InputLabel from '@material-ui/core/InputLabel'
import Typography from '@material-ui/core/Typography'
import TrendingFlat from '@material-ui/icons/TrendingFlat'
import { ResponsiveTitle } from './styles'

const Newsletter = () => {
  return (
    <Row className="pcx justify-content-center mt-50 mb-60">
      <Col xs={10} md={4} className="text-center mt-70">
        <ResponsiveTitle className="fw-bold" variant="caption">
          Suscríbete a nuestro boletín
        </ResponsiveTitle>
        <Typography className="home__small-subtitle" variant="h5">
          Para encontrar su empleado ideal
        </Typography>
        <form
          className="row MuiPaper-elevation20 mt-50 mb-60 justify-content-between position-relative"
          style={{ borderRadius: '30px' }}
        >
          <FormControl className="w-80 ml-40 mb-10">
            <InputLabel htmlFor="component-disabled">
              Ingresa tu correo electrónico
            </InputLabel>
            <Input id="component-disabled pr-20" disableUnderline />
          </FormControl>
          <Fab
            color="primary"
            size="small"
            className="position-absolute"
            style={{ right: '1rem', top: '.5rem' }}
          >
            <TrendingFlat className="text-white" />
          </Fab>
        </form>
      </Col>
    </Row>
  )
}

export default Newsletter
