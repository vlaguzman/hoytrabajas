import React, { Fragment } from 'react'
import Typography from '@material-ui/core/Typography'
import Paper from '@material-ui/core/Paper'
import { Row, Col } from 'reactstrap'
import DataCard from 'Components/Cards/DataCard'
import PaperHeader from 'Components/PaperHeader'
import CarouselRow from 'Components/Carousel/CarouselRow'
import { map } from 'lodash'
import AddEditButton from 'Views/users/profile/components/AddEditButton'
import { listOfNoIcons } from 'Views/users/profile/data'

const SecondSection = () => {
  return (
    <Fragment>
      <Row className="justify-content-between w-100 px-20 mx-0 my-20">
        <Paper className="w-100 d-flex flex-column py-25 pr-20 paper-responsive-padding justify-content-center align-items-center">
          <PaperHeader titulo="Habilidades" />
          <Row className="w-100 justify-content-start pl-10">
            <Typography variant="h6" className="fw-bold text-left">
              Blandas
            </Typography>
          </Row>
          <Row className="w-100">
            <Col className="py-10 px-0" xs={12} sm={12} lg={8}>
              <DataCard haveContent graph />
            </Col>
            <Col className="py-10 px-0" xs={12} sm={12} lg={4}>
              <DataCard
                headerKind="onlyTitle"
                titleSec="Idiomas"
                haveContent
                internalList="withOutIcon"
                arreglo={listOfNoIcons}
              >
                <Row className="w-100 justify-content-center" noGutters>
                  <Col
                    xs={9}
                    className="p-10"
                    style={{ border: '.01rem dashed rgba(211,211,211, .9)' }}
                  >
                    <Typography
                      variant="body1"
                      className="text-center d-inline"
                    >
                      <AddEditButton texto="Agregar información" />
                    </Typography>
                  </Col>
                </Row>
              </DataCard>
            </Col>
          </Row>
          <Row className="w-100 justify-content-start pl-10">
            <Typography variant="h6" className="fw-bold text-left">
              Técnicas
            </Typography>
          </Row>
          <Row className="w-100">
            {[
              { titleSec: 'Eventos y Protocolo' },
              { titleSec: 'Diseño' },
              { titleSec: 'Marketing' }
            ].map(({ titleSec }) => (
              <Col key={titleSec} className="py-10 px-0" xs={12} sm={12} lg={4}>
                <DataCard
                  middleDivider
                  internalCarousel
                  headerKind="titleIconNoChipNoFavOnlyClose"
                  {...{ titleSec }}
                  Chips={[{}, {}, {}]}
                  haveContent
                />
              </Col>
            ))}
          </Row>
          <Row className="w-100 justify-content-start pl-10">
            <Typography variant="h6" className="fw-bold text-left">
              Habilidades a aprender o reforzar
            </Typography>
          </Row>
          <Row className="w-100 external">
            <CarouselRow>
              {map(
                [
                  { centerTitleSec: 'Redes sociales' },
                  { centerTitleSec: 'Analitica web' },
                  { centerTitleSec: 'Analitica web' },
                  { centerTitleSec: 'Programación web' }
                ],
                ({ centerTitleSec }, i) => (
                  <Col key={i} xs={12}>
                    <DataCard
                      headerKind="centerTitleOnlyClose"
                      {...{ centerTitleSec }}
                    />
                  </Col>
                )
              )}
            </CarouselRow>
          </Row>
          <AddEditButton formNumber={3} texto="Editar información" />
          <Row className="w-100 justify-content-center">
            <Col
              xs={10}
              className="p-10"
              style={{ border: '.01rem dashed rgba(211,211,211, .9)' }}
            >
              <Typography variant="body1" className="text-center d-inline">
                Al parecer no has registrado tu experiencia,
                <span className="fw-bold">¡Agrégala ahora!</span>
                <AddEditButton formNumber={3} texto="Agregar información" />
              </Typography>
            </Col>
          </Row>
        </Paper>
      </Row>
    </Fragment>
  )
}

export default SecondSection
