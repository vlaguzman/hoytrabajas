import React from 'react'
import Head from 'next/head'

// los componentes de React deben comenzar con mayúscula
// Y el nombre asignado al componente
// también debe coincidir con el nombre del archivo
// import Presentation from './sections/presentation'

import Presentation from './sections/Presentation'
import FirstSection from './sections/FirstSection'

// preferiblemente, los nombres de las secciones
// deben ser más explicativos.

import SecondSection from './sections/second'
import ThirdSection from './sections/third'
import FourthSection from './sections/fourth'

const ProfilePage = ({ match }) => {
  return (
    <div className="ecom-dashboard-wrapper">
      <Head>
        <title>Perfil de usuario</title>
        <meta name="description" content="User profile" />
      </Head>
      <Presentation />
      <FirstSection />
      <SecondSection />
      <ThirdSection />
      <FourthSection />
    </div>
  )
}

export default ProfilePage
