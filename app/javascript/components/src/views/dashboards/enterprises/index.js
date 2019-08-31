import React, { Fragment } from 'react'
import Presentation from './sections/presentation'
import First from './sections/first'
import Second from './sections/second'
import Third from './sections/third'

const DashEnterprises = () => {

  return (
    <Fragment>
      <Presentation />
      <First />
      <Second />
      <Third />
    </Fragment>
  )
}

export default DashEnterprises


{/* <Fragment>

<Row noGutters className="w-100 justify-content-between my-30">
  <Col xs={12} className="bg-primary">
    <Card className="p-25">
      <CardHeader
        {...{ title }}
        subheader={
          <Typography className="mb-10 fw-bold" variant="h5">
            Mis ofertas
          </Typography>
        }
      />
      <CardContent>

      </CardContent>
    </Card>
  </Col>
</Row>
<Row noGutters className="w-100 justify-content-between my-30">
  <Col xs={12} className="bg-primary">
    <Card className="p-25">
      <CardHeader
        action={
          <Fragment>
            <Typography
              className="mt-20 mb-0"
              variant="caption"
              component="p"
            >
              Última actualización
            </Typography>
            <Typography
              className="fw-bold"
              variant="caption"
              component="p"
            >
              martes, 05 de mayo de 2019{' '}
            </Typography>
          </Fragment>
        }
        {...{ title }}
        subheader={
          <Typography className="mb-10 fw-bold" variant="h5">
            Informes
          </Typography>
        }
      />
      <CardContent>
        <FormControl className="w-30 ml-20">
          <InputLabel htmlFor="age-simple">Marketing y ventas</InputLabel>
          <Select
            value=""
            // onChange={handleChange}
            inputProps={{
              name: 'age',
              id: 'age-simple'
            }}
          >
            <MenuItem value={10}>Ten</MenuItem>
            <MenuItem value={20}>Twenty</MenuItem>
            <MenuItem value={30}>Thirty</MenuItem>
          </Select>
        </FormControl>
        <Col className="p-50">
          <Row noGutters className="w-100 justify-content-between">
            <Col md={5}>
              <Typography variant="h6">Asesor contable</Typography>
            </Col>
            <Col md={3}>
              <Typography variant="h6">$ 1.800.000</Typography>
              <Typography variant="caption">20 Salarios</Typography>
            </Col>
            <Col md={4}>
              <div className="w-60 mr-0 ml-auto">
                <AgencyWelcomeBarChart
                  data={WelcomeBarChart1.data}
                  labels={WelcomeBarChart1.labels}
                  color={WelcomeBarChart1.color}
                />
              </div>
              <Row className="w-60 justify-content-between  mr-0 ml-auto">
                <Typography
                  variant="caption"
                  className="text-left"
                  component="span"
                >
                  $500.000
                </Typography>
                <Typography
                  variant="caption"
                  className="text-right"
                  component="span"
                >
                  $1'000.000
                </Typography>
              </Row>
            </Col>
          </Row>
          <Row noGutters className="w-100 justify-content-between">
            <Col md={5}>
              <Typography variant="h6">Contador público</Typography>
            </Col>
            <Col md={3}>
              <Typography variant="h6">$ 3.000.000</Typography>
              <Typography variant="caption">20 Salarios</Typography>
            </Col>
            <Col md={4}>
              <div className="w-60 mr-0 ml-auto">
                <AgencyWelcomeBarChart
                  data={WelcomeBarChart1.data}
                  labels={WelcomeBarChart1.labels}
                  color={WelcomeBarChart1.color}
                />
              </div>
              <Row className="w-60 justify-content-between  mr-0 ml-auto">
                <Typography
                  variant="caption"
                  className="text-left"
                  component="span"
                >
                  $500.000
                </Typography>
                <Typography
                  variant="caption"
                  className="text-right"
                  component="span"
                >
                  $1'000.000
                </Typography>
              </Row>
            </Col>
          </Row>
          <Row noGutters className="w-100 justify-content-between">
            <Col md={5}>
              <Typography variant="h6">Auxiliar de archivo</Typography>
            </Col>
            <Col md={3}>
              <Typography variant="h6">$ 800.000</Typography>
              <Typography variant="caption">20 Salarios</Typography>
            </Col>
            <Col md={4}>
              <div className="w-60 mr-0 ml-auto">
                <AgencyWelcomeBarChart
                  data={WelcomeBarChart1.data}
                  labels={WelcomeBarChart1.labels}
                  color={WelcomeBarChart1.color}
                />
              </div>
              <Row className="w-60 justify-content-between  mr-0 ml-auto">
                <Typography
                  variant="caption"
                  className="text-left"
                  component="span"
                >
                  $500.000
                </Typography>
                <Typography
                  variant="caption"
                  className="text-right"
                  component="span"
                >
                  $1'000.000
                </Typography>
              </Row>
            </Col>
          </Row>
        </Col>
      </CardContent>
    </Card>
  </Col>
</Row>
</Fragment> */}