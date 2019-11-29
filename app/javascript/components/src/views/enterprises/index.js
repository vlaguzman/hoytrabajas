import React from 'react'
import Head from 'next/head'
// los nombres de secciones deben ser más descriptivos
import FirstSection from './sections/first'
import SecondSection from './sections/second'
import ThirdSection from './sections/third'
import FourthSection from './sections/fourth'

const EnterprisesPage = () => {
  return (
    <>
      <Head>
        <title>Dashboard Empresa</title>
        <meta name="description" content="HoyTrabajas Company Dashboard" />
      </Head>
      <FirstSection />
      <SecondSection />
      <ThirdSection />
      <FourthSection />
    </>
  )
}

export default EnterprisesPage
