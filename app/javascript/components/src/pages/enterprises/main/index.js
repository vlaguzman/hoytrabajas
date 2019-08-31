import React from 'react'
import Head from 'next/head'
import { Row } from 'reactstrap'
import FirstSection from './sections/first'
import SecondSection from './sections/second'
import ThirdSection from './sections/third'
import FourthSection from './sections/fourth'

const Main = () => {
  return (
    <div className="main-wrapper">
      <Head>
        <title>DashBoard Empresa</title>
        <meta name="description" content="HoyTrabajas Enterprise Dashboard" />
      </Head>
      <FirstSection />
      <SecondSection />
      <ThirdSection />
      <FourthSection />
    </div>
  )
}

export default Main
