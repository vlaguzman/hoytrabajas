import React from 'react'
import { DynamicHome } from '../src/views/DynamicViews'
import AppLayout from '../src/components/Layout/AppLayout'

const HomePage = ( { offers } ) => (

  <div className="main-wrapper">
    <AppLayout>
      <DynamicHome offers = { offers }/>
    </AppLayout>
  </div>
)

export default HomePage
