import React, {Fragmemt} from 'react'
import Head from 'next/head'
import { useRouter } from 'next/router'
import Cortinilla from './shared/Cortinilla'
import data from './data'

const RegPage = () => {

  return (
    <Fragment>
      <Head>
        <title>Registro de candidato</title>
        <meta name="description" content="Formularios de HoyTrabajas" />
      </Head>
      <div className="d-flex my-50 justify-content-center w-100 pb-50 ">
        <Cortinilla redirectTo="/regcan/forms" {...data[0]} />
      </div>
    </Fragment>
  )
}

export default RegPage
