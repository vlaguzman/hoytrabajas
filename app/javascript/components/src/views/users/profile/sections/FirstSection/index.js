import React, { Fragment } from 'react'
import Typography from '@material-ui/core/Typography'
import { Row, Col } from 'reactstrap'
import DataCard from '../components/Cards/DataCard'
import ProfileContent from '../components/Cards/DataCard/Content/ProfileContent'
import { listOfIcons } from '../views/users/profile/data'
import allForms from '../views/users/profile/formJson'

const findForm = sectionName =>
  allForms.find(form => form.formSection === sectionName)

const FirstSection = () => {
  return (
    <Fragment>
      <Row className="justify-content-between w-100 px-5 mx-0 my-20">
        <Col className="py-10" xs={12} sm={12} lg={6}>
          <DataCard
            headerKind="titleNoIconChipFav"
            actions
            editInfo
            haveContent
            titleSec="Datos"
          >
            <ProfileContent
              fields={findForm('basic_info').formObj}
              formSection={findForm('basic_info').formSection}
              dataSection="basic_info"
              formName="candidate"
            />
          </DataCard>
        </Col>
        <Col className="py-10" xs={12} sm={12} lg={6}>
          <Col className="px-10 mb-5">
            <DataCard
              headerKind="titleIconNoChipNoFav"
              titleSec="¿Cuál es tu disponibilidad laboral hoy?"
            />
          </Col>
          <Col className="px-10 mt-5">
            <DataCard
              headerKind="onlyTitle"
              haveContent
              titleSec="Mi curriculum"
              internalList="withIcon"
              arreglo={listOfIcons}
            />
          </Col>
        </Col>
      </Row>
      <Row className="justify-content-between w-100 px-5 mx-0 my-20">
        <Col className="py-10" xs={12} sm={12} lg={6}>
          <DataCard
            haveContent
            headerKind="titleNoIconChipFav"
            actions
            editInfo
            titleSec="Sobre mi"
            formNumber={1}
          >
            <Typography
              variant="body1"
              component="p"
              className="text-muted pt-20 pb-10"
            >
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
              eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
              enim ad minim veniam, quis nostrud exercitation ullamco laboris
              nisi ut aliq...<span className="text-warning">ver más</span>
            </Typography>
            <Col className="py-20 px-0">
              <Row className="justify-content-between">
                <Col xs={12} sm={6} className="my-10">
                  <Typography variant="body2" className="text-muted text-left">
                    Situación laboral actual
                  </Typography>
                </Col>
                <Col xs={12} sm={6} className="my-10">
                  <Typography variant="body2" className="text-right">
                    Desempleado
                  </Typography>
                </Col>
              </Row>
              <Row className="justify-content-between">
                <Col xs={12} sm={6} className="my-10">
                  <Typography variant="body2" className="text-muted text-left">
                    Nivel de Educacion
                  </Typography>
                </Col>
                <Col xs={12} sm={6} className="my-10">
                  <Typography variant="body2" className="text-right">
                    Bachiller
                  </Typography>
                </Col>
              </Row>
            </Col>
          </DataCard>
        </Col>
        <Col className="py-10" xs={12} sm={12} lg={6}>
          <DataCard
            headerKind="titleNoIconChipFav"
            actions
            editInfo
            titleSec="Intereses"
            haveContent
            formNumber={2}
          >
            <Col className="py-25">
              <Row className="justify-content-between">
                <Col className="px-0 my-5" xs={12} sm={5}>
                  <Typography variant="body2" className="text-muted text-left">
                    Categorías
                  </Typography>
                </Col>
                <Col className="px-0 my-5" xs={12} sm={7}>
                  <Typography
                    variant="body2"
                    style={{ lineHeight: '1.3rem' }}
                    className="text-right-sm-left"
                  >
                    Ventas, Marketing, Diseño
                  </Typography>
                </Col>
              </Row>
              <Row className="justify-content-between">
                <Col className="px-0 my-5" xs={12} sm={5}>
                  <Typography variant="body2" className="text-muted text-left">
                    Búsqueda en
                  </Typography>
                </Col>
                <Col className="px-0 my-5" xs={12} sm={7}>
                  <Typography
                    variant="body2"
                    style={{ lineHeight: '1.3rem' }}
                    className="text-right-sm-left"
                  >
                    Bogotá - Suba
                  </Typography>
                </Col>
              </Row>
              <Row className="justify-content-between">
                <Col className="px-0 my-5" xs={12} sm={5}>
                  <Typography variant="body2" className="text-muted text-left">
                    Tipo de oferta
                  </Typography>
                </Col>
                <Col className="px-0 my-5" xs={12} sm={7}>
                  <Typography
                    variant="body2"
                    style={{ lineHeight: '1.3rem' }}
                    className="text-right-sm-left"
                  >
                    Por horas - Tiempo completo
                  </Typography>
                </Col>
              </Row>
              <Row className="justify-content-between">
                <Col className="px-0 my-5" xs={12} sm={5}>
                  <Typography variant="body2" className="text-muted text-left">
                    Disponibilidad de trabajo
                  </Typography>
                </Col>
                <Col className="px-0 my-5" xs={12} sm={7}>
                  <Typography
                    variant="body2"
                    style={{ lineHeight: '1.3rem' }}
                    className="text-right-sm-left"
                  >
                    Lunes a viernes - Fines de semana
                  </Typography>
                </Col>
              </Row>
              <Row className="justify-content-between">
                <Col className="px-0 my-5" xs={12} sm={5}>
                  <Typography variant="body2" className="text-muted text-left">
                    Franja horaria
                  </Typography>
                </Col>
                <Col className="px-0 my-5" xs={12} sm={7}>
                  <Typography
                    variant="body2"
                    style={{ lineHeight: '1.3rem' }}
                    className="text-right-sm-left"
                  >
                    Mañana 7am - 1pm
                  </Typography>
                </Col>
              </Row>
              <Row className="justify-content-between">
                <Col className="px-0 my-5" xs={12} sm={5}>
                  <Typography variant="body2" className="text-muted text-left">
                    Salario
                  </Typography>
                </Col>
                <Col className="px-0 my-5" xs={12} sm={7}>
                  <Typography
                    variant="body2"
                    style={{ lineHeight: '1.3rem' }}
                    className="text-right-sm-left"
                  >
                    COP 750.000 a 1.200.000
                  </Typography>
                </Col>
              </Row>
            </Col>
          </DataCard>
        </Col>
      </Row>
    </Fragment>
  )
}

export default FirstSection
