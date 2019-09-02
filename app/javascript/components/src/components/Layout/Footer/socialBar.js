import React from 'react'
import {Row, Col} from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import Button from '@material-ui/core/Button'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'

const SocialBar = () => {
  return (
    <Row style={{background: '#52DEE0'}} className='pcx-f justify-content-between text-white'>
      <Col xs={12} md={6} className='py-10'>
        <Typography className='fw-bold mb-0' component='p' variant='caption' >En HoyTrabajas busca ofertas de empleos</Typography>
        <Typography className='fw-bold mt-0' component='p' variant='caption' >temporales, informales, flexibles o por horas</Typography>
      </Col>
      <Col xs={12} md={6} className='pr-0 mr-0'>
        <Row noGutters className='align-items-center justify-content-end w-100 d-none d-md-flex' >
          <Col xs={12} md={3} className='h-100 align-items-center'>
            <Typography className='mr-10 ' component='' variant='caption' >Síguenos en:</Typography>
          </Col>
          <div className='h-100 p-10 text-center pt-20' 
           style={{borderLeft: '1px solid white', width: '12%'}}>
            <FontAwesomeIcon className='mx-auto' icon={['fab', 'facebook-f']} size="lg" />
          </div>
          <div className='h-100 p-10 text-center pt-20'
          style={{borderLeft: '1px solid white', width: '12%'}}>
            <FontAwesomeIcon className='mx-auto' icon={['fab', 'instagram']} size="lg" />
          </div>
          <div className='h-100 p-10 text-center pt-20'
            style={{borderLeft: '1px solid white', width: '12%'}}>
            <FontAwesomeIcon className='mx-auto' icon={['fab', 'twitter']} size="lg" />            
          </div>
          <div className='h-100 p-10 text-center pt-20' 
            style={{borderLeft: '1px solid white', borderRight: '1px solid white', width: '12%'}}>
            <FontAwesomeIcon className='mx-auto' icon={['fab', 'whatsapp']} size="lg" />            
          </div>
        </Row>
        <Row noGutters className='align-items-center justify-content-start w-100 d-md-none' >
          <Col xs={12} md={2} className='h-100 align-items-center'>
            <Typography className='mr-10 ' component='' variant='caption' >Síguenos en:</Typography>
          </Col>
          <div className='h-100 pb-10 pl-0 pr-10 text-center pt-20 ' 
           style={{width: '12%'}}>
            <FontAwesomeIcon className='mx-auto' icon={['fab', 'facebook-f']} size="lg" />
          </div>
          <div className='h-100 pb-10 pl-0 pr-10 text-center pt-20'
          style={{width: '12%'}}>
            <FontAwesomeIcon className='mx-auto' icon={['fab', 'instagram']} size="lg" />
          </div>
          <div className='h-100 pb-10 pl-0 pr-10 text-center pt-20'
            style={{width: '12%'}}>
            <FontAwesomeIcon className='mx-auto' icon={['fab', 'twitter']} size="lg" />            
          </div>
          <div className='h-100 pb-10 pl-0 pr-10 text-center pt-20' 
            style={{width: '12%'}}>
            <FontAwesomeIcon className='mx-auto' icon={['fab', 'whatsapp']} size="lg" />            
          </div>
        </Row>
        <Col xs={12} md={3}>
        <Row className='justify-content-start align-items-center d-md-none'>
          <div className='w-60 mx-auto'>
            <Typography variant='h6' className='text-white text-center d-inline-block mb-20 w-100 marker' >
              ¿SuperPoderes?
            </Typography>
            <Button 
             className='bg-white d-block px-30 mx-auto position-absolute footer_premiun_Button' >
              <Typography variant='caption' className='fw-bold text-center' >
                Crece a Premium
              </Typography>        
            </Button>
          </div>
        </Row>
      </Col>
      </Col>
    </Row>
  )
}
export default SocialBar;