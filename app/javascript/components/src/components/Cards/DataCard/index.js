import React, { Fragment } from 'react'
import Card from '@material-ui/core/Card'
import CardContent from '@material-ui/core/CardContent'
import CardActions from '@material-ui/core/CardActions'
import Button from '@material-ui/core/Button'
import Typography from '@material-ui/core/Typography'
import Divider from '@material-ui/core/Divider'
import { Row, Col } from 'reactstrap'
import map from 'lodash/map'
import HorizontalBarChart from '../../Charts/HorizontalBarChart'
import CarouselRow from '../../Carousel/CarouselRow'
import MaterialList from './list'
import ChipsList from './Chips'
import CardHeaderComponent from './CardHeader'
import AddEditTimeUpdateButton from './underbuttons'

const horizontalData = {
  label: 'blandas',
  labels: ['Honestidad', 'Empatía', 'Responsabilidad'],
  chartdata: [8.5, 6.75, 5.5]
}
const allInALL = horizontalData.chartdata.map((e, i) => ({
  label1: horizontalData.labels[i],
  label2: e
}))

const DataCard = ({
  formNumber = 0,
  children,
  graph,
  middleDivider,
  bottomDivider,
  favourite,
  Chips,
  internalCarousel,
  internalList,
  editInfo,
  bottomButton,
  titleSec,
  subTitleSec,
  smallTitleSec,
  titleIcon,
  centerTitleSec,
  actions,
  haveContent,
  ChipsTitle,
  headerKind,
  arreglo
}) => {
  const internalCarouselContent = () =>
    map([{}, {}, {}], (item, i) => (
      <Col key={i}>
        <Typography
          variant="h5"
          className="fw-bold text-center"
          color="textSecondary"
          component="p"
        >
          3
        </Typography>
        <Typography
          variant="body1"
          className="text-center"
          color="textSecondary"
          component="p"
        >
          Personas han validado tus habilidades
        </Typography>
      </Col>
    ))

  return (
    <Card className="pt-25 px-25 pb-10 w-100">
      {/* *****Headers***** */}
      {
        {
          titleNoIconChipFav: (
            <CardHeaderComponent
              favorite
              upActions
              {...{ titleSec }}
              chipCheck
            />
          ),
          titleIconNoChipNoFav: (
            <CardHeaderComponent {...{ titleSec }} titleIcon />
          ),
          titleIconNoChipNoFavOnlyClose: (
            <CardHeaderComponent {...{ titleSec }} titleIcon upActions />
          ),
          titleSubNoIconNoChipNoFavCloseEdit: (
            <CardHeaderComponent
              {...{ titleSec }}
              {...{ subTitleSec }}
              {...{ smallTitleSec }}
              upActions
              withEdit
            />
          ),
          onlyTitle: <CardHeaderComponent {...{ titleSec }} />,
          centerTitleOnlyClose: (
            <CardHeaderComponent {...{ centerTitleSec }} upActions />
          ),
          centerTitle: <CardHeaderComponent {...{ centerTitleSec }} />
        }[headerKind]
      }
      {/* ************** */}
      {middleDivider && <Divider variant="middle" className="mx-0 my-10" />}
      {haveContent && (
        <CardContent className="p-0">
          {children}
          {/* *****Grafica***** */}
          <Row className="w-100 justify-content-center" noGutters>
            {graph && (
              <Col className="d-xs-none d-sm-flex" xs={10}>
                <HorizontalBarChart
                  label={horizontalData.label}
                  chartdata={horizontalData.chartdata}
                  labels={horizontalData.labels}
                  height={100}
                />
              </Col>
            )}
            {graph && (
              <Col className="d-sm-none d-xs-flex" xs={10}>
                <MaterialList internalList="withOutIcon" arreglo={allInALL} />
              </Col>
            )}
          </Row>
          {/* ************** */}
          {/* ****Listas****** */}
          {internalList && (
            <MaterialList {...{ internalList }} {...{ arreglo }} />
          )}
          {/* ************** */}
          {/* ****Chips****** */}
          {Chips && <ChipsList {...{ ChipsTitle }} {...{ Chips }} />}
          {/* ************** */}
          {/* ****Carusel****** */}
          {internalCarousel && (
            <CarouselRow slidesToShow={1}>
              {internalCarouselContent()}
            </CarouselRow>
          )}
          {/* ************** */}
        </CardContent>
      )}
      {editInfo && <Divider className="mx-0" variant="middle" />}
      {actions && (
        <CardActions className="pl-0 justify-content-between">
          {editInfo && (
            <AddEditTimeUpdateButton
              texto="Editar Información"
              tiempo="25 días"
              {...{ formNumber }}
            />
          )}
          {bottomButton && (
            <Button
              size="small"
              className="text-uppercase  text-white bg-purple m-0"
              style={{ fontSize: '.5rem' }}
              variant="contained"
            >
              Marketing
            </Button>
          )}
        </CardActions>
      )}
    </Card>
  )
}

export default DataCard
