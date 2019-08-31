import React, {Fragment} from 'react'
import Typography from '@material-ui/core/Typography';
import {Row, Col} from 'reactstrap';
import DataCard from '../../../../components/DataCard';
import { listOfIcons } from '../../data';

const FirstSection = () => {
  return (
     <Fragment>
    <Row className='justify-content-between w-100 px-5 mx-0 my-20'>
    <Col className='py-10' xs={12} sm={12} lg={6} >
       <DataCard headerKind='titleNoIconChipFav' actions editInfo haveContent titleSec='Datos' >
          <Col className='p-25 pb-30'>
             <Typography variant='h6' component="p" className='fw-bold' ><span className='text-primary' >Carlos Andrés</span> Gómez Gongora</Typography >
             <Typography variant='body2' component="p" className='text-muted' >310 456 5678</Typography >
             <Typography variant='body2' component="p" className='text-muted' >correo@gmail.com</Typography >
             <Typography variant='body2' component="p" className='text-muted' >Bogotá, Colombia</Typography >
          </Col>
       </DataCard>
    </Col>
    <Col className='py-10' xs={12} sm={12} lg={6} >
       <Col className='px-10 mb-5' >
          <DataCard headerKind='titleIconNoChipNoFav' titleSec='¿Cuál es tu disponibilidad laboral Hoy?'  />
       </Col>
       <Col className='px-10 mt-5' >
          <DataCard headerKind='onlyTitle' haveContent titleSec='Mi curriculum' internalList='withIcon' arreglo={listOfIcons}/>
       </Col>
    </Col>
</Row>
<Row className='justify-content-between w-100 px-5 mx-0 my-20'>
    <Col className='py-10' xs={12} sm={12} lg={6} >
       <DataCard haveContent headerKind='titleNoIconChipFav' actions editInfo titleSec='Sobre mi' >
          <Typography variant='body2' component="p" className='text-muted pt-20 px-20 pb-10' >
             Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliq...<span className='text-warning'>ver más</span> 
          </Typography >
          <Col className='px-25 py-20'>
             <Row className='justify-content-between px-20'>
                <Col xs={12} sm={6}  ><Typography variant='caption' className='text-muted text-center' >Situación laboral actual</Typography></Col>
                <Col xs={12} sm={6}  ><Typography variant='body2' className='fw-bold text-center'>Desempleado</Typography></Col>
             </Row>
             <Row className='justify-content-between px-20'>
                <Col xs={12} sm={6}  ><Typography variant='caption' className='text-muted text-center' >Cuentas con vehículos</Typography></Col>
                <Col xs={12} sm={6}  ><Typography variant='body2' className='fw-bold text-center'>Moto</Typography></Col>
             </Row>                  
          </Col>
       </DataCard>   
    </Col>
    <Col className='py-10' xs={12} sm={12} lg={6} >
       <DataCard headerKind='titleNoIconChipFav' actions editInfo titleSec='Intereses' haveContent>
       <Col className='p-25'>
          <Row className='justify-content-between px-20'>
             <Col className='px-0' xs={12} sm={4}  ><Typography variant='caption' className='text-muted text-left' >Categorías</Typography></Col>
             <Col className='px-0' xs={12} sm={8}  ><Typography variant='body2' style={{lineHeight: '1.3rem'}} className='fw-bold text-right-sm-left'>Ventas, Marketing, Diseño</Typography></Col>
          </Row>
          <Row className='justify-content-between px-20'>
             <Col className='px-0' xs={12} sm={4}  ><Typography variant='caption' className='text-muted text-left' >Búsqueda en</Typography></Col>
             <Col className='px-0' xs={12} sm={8}  ><Typography variant='body2' style={{lineHeight: '1.3rem'}} className='fw-bold text-right-sm-left'>Bogotá  -  Suba</Typography></Col>
          </Row>
          <Row className='justify-content-between px-20'>
             <Col className='px-0' xs={12} sm={4}  ><Typography variant='caption' className='text-muted text-left' >Tipo de oferta</Typography></Col>
             <Col className='px-0' xs={12} sm={8}  ><Typography variant='body2' style={{lineHeight: '1.3rem'}} className='fw-bold text-right-sm-left'>Por horas  -  Tiempo completo</Typography></Col>
          </Row>
          <Row className='justify-content-between px-20'>
             <Col className='px-0' xs={12} sm={4}  ><Typography variant='caption' className='text-muted text-left' >Disponibilidad de trabajo</Typography></Col>
             <Col className='px-0' xs={12} sm={8}  ><Typography variant='body2' style={{lineHeight: '1.3rem'}} className='fw-bold text-right-sm-left'>Lunes a viernes -  Fines de semana</Typography></Col>
          </Row>
          <Row className='justify-content-between px-20'>
             <Col className='px-0' xs={12} sm={4}  ><Typography variant='caption' className='text-muted text-left' >Franja horaria</Typography></Col>
             <Col className='px-0' xs={12} sm={8}  ><Typography variant='body2' style={{lineHeight: '1.3rem'}} className='fw-bold text-right-sm-left'>Mañana  7am - 1pm</Typography></Col>
          </Row>
          <Row className='justify-content-between px-20'>
             <Col className='px-0' xs={12} sm={4}  ><Typography variant='caption' className='text-muted text-left' >Salario</Typography></Col>
             <Col className='px-0' xs={12} sm={8}  ><Typography variant='body2' style={{lineHeight: '1.3rem'}} className='fw-bold text-right-sm-left'>COP 750.000  a 1.200.000 </Typography></Col>
          </Row>
       </Col>
       </DataCard>   
    </Col>
</Row>
     </Fragment>
  )
}

export default FirstSection