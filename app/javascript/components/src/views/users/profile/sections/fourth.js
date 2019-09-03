import React from 'react'
import Paper from '@material-ui/core/Paper'
import Typography from '@material-ui/core/Typography'
import { Row, Col } from 'reactstrap'
import { map } from 'lodash'

// Usar rutas absolutas hacia la carpeta de componentes general (si son reutilizables)
// o hacia la carpeta de componentes propia de la vista
import DataCard from '../../../../components/Cards/DataCard'
import CarouselRow from '../../../../components/Carousel/CarouselRow'

// Evitar utilizar guión bajo para los nombres
// import PaperHeader from '../components/paper_header';
import PaperHeader from '../../../../components/PaperHeader'

// El nombre del componente importado debe coincidir con el nombre del archivo
// import ButtonsAuxiliars from '../components/buttons'
import AuxiliaryButtons from '../../../../views/users/profile/components/AuxiliaryButtons'
import AddEditButton from '../../../../views/users/profile/components/AddEditButton'

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
            {/* El contenido del map debe provenir de una fuente externa */}
            {map(data, ({ titleSec, subTitleSec, smallTitleSec }, i) => (
              // no utilizar index como key en los resultados de un map
              // preferiblemente utilizar otra propiedad del objeto del loop en cuestión
              <Col key={i} xs={12}>
                <DataCard
                  haveContent
                  headerKind="titleSubNoIconNoChipNoFavCloseEdit"
                  // las props pueden separarse por comas
                  {...{ titleSec, subTitleSec, smallTitleSec }}
                  // {...{ titleSec }}
                  // {...{ subTitleSec }}
                  // {...{ smallTitleSec }}
                  middleDivider
                >
                  <Typography variant="caption" className="fw-bold text-muted">
                    Enero 2019 - Estudio en curso
                  </Typography>
                </DataCard>
              </Col>
            ))}
          </CarouselRow>
        </Row>
        <AddEditButton formNumber={5} texto="Agregar información" />
        <AddEditButton formNumber={6} texto="Agregar información" />
        <Row className="w-100 justify-content-center">
          <Col
            xs={10}
            className="p-10"
            style={{ border: '.01rem dashed rgba(211,211,211, .9)' }}
          >
            <Typography variant="body1" className="text-center d-inline">
              Al parecer no has registrado tu experiencia,
              <span className="fw-bold">¡Agrégala ahora!</span>
              <AddEditButton formNumber={5} texto="Agregar información" />
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
              <AddEditButton formNumber={6} texto="Agregar información" />
            </Typography>
          </Col>
        </Row>
      </Paper>
    </Row>
  )
}

export default FourthSection
