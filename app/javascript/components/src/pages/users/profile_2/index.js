/**
 * Crm Dashboard
 */
/* eslint-disable */
import React from 'react'
import { Helmet } from "react-helmet";
import Saludo from './sections/presentation'
import FirstSection from './sections/first'
import SecondSection from './sections/second'
import ThirdSection from './sections/third'
import FourthSection from './sections/fourth'

// intl messages
import IntlMessages from 'Util/IntlMessages';


export default ({ match }) => {

      return (
         <div className="ecom-dashboard-wrapper">
            <Helmet>
               <title>Perfil de candidato</title>
               <meta name="description" content="Reactify Crm Dashboard" />
            </Helmet>
            <Saludo />
            <FirstSection />
            <SecondSection />
            <ThirdSection />
            <FourthSection />
         </div>
      )
}

