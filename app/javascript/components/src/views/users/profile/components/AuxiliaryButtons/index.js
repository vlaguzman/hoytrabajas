import React, {Fragment} from 'react'
import Button from '@material-ui/core/Button';
import { Row, Col } from 'reactstrap';

const AuxiliaryButtons = () => {
  return (
    <Row className='w-40 justify-content-center'>
      <Col xs={12} md={6} className='p-5'>
        <Button variant='contained' className='text-white' style={{borderRadius: '20px'}}  color='primary' >Estudios</Button>
      </Col>  
      <Col xs={12} md={6} className='p-5'>
        <Button variant='outlined' className='' style={{borderRadius: '20px'}} color='primary' >Reconocimientos</Button>
      </Col>  
    </Row>
  )
}

export default AuxiliaryButtons