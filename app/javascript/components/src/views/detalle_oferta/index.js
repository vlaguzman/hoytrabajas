import React, {Fragment} from 'react'
//import Head from 'next/head'
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

const DetallePage = ({offer}) => {

  console.log(offer)

  const offerData = {
    close_date: "25 Agosto 2019",
    title: "Desarrollador Front-end Sr. test",
    immediate_start: true,
    description: "endSint esse anim consequat commodo. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliquaincididunt ut labore et dolore magna aliqua.",
    vacancies_quantity: 10,
    required_experience: true,
    sex: {
      description: "Mujer"
    },
    age_ranges: {
      from: 18,
      to: 35
    },
    city:{
      description: "Bogotá D.C."
    },
    languages:[['Ingles', "Avanzado"]],
    offer_type: {
      description: "Medio Tiempo"
    },
    work_mode: {
      description: "Teletrabajo"
    },
    contract_type:{
      description: "Termino fijo"
    },
    salary:{
      currency: {
        description: "COP"
      },
      from: "2.500.000",
      to: null,
      salary_period: {
        description: "Mensual"
      }
    },
    available_work_days:["Lunes a Viernes", "Sabado"],
    working_days: [ "Mañana 7 a 1pm", "Tarde 2pm a 7pm" ],
    job_aids: ["Auxilio de Transporte"],
    company:{
      name: "Verdelógico S.A.S",
      description: "Sector de comunicaciones",
      address: "Calle Falsa 123 # 00 99",
      employess_range: {
        description: "20 a 80"
      },
      web_site: "www.verdelógico.com"
    }
  }

  return (
<div className="detalle-wrapper" >
  {/* <Row style={{background: 'white', height: '5rem'}}></Row> */}

  <Row className='position-relative' style={{background: 'white', height: '13rem'}}>
    <div className='position-absolute w-100' style={{background: '#fff9e4', height: '16rem'}}></div>
  </Row>

  <Row className='pcx align-items-start mb-30' >
    <Col xs={8}>
      <Paper className='p-50' >
        <Row className='justify-content-between mx-0'>
          <Typography className='fw-bold' variant='h5' component='span'>
            {offerData.title}
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
          { (offerData.immediate_start) && (<Badge color='primary' >Incorporación inmediata </Badge> ) }
        </Row>
        <Row className='my-10 mx-0'>
          <Typography variant='caption'><span className='fw-bold' >Cierre </span>{offerData.close_date}</Typography>
          <Typography className='ml-10' variant='caption'> <span className='fw-bold' > 26</span> aplicaciones</Typography>
        </Row>
        <Divider variant='middle' className='mx-0 my-10' />
        <Typography variant='body1' >
          { offerData.description }
        </Typography>
        <Button variant='contained' color='primary' className='text-white my-50' style={{borderRadius: '50px'}} >
          Aplicar a esta oferta
        </Button>
        <Row className='justify-content-between'>
            <Col xs={6} ><Typography variant='body1' className='' >Oferta dirigida a</Typography></Col>
            <Col xs={6} ><Typography variant='body1' className='fw-bold' >{ offerData.sex.description }</Typography></Col>
        </Row>
        <Row className='justify-content-between'>
            <Col xs={6} ><Typography variant='body1' className='' >Edad</Typography></Col>
            <Col xs={6} ><Typography variant='body1' className='fw-bold' >{ `${offerData.age_ranges.from } a ${offerData.age_ranges.to}` }</Typography></Col>
        </Row>
        <Row className='justify-content-between'>
            <Col xs={6} ><Typography variant='body1' className='' >Número de vacantes</Typography></Col>
            <Col xs={6} ><Typography variant='body1' className='fw-bold' >{offerData.vacancies_quantity}</Typography></Col>
        </Row>
        <Row className='justify-content-between'>
            <Col xs={6} ><Typography variant='body1' className='' >Residente en</Typography></Col>
            <Col xs={6} ><Typography variant='body1' className='fw-bold' >{offerData.city.description}</Typography></Col>
        </Row>
        <Row className='justify-content-between'>
            <Col xs={6} ><Typography variant='body1' className='' >Experiencia</Typography></Col>
            <Col xs={6} ><Typography variant='body1' className='fw-bold' > {(offerData.required_experience) ? "Requerida": "No requerida" } </Typography></Col>
        </Row>
        <Row className='justify-content-between'>
            <Col xs={6} ><Typography variant='body1' className='' >Manejo del idioma</Typography></Col>
            <Col xs={6} ><Typography variant='body1' className='fw-bold' > {offerData.languages.map(language => `${language[0]} ${language[1]}`) } </Typography></Col>
        </Row>
        <Divider variant='middle' className='mx-0 my-30' />

        <Row className='justify-content-between'>
            <Col xs={6} ><Typography variant='body1' className='' >Tipo de oferta</Typography></Col>
            <Col xs={6} ><Typography variant='body1' className='fw-bold' >{ offerData.offer_type.description }</Typography></Col>
        </Row>
        <Row className='justify-content-between'>
            <Col xs={6} ><Typography variant='body1' className='' >Modalidad de trabajo</Typography></Col>
            <Col xs={6} ><Typography variant='body1' className='fw-bold' >{ offerData.work_mode.description }</Typography></Col>
        </Row>
        <Row className='justify-content-between'>
            <Col xs={6} ><Typography variant='body1' className='' >Acuerdo Legal</Typography></Col>
            <Col xs={6} ><Typography variant='body1' className='fw-bold' >{offerData.contract_type.description}</Typography></Col>
        </Row>
        <Row className='justify-content-between'>
            <Col xs={6} ><Typography variant='body1' className='' >Salario</Typography></Col>
            <Col xs={6} ><Typography variant='body1' className='fw-bold' >{`${offerData.salary.currency.description} ${offerData.salary.from}/${offerData.salary.salary_period.description}`}</Typography></Col>
        </Row>
        <Row className='justify-content-between'>
            <Col xs={6} ><Typography variant='body1' className='' >Días</Typography></Col>
            <Col xs={6} ><Typography variant='body1' className='fw-bold' >{offerData.available_work_days.map(value => (<div>{value}</div>) )}</Typography></Col>
        </Row>
        <Row className='justify-content-between'>
            <Col xs={6} ><Typography variant='body1' className='' >Jornada</Typography></Col>
            <Col xs={6} ><Typography variant='body1' className='fw-bold' >{offerData.working_days.map(value=>(<div>{value}</div>)) }</Typography></Col>
        </Row>
        <Row className='justify-content-between'>
            <Col xs={6} ><Typography variant='body1' className='' >Auxilios o prestaciones</Typography></Col>
            <Col xs={6} ><Typography variant='body1' className='fw-bold' >Auxilio de Transporte</Typography></Col>
        </Row>

      </Paper>
    </Col>

    {/* Company data */}
    <Col xs={4} >
      <Card >
        <CardContent className='p-50 position-relative'>
        <Avatar className='position-absolute MuiPaper-elevation5' style={{right: '3rem', top: '1.9rem', width: '2.8rem', height: '2.8rem'}} >H</Avatar>
        <Typography variant='subtitle1' className='fw-bold' component='p' >{offerData.company.name}</Typography>
        <Typography variant='caption'>{offerData.company.description}</Typography>
        <img className='img-fluid my-20'
        src='https://www.kulud-pharmacy.com/wp-content/uploads/2018/01/687474703a2f2f692e696d6775722e636f6d2f4f32454f4378662e706e67.png' />
        <Row className='justify-content-between'>
            <Col xs={9} ><Typography variant='body1' className=''>{offerData.company.address}</Typography></Col>
            <Col xs={3} ><FontAwesomeIcon className='ml-auto text-primary' icon={['fas', 'map-marker-alt']} size="sm" /></Col>
        </Row>
        <Row className='justify-content-between'>
            <Col xs={9} ><Typography variant='body1' className='' >{offerData.company.employess_range.description} empleados</Typography></Col>
            <Col xs={3} ><FontAwesomeIcon className='ml-auto text-primary' icon={['fas', 'users']} size="sm" /></Col>
        </Row>
        <Row className='justify-content-between'>
            <Col xs={9} ><Typography variant='body1' className='' style={{color: 'grey'}} ><u>Contactar con la empresa</u></Typography></Col>
            <Col xs={3} ><FontAwesomeIcon className='ml-auto text-primary' icon={['fas', 'envelope']} size="sm" /></Col>
        </Row>
        <Row className='justify-content-between'>
            <Col xs={9} ><Typography variant='body1' className='fw-bold' >{offerData.company.web_site}</Typography></Col>
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

</div>)

}
export default DetallePage
