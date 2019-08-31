import React from 'react'
import Head from 'next/head'
import { FormProvider } from '../context/formContext'
import Body from './layout/Body'
import FormButtons from './sections/FormButtons'
import FormBody from './sections/FormBody'
import allForms from './formJson'

const MainPage = () => {
  const myRef = React.createRef()

  const scrollTop = () => {
    setTimeout(() => {
      myRef.current.scrollIntoView({ behavior: 'smooth', block: 'start' })
    }, 50)
  }
  return (
    <div className="main-wrapper" ref={myRef}>
      <Head>
        <title>Creación de oferta</title>
        <meta name="description" content="Reactify Crm Dashboard" />
      </Head>
      <div className="d-flex my-50 justify-content-center w-100 ">
        {/* <FormProvider allForms={allForms}>
          <Body>
            <FormBody />
            <FormButtons scrollAction={scrollTop} />
          </Body>
        </FormProvider> */}
      </div>
    </div>
  )
}

export default MainPage
