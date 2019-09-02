import React from 'react'
import Head from 'next/head'
import Cortinilla from '../views/regcan/shared/Cortinilla'
import data from '../views/regcan/data'

const RegPage = () => (
  <div className="main-wrapper">
    <Head>
      <title>Registro de candidato</title>
      <meta name="description" content="Formularios de HoyTrabajas" />
    </Head>
    <div className="d-flex my-50 justify-content-center w-100 pb-50 ">
      <Cortinilla redirectTo="/" {...data[1]} />
    </div>
  </div>
)

export default RegPage
