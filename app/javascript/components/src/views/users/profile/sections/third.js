import React from 'react'
import Paper from '@material-ui/core/Paper'
import Typography from '@material-ui/core/Typography'
import { Row, Col } from 'reactstrap'
import { map } from 'lodash'
import DataCard from '../../../../components/Cards/DataCard'
import PaperHeader from '../../../../components/PaperHeader'
import CarouselRow from '../../../../components/Carousel/CarouselRow'
import AddEditButton from '../../../../views/users/profile/components/AddEditButton'

const data = [
  { titleSec: 'CineColombia', subTitleSec: 'Community Manager' },
  { titleSec: 'CineColombia', subTitleSec: 'Community Manager' },
  { titleSec: 'CineColombia', subTitleSec: 'Community Manager' },
  { titleSec: 'CineColombia', subTitleSec: 'Community Manager' }
]

const ThirdSection = () => {
  return (
    <Row className="justify-content-between w-100 px-20 mx-0 my-20">
      <Paper className="w-100 d-flex flex-column py-25 pr-20 paper-responsive-padding justify-content-center align-items-center">
        <PaperHeader titulo="Experiencia" />
        <Row className="w-100 external">
          <CarouselRow>
            {/* el contenido del map debe venir de una fuente externa */}
            {map(data, ({ titleSec, subTitleSec }, i) => (
              <Col key={i} xs={12}>
                <DataCard
                  middleDivider
                  headerKind="titleSubNoIconNoChipNoFavCloseEdit"
                  {...{ titleSec, subTitleSec }}
                  Chips={[{}, {}, {}]}
                  ChipsTitle="Responsabilidades"
                  haveContent
                  actions
                  bottomButton
                >
                  <Typography variant="caption" className="fw-bold text-muted">
                    Enero-2018 - Julio 2018
                  </Typography>
                </DataCard>
              </Col>
            ))}
          </CarouselRow>
        </Row>
        <Row className="w-100 justify-content-center">
          <AddEditButton  formNumber={4} texto="Agregar información" />
        </Row>
        <Row className="w-100 justify-content-center">
          <Col
            xs={10}
            className="p-10"
            style={{ border: '.01rem dashed rgba(211,211,211, .9)' }}
          >
            <Typography variant="body1" className="text-center d-inline">
              Al parecer no has registrado tu experiencia,
              <span className="fw-bold">¡Agrégala ahora!</span>
              <AddEditButton  formNumber={4} texto="Agregar información" />
            </Typography>
          </Col>
        </Row>
      </Paper>
    </Row>
  )
}

export default ThirdSection
