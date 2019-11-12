import React from 'react'
import Paper from '@material-ui/core/Paper'
import Typography from '@material-ui/core/Typography'
import { Row, Col } from 'reactstrap'
import { map } from 'lodash'
import DataCard from '../../../../components/Cards/DataCard'
import EditInfoButton from '../../../../components/Cards/DataCard/EditInfoButton'
import CarouselRow from '../../../../components/Carousel/CarouselRow'
import PaperHeader from '../../../../components/PaperHeader'
import AuxiliaryButtons from '../components/AuxiliaryButtons'

const data = [
  {
    titleSec: 'Auxiliar de impresión',
    subTitleSec: 'Sena',
    smallTitleSec: 'Bucaramanga'
  },
  {
    titleSec: 'Curso de impresión Offset',
    subTitleSec: 'Sena',
    smallTitleSec: 'Bucaramanga'
  },
  {
    titleSec: 'Bachiller académico',
    subTitleSec: 'Don Bosco',
    smallTitleSec: 'Bogotá'
  },
  {
    titleSec: 'Bachiller académico',
    subTitleSec: 'Don Bosco',
    smallTitleSec: 'Bogotá'
  }
]

const FourthSection = () => {
  return (
    <Row className="justify-content-between w-100 px-20 mx-0 my-20">
      <Paper className="w-100 d-flex flex-column py-25 pr-20 paper-responsive-padding justify-content-center align-items-center">
        <PaperHeader titulo="Formación académica" />
        <AuxiliaryButtons />
        <Row className="w-100 external">
          <CarouselRow>
            {map(data, ({ titleSec, subTitleSec, smallTitleSec }, i) => (
              <Col key={i} xs={12}>
                <DataCard
                  haveContent
                  middleDivider
                  headerKind="titleSubNoIconNoChipNoFavCloseEdit"
                  {...{ titleSec, subTitleSec, smallTitleSec }}
                >
                  <Typography variant="caption" className="fw-bold text-muted">
                    Enero 2019 - Estudio en curso
                  </Typography>
                </DataCard>
              </Col>
            ))}
          </CarouselRow>
        </Row>
        <EditInfoButton text="Agregar información" />
        <EditInfoButton text="Agregar información" />
        <Row className="w-100 justify-content-center">
          <Col
            xs={10}
            className="p-10"
            style={{ border: '.01rem dashed rgba(211,211,211, .9)' }}
          >
            <Typography variant="body1" className="text-center d-inline">
              Al parecer no has registrado tu experiencia,
              <span className="fw-bold">¡Agrégala ahora!</span>
              <EditInfoButton text="Agregar información" />
            </Typography>
          </Col>
          <Col
            xs={10}
            className="p-10"
            style={{ border: '.01rem dashed rgba(211,211,211, .9)' }}
          >
            <Typography variant="body1" className="text-center d-inline">
              Al parecer no has registrado tu experiencia,
              <span className="fw-bold">¡Agrégala ahora!</span>
              <EditInfoButton text="Agregar información" />
            </Typography>
          </Col>
        </Row>
      </Paper>
    </Row>
  )
}

export default FourthSection
