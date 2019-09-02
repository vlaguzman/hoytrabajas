import React from 'react'
import { Row, Col } from 'reactstrap'
import Fab from '@material-ui/core/Fab'
import FormControl from '@material-ui/core/FormControl'
import Input from '@material-ui/core/Input'
import InputLabel from '@material-ui/core/InputLabel'
import Typography from '@material-ui/core/Typography'
import TrendingFlat from '@material-ui/icons/TrendingFlat'

const Newsletter = () => {
  return (
    <Row
      className="pcx"
      className="justify-content-center mt-50 mb-60"
    >
      <Col xs={10} md={4} className="text-center mt-70">
        <Typography className="fw-bold" variant="caption">
          'Quiere estar al tanto de lo último en el ambito laboral
        </Typography>
        <Typography className="fw-bold" variant="h5">
          Suscríbete a nuestro newsletter
        </Typography>
        <form
          className="row MuiPaper-elevation20 mt-50 mb-60 justify-content-between position-relative"
          style={{ borderRadius: '30px' }}
        >
          {/* <TextField className='w-80 ml-50' label='Ingresa tu correo electrónico'/> */}
          <FormControl className="w-80 ml-40 mb-10">
            <InputLabel htmlFor="component-disabled">
              Ingresa tu correo electrónico
            </InputLabel>
            <Input id="component-disabled pr-20" disableUnderline />
            {/* <FormHelperText>Disabled</FormHelperText> */}
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
