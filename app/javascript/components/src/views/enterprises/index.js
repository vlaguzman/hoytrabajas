import React, {Fragment} from 'react'
import Head from 'next/head'
// los nombres de secciones deben ser más descriptivos
import FirstSection from './sections/first'
import SecondSection from './sections/second'
import ThirdSection from './sections/third'
import FourthSection from './sections/fourth'

const EnterprisesPage = () => {
  return (
    <Fragment>
      <Head>
        <title>Dashboard Empresa</title>
        <meta name="description" content="HoyTrabajas Enterprise Dashboard" />
      </Head>
      <FirstSection />
      <SecondSection />
      <ThirdSection />
      <FourthSection />
    </Fragment>
    // <div className="main-wrapper">
    // </div>
  )
}

export default EnterprisesPage
