import React from 'react'
import { DynamicHome } from '../src/views/DynamicViews'
import AppLayout from '../src/components/Layout/AppLayout'

const HomePage = ( { offers, csrf_param, csrf_token } ) => (

  <div className="main-wrapper">
    <AppLayout csrf_param = {csrf_param} csrf_token={csrf_token}>
      <DynamicHome offers = { offers } />
    </AppLayout>
  </div>
)

export default HomePage
