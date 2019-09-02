import React from 'react'
import Head from 'next/head'
import { useRouter } from 'next/router'
import {Row, Col} from 'reactstrap'
import GalleryCards from '../components/galleryCards';
import Button from '@material-ui/core/Button'

const RegPage = () => {

  return (
    <div className="main-wrapper">
      <Head>
        <title>Registro de candidato</title>
        <meta name="description" content="Formularios de HoyTrabajas" />
      </Head>
      <Col className="my-50 justify-content-center w-100 pb-50">
      <Row  className="justify-content-center">
        <GalleryCards cards={Array(9).fill(null)} />
      </Row>
      <Row className='justify-content-center my-50' >
        <Col xs={6}>
          <Button variant='outlined' color='primary' style={{borderRadius: '20px'}} >
            más resultados
          </Button>
        </Col>
      </Row>
      </Col>
    </div>
  )
}

export default RegPage