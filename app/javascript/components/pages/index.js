import React from 'react'
import { DynamicHome } from '../src/views/DynamicViews'
import AppLayout from '../src/components/Layout/AppLayout'

const HomePage = () => (

  <div className="main-wrapper">
    <AppLayout>
      <DynamicHome />
    </AppLayout>
  </div>
)

export default HomePage
