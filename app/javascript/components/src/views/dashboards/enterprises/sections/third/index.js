import React, {Fragment} from 'react'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import IconButton from '@material-ui/core/IconButton'
import Button from '@material-ui/core/Button'
import Card from '@material-ui/core/Card'
import CardHeader from '@material-ui/core/CardHeader'
import CardContent from '@material-ui/core/CardContent'
import List from '@material-ui/core/List'
import ListItem from '@material-ui/core/ListItem'
import AgencyWelcomeBarChart from '../../../../../components/Charts/AgencyWelcomeBarChart'
import InputLabel from '@material-ui/core/InputLabel'
import MenuItem from '@material-ui/core/MenuItem'
import FormControl from '@material-ui/core/FormControl'
import Select from '@material-ui/core/Select'
import { WelcomeBarChart1 } from './data'
import FavoriteBorder from '@material-ui/icons/FavoriteBorder'
import CarouselRow from '../../../../../components/Carousel/CarouselRow'
import { map } from 'lodash';


const Third = () => {
  const theTitle = (texto) => (
    <Fragment>
    <IconButton className="p-0" aria-label="Settings">
      <FavoriteBorder />
    </IconButton>
    <Typography className="mb-10 ml-10 fw-bold d-lg-none" component='span' variant="h6">
                {texto}
    </Typography>
    </Fragment>
  )
  return (
    <Row noGutters className="w-100 justify-content-between my-30 px-20">
    <Col xs={12} className="bg-primary">
      <Card className="p-25">
        <CardHeader
          action={
            <Fragment>
              <Typography
                className="mt-20 mb-0 d-none d-lg-inline"
                variant="caption"
                component="p"
              >
                Última actualización
              </Typography>
              <Typography
                className="fw-bold d-none d-lg-inline"
                variant="caption"
                component="p"
              >
                martes, 05 de mayo de 2019{' '}
              </Typography>
            </Fragment>
          }
          title={theTitle('Informes')}
          subheader={
            <Typography className="mb-10 fw-bold d-none d-lg-inline" variant="h5">
              Informes
            </Typography>
          }
        />
        <CardContent>
          <FormControl className="w-30 ml-20 d-none d-lg-inline-block">
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
          <FormControl className="w-80 ml-20 d-lg-none">
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
          <div className='d-lg-none mt-50'>
            <CarouselRow >
            {map([{},{},{}], (item, i) => (
              <Col key={i} >
                        <div className="w-100 mr-0 ml-auto">
                          <AgencyWelcomeBarChart
                            data={WelcomeBarChart1.data}
                            labels={WelcomeBarChart1.labels}
                            color={WelcomeBarChart1.color}
                          />
                        </div>
                        <Row className="w-100 justify-content-between  mr-0 ml-auto">
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
                        <Typography className='text-center' variant="h6">Asesor contable</Typography>
                        <Typography className='text-center' variant="subtitle1">$ 1.800.000</Typography>
                        <Typography className='text-center' component='h6' variant="caption">20 Salarios</Typography>
                      </Col>
                ))}
            </CarouselRow>

          </div>
              <div className='d-none d-lg-block' >
                <Col className="p-50 ">
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

              </div>
        </CardContent>
      </Card>
    </Col>
  </Row>
  )
}

export default Third