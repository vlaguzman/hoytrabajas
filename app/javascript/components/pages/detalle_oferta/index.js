import React from 'react'
import { DynamicDetalle } from '../../src/views/DynamicViews'
import AppLayout from '../../src/components/Layout/AppLayout'

const MainPage = ({offer}) => (
  <AppLayout>
    <div className="detalle-wrapper">
      <DynamicDetalle offer={offer} />
    </div>
  </AppLayout>
)

export default MainPage
