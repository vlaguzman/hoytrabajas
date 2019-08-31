import React from 'react'
import Paper from '@material-ui/core/Paper';
import Typography from '@material-ui/core/Typography';
import {Row, Col} from 'reactstrap';
import DataCard from '../../../components/DataCard';
import Button from '@material-ui/core/Button';
import PaperHeader from '../components/paper_header';
import CarouselRow from '../components/carousel';
import { map } from 'lodash';
import AddEditButton from '../components/AddEditButton';


const ThirdSection = () => {
  return (
    <Row className='justify-content-between w-100 px-20 mx-0 my-20'>
    <Paper className="w-100 d-flex flex-column py-25 paper-responsive-padding justify-content-center align-items-center">
       <PaperHeader titulo='Experiencia'/>
       <Row className='w-100 external'>
          <CarouselRow>
          { map([
             {titleSec: 'CineColombia',
                subTitleSec: 'Community Manager' },
             {titleSec: 'CineColombia',
                subTitleSec: 'Community Manager' },
             {titleSec: 'CineColombia',
                subTitleSec: 'Community Manager' },
             {titleSec: 'CineColombia',
                subTitleSec: 'Community Manager'                  
             }], ({titleSec, subTitleSec}, i) => (
             <Col key={i}  xs={12}  >
                <DataCard middleDivider
                  headerKind='titleSubNoIconNoChipNoFavCloseEdit' 
                  {...{titleSec}} {...{subTitleSec}} 
                  Chips={[{},{},{}]} ChipsTitle='Responsabilidades' 
                  haveContent actions bottomButton >
                      <Typography variant='caption' className='fw-bold text-muted'>
                            Enero-2018 - Julio 2018
                      </Typography> 
                  </DataCard>
             </Col>
             ))}
          </CarouselRow>
       </Row>
       <Row className='w-100 justify-content-center' >
          <AddEditButton texto='Agregar información' />
       </Row>
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

export default ThirdSection