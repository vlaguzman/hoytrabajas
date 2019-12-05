import React, { useState } from 'react'
import Head from 'next/head'
import { useRouter } from 'next/router'
import { Row, Col } from 'reactstrap'
import Paper from '@material-ui/core/Paper'
import Typography from '@material-ui/core/Typography'
import Button from '@material-ui/core/Button'
import { data } from './data'

const ValidationsPage = () => {
  const [state, setState] = useState(data[0])
  console.log('estado', state.page)
  const changeState = indx => {
    state.kind.includes('m')
      ? setState({
          ...state,
          data: state.data.map((e, i) =>
            indx === i ? { ...e, selected: !e.selected } : e
          )
        })
      : setState({
          ...state,
          data: state.data.map((e, i) =>
            indx === i
              ? { ...e, selected: !e.selected }
              : { ...e, selected: false }
          )
        })
  }
  const changePage = () => {
    if (state.page != data.length) setState(data[state.page++])
  }
  return (
    <div className="validations-wrapper">
      <Head>
        <title>Validaciones de Datos</title>
        <meta name="description" content="Seccion de validaciones" />
      </Head>
      <Row className="mr-0 p-50 my-50 justify-content-center">
        <Col xs={4}>
          <Typography variant="h6" className="text-center">
            Gracias a personas como tu, podemos hacer posible que muchas
            personas encuentren su trabajo ideal.
          </Typography>
        </Col>
      </Row>
      <Row className="mb-70">
        <Paper className="p-70">
          <Row className="justify-content-center mr-0 my-50">
            <Col xs={8}>
              <Typography variant="h6" className="text-center">
                Andrés Gómez te ha invitado a validar sus habilidades completar
                su laboral ipsum or sit amet, consecut
              </Typography>
            </Col>
          </Row>
          <Row className="justify-content-center mr-0 my-50">
            <Paper className={`p-50 ${state.page === 3 ? 'w-80' : 'w-50'}`}>
              <Typography variant="subtitle1" className="fw-bold text-center">
                Qué relación tienes con [NAME]?
              </Typography>
              {/* <Col className='px-50'> */}
              <Row className="justify-content-center mr-0 mx-auto my-25">
                {state.data.map(({ label, size, selected }, i) => (
                  <Col key={i} xs={size} className="my-10 px-20">
                    <Button
                      style={{ boxShadow: 'none', color: 'darkgray' }}
                      onClick={() => changeState(i)}
                      variant="contained"
                      color={selected ? 'primary' : 'default'}
                      size="large"
                      className="text-white"
                    >
                      <span style={{ color: selected ? 'white' : 'darkgray' }}>
                        {label}
                      </span>
                    </Button>
                  </Col>
                ))}
                <Col xs={12} className="mt-25">
                  <Button
                    variant="contained"
                    onClick={changePage}
                    size="large"
                    color="primary"
                    className="w-40 mx-auto text-white"
                  >
                    Enviar
                  </Button>
                </Col>
              </Row>
              {/* </Col> */}
            </Paper>
          </Row>
        </Paper>
      </Row>
    </div>
  )
}

export default ValidationsPage
