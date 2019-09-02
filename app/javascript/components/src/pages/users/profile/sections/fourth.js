import React from 'react'
import Paper from '@material-ui/core/Paper';
import Typography from '@material-ui/core/Typography';
import {Row, Col} from 'reactstrap';
import DataCard from '../../../components/DataCard';
import Button from '@material-ui/core/Button';
import PaperHeader from '../components/paper_header';
import CarouselRow from '../components/carousel';
import { map } from 'lodash';
import ButtonsAuxiliars from '../components/buttons';
import AddEditButton from '../components/AddEditButton';

const FourthSection = () => {
  return (
    <Row className='justify-content-between w-100 px-20 mx-0 my-20'>
    <Paper className="w-100 d-flex flex-column py-25 paper-responsive-padding justify-content-center align-items-center">
          <PaperHeader titulo='Formación académica'/>
          <ButtonsAuxiliars />
          <Row className='w-100 external'>
             <CarouselRow>
             { map([
                {titleSec: 'Auxiliar de impresión', subTitleSec: 'Sena', smallTitleSec: 'Bucaramanga'},
                {titleSec: 'Curso de impresión Offset', subTitleSec: 'Sena', smallTitleSec: 'Bucaramanga'},
                {titleSec: 'Bachiller académico', subTitleSec: 'Don Bosco', smallTitleSec: 'Bogotá'},
                {titleSec: 'Bachiller académico', subTitleSec: 'Don Bosco', smallTitleSec: 'Bogotá'}],
                 ({titleSec, subTitleSec, smallTitleSec}, i) => (
                <Col key={i}  xs={12}  >
                   <DataCard haveContent headerKind='titleSubNoIconNoChipNoFavCloseEdit' 
                     {...{titleSec}} {...{subTitleSec}} {...{smallTitleSec}} middleDivider>
                         <Typography variant='caption' className='fw-bold text-muted'>
                           Enero 2019 - Estudio en curso 
                         </Typography>  
                    </DataCard>    
                </Col>
                ))}
             </CarouselRow>
          </Row>
          <AddEditButton texto='Agregar información' />
          <Row className='w-100 justify-content-center' >
       <Col xs={10} className='p-10' style={{border: '.01rem dashed rgba(211,211,211, .9)' }}>
                <Typography variant='body1' className='text-center d-inline'>
                   Al parecer no has registrado tu experiencia,
                   <span className='fw-bold'>¡Agregala ahora!</span>
                   <AddEditButton texto='Agregar información' />
                </Typography>
       </Col>
    </Row>
    </Paper> 
  </Row>
  )

}


export default FourthSection