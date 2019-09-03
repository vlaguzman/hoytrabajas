import React, {Fragment} from 'react'
import Head from 'next/head'
import {Row, Col} from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import Paper from '@material-ui/core/Paper'
import CardContent from '@material-ui/core/CardContent'
import Card from '@material-ui/core/Card'
import CardHeader from '@material-ui/core/CardHeader';
import Chip from '@material-ui/core/Chip'
import Button from '@material-ui/core/Button'
import Divider from '@material-ui/core/Divider'
import { Badge } from 'reactstrap';
import List from '@material-ui/core/List'
import ListItem from '@material-ui/core/ListItem'
import ListItemText from '@material-ui/core/ListItemText'
import ListItemSecondaryAction from '@material-ui/core/ListItemSecondaryAction';
import CheckCircle from '@material-ui/icons/CheckCircle';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import Avatar from '@material-ui/core/Avatar';
import Cards from '../../views/main/home/sections/components/gallery_cards/gallery_card'
import Carousel from '../../components/Carousel/CarouselRow'
import { map } from 'lodash';

const DetallePage = () => {
  return (
    <div className="detalle-wrapper">
      <Head>
        <title>Detalle de Oferta</title>
        <meta name="description" content="HoyTrabajas Enterprise Dashboard" />
      </Head>
      <Row style={{background: 'white', height: '5rem'}}></Row>
      <Row className='position-relative' style={{background: 'white', height: '13rem'}}>
        <div className='position-absolute w-100' style={{background: '#fff9e4', height: '16rem'}}></div>  
      </Row>
      <Row className='pcx align-items-start mb-30' >
        <Col xs={8}>
          <Paper className='p-50' >
            <Row className='justify-content-between mx-0'>
              <Typography className='fw-bold' variant='h5' component='span'>
                Desarrollador Front-end Sr.
              </Typography>
              <Chip color='primary' className='text-white' 
              label={
                <Fragment>
                  <Typography className='fw-bold' variant='h6' component='span'>
                    64%
                  </Typography>&nbsp;
                  <Typography className='fw-bold' variant='body1' component='span'>
                    de afinidad
                  </Typography>
                </Fragment>}
                 />
            </Row>
            <Row className='my-10 mx-0'>
              <Chip className='mr-10' variant='outlined' label='Tecnología y programación'/>
              <Badge color='primary' >Incorporación inmediata</Badge>
            </Row>
            <Row className='my-10 mx-0'>
              <Typography variant='caption'><span className='fw-bold' >Cierre</span> 25 Agosto 2019</Typography>
              <Typography className='ml-10' variant='caption'> <span className='fw-bold' > 26</span> aplicaciones</Typography>
            </Row>
            <Divider variant='middle' className='mx-0 my-10' />
            <Typography variant='body1' >
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliquaincididunt ut labore et dolore magna aliqua.
            </Typography>
            <Button variant='contained' color='primary' className='text-white my-50' style={{borderRadius: '50px'}} >
              Aplicar a esta oferta   
            </Button>
            <Row className='justify-content-between'>
                <Col xs={6} ><Typography variant='body1' className='' >Oferta dirigida a</Typography></Col>
                <Col xs={6} ><Typography variant='body1' className='fw-bold' >Mujer</Typography></Col>
            </Row>
            <Row className='justify-content-between'>
                <Col xs={6} ><Typography variant='body1' className='' >Edad</Typography></Col>
                <Col xs={6} ><Typography variant='body1' className='fw-bold' >18 a 35</Typography></Col>
            </Row>
            <Row className='justify-content-between'>
                <Col xs={6} ><Typography variant='body1' className='' >Número de vacantes</Typography></Col>
                <Col xs={6} ><Typography variant='body1' className='fw-bold' >3</Typography></Col>
            </Row>
            <Row className='justify-content-between'>
                <Col xs={6} ><Typography variant='body1' className='' >Residente en</Typography></Col>
                <Col xs={6} ><Typography variant='body1' className='fw-bold' >Bogotá</Typography></Col>
            </Row>
            <Row className='justify-content-between'>
                <Col xs={6} ><Typography variant='body1' className='' >Experiencia</Typography></Col>
                <Col xs={6} ><Typography variant='body1' className='fw-bold' >No requiere</Typography></Col>
            </Row>
            <Row className='justify-content-between'>
                <Col xs={6} ><Typography variant='body1' className='' >Manejo del idioma</Typography></Col>
                <Col xs={6} ><Typography variant='body1' className='fw-bold' >Ingles Avanzado</Typography></Col>
            </Row>
            <Divider variant='middle' className='mx-0 my-30' />

            <Row className='justify-content-between'>
                <Col xs={6} ><Typography variant='body1' className='' >Tipo de oferta</Typography></Col>
                <Col xs={6} ><Typography variant='body1' className='fw-bold' >Medio tiempo</Typography></Col>
            </Row>
            <Row className='justify-content-between'>
                <Col xs={6} ><Typography variant='body1' className='' >Modalidad de trabajo</Typography></Col>
                <Col xs={6} ><Typography variant='body1' className='fw-bold' >Teletrabajo</Typography></Col>
            </Row>
            <Row className='justify-content-between'>
                <Col xs={6} ><Typography variant='body1' className='' >Acuerdo Legal</Typography></Col>
                <Col xs={6} ><Typography variant='body1' className='fw-bold' >Termino Fijo</Typography></Col>
            </Row>
            <Row className='justify-content-between'>
                <Col xs={6} ><Typography variant='body1' className='' >Salario</Typography></Col>
                <Col xs={6} ><Typography variant='body1' className='fw-bold' >COP 2.500.000  / Mes</Typography></Col>
            </Row>
            <Row className='justify-content-between'>
                <Col xs={6} ><Typography variant='body1' className='' >Días</Typography></Col>
                <Col xs={6} ><Typography variant='body1' className='fw-bold' >Lunes a viernes</Typography></Col>
            </Row>
            <Row className='justify-content-between'>
                <Col xs={6} ><Typography variant='body1' className='' >Jornada</Typography></Col>
                <Col xs={6} ><Typography variant='body1' className='fw-bold' >Mañana 7 a 1pm  - Tarde 2pm - 7pm</Typography></Col>
            </Row>
            <Row className='justify-content-between'>
                <Col xs={6} ><Typography variant='body1' className='' >Auxilios o prestaciones</Typography></Col>
                <Col xs={6} ><Typography variant='body1' className='fw-bold' >Auxilio de Transporte</Typography></Col>
            </Row>

          </Paper>
        </Col>
        <Col xs={4} >
          <Card >
            <CardContent className='p-50 position-relative'>
            <Avatar className='position-absolute MuiPaper-elevation5' style={{right: '3rem', top: '1.9rem', width: '2.8rem', height: '2.8rem'}} >H</Avatar>
            <Typography variant='subtitle1' className='fw-bold' component='p' >Verdelógico S.A.S</Typography>
            <Typography variant='caption'  >Sector de comunicaciones</Typography>
            <img className='img-fluid my-20'
            src='https://www.kulud-pharmacy.com/wp-content/uploads/2018/01/687474703a2f2f692e696d6775722e636f6d2f4f32454f4378662e706e67.png' />
            <Row className='justify-content-between'>
                <Col xs={9} ><Typography variant='body1' className='' >Suba, Bogotá</Typography></Col>
                <Col xs={3} ><FontAwesomeIcon className='ml-auto text-primary' icon={['fas', 'map-marker-alt']} size="sm" /></Col>
            </Row>
            <Row className='justify-content-between'>
                <Col xs={9} ><Typography variant='body1' className='' >50 a 100 empleados</Typography></Col>
                <Col xs={3} ><FontAwesomeIcon className='ml-auto text-primary' icon={['fas', 'users']} size="sm" /></Col>
            </Row>
            <Row className='justify-content-between'>
                <Col xs={9} ><Typography variant='body1' className='' style={{color: 'grey'}} ><u>Contactar con la empresa</u></Typography></Col>
                <Col xs={3} ><FontAwesomeIcon className='ml-auto text-primary' icon={['fas', 'envelope']} size="sm" /></Col>
            </Row>
            <Row className='justify-content-between'>
                <Col xs={9} ><Typography variant='body1' className='fw-bold' >www.verdelógico.com</Typography></Col>
                <Col xs={3} ><FontAwesomeIcon className='ml-auto text-primary' icon={['fas', 'globe']} size="sm" /></Col>
            </Row>
            <Divider variant='middle' className='mx-0 my-10' />
            <Row style={{height: '2rem'}}>
              <div className='h-100 p-5 text-center ml-10 mr-5' 
                style={{borderRadius: '50%', border: '1px solid orange', width: '2rem'}}>
                <FontAwesomeIcon className='mx-auto text-primary' icon={['fab', 'facebook-f']} size="sm" />
              </div>
                <div className='h-100 p-5 text-center mr-5'
                style={{borderRadius: '50%', border: '1px solid orange', width: '2rem'}}>
                  <FontAwesomeIcon className='mx-auto text-primary' icon={['fab', 'instagram']} size="sm" />
                </div>
                <div className='h-100 p-5 text-center mr-5'
                  style={{borderRadius: '50%', border: '1px solid orange', width: '2rem'}}>
                  <FontAwesomeIcon className='mx-auto text-primary' icon={['fab', 'twitter']} size="sm" />            
                </div>
                <div className='h-100 p-5 text-center mr-5' 
                  style={{borderRadius: '50%', border: '1px solid orange', width: '2rem'}}>
                  <FontAwesomeIcon className='mx-auto text-primary' icon={['fab', 'whatsapp']} size="sm" />            
                </div>
            </Row>
            </CardContent>
          </Card>
          <div className='p-30 w-100' >
            <img className='img-fluid' src='https://placeimg.com/480/640/tech'/>
          </div>
        </Col>
      </Row>
      <Row  className='w-100 pcx my-20' >
          <Typography variant='h5' className='fw-bold' >
                Ofertas Relacionadas
          </Typography>
      </Row>
      <Row className='pr-20 pl-50'>
        <Carousel slidesToShow={3.7} autoplay={false} >
            {map(Array(6).fill({}),(e, i) => (
              <Cards key={i} />
            ))}
      </Carousel>
      </Row>
    </div>
  )
}

export default DetallePage
