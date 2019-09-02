import React from 'react'
import {Row, Col} from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import Button from '@material-ui/core/Button'

const UpperFooter = () => {
  return (
    <Row className='p-upper-footer text-white' style={{background: '#00CED5'}}>
      <Col xs={12} md={3}>
        <Typography variant='subtitle1' className='mb-20 fw-bold'>Empresas</Typography>
        <ul>
          <li>
            <Typography variant='body1' className='d-inline-block mb-10'>Blog del Trabajo</Typography>
          </li>
          <li>
            <Typography variant='body1' className='d-inline-block mb-10'>Planes Corporativos</Typography>
          </li>
          <li>
            <Typography variant='body1' className=''>On Demand</Typography>
          </li>
        </ul>
      </Col>
      <Col xs={12} md={3}>
        <Typography variant='subtitle1' className='mb-20 fw-bold'>Candidatos</Typography>
        <ul>
          <li>
            <Typography variant='body1' className='d-inline-block mb-10'>Mapa de Empleo</Typography>
          </li>
          <li>
            <Typography variant='body1' className='d-inline-block mb-10'>Compañias</Typography>
          </li>
          <li>
            <Typography variant='body1' className=''>Perfiles</Typography>
          </li>
        </ul>
      </Col>
      <Col xs={12} md={3}>
                <Typography variant='subtitle1' className='mb-20 fw-bold'>HOYTRABAJAS</Typography>
        <ul>
          <li>
              <Typography variant='body1' component='p'>
                Calle 102 #45A - 46
              </Typography>
              <Typography variant='body1' component='p' className='mb-10'>
                Bogotá, Colombia
              </Typography>
          </li>
          <li>
            <Typography variant='body1'>
                +(57) 350 705 2990
            </Typography>
          </li>
        </ul>
      </Col>
      <Col xs={12} md={3}>
        <Row className='justify-content-start align-items-center d-none d-md-flex'>
          <div className='w-70 mx-auto '>
            <Typography variant='h6' className='text-white text-center d-inline-block mb-20 marker' >
              ¿SuperPoderes?
            </Typography>
            <Button style={{borderRadius: '50px', color: '#00CED5'}}
             className='bg-white d-block px-20' >
              <Typography variant='caption' className='fw-bold text-center' >
                Crece a Premium
              </Typography>        
            </Button>
          </div>
        </Row>
      </Col>
    </Row>
    
  )
}

export default UpperFooter
