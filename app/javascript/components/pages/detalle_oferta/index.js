import React from 'react'
import { DynamicDetalle } from '../../src/views/DynamicViews'
import AppLayout from '../../src/components/Layout/AppLayout'

const MainPage = (props) => (
  <AppLayout
    {...props}
  >
    <div className="detalle-wrapper">
      <DynamicDetalle {...props} />
    </div>
  </AppLayout>
)

export default MainPage
