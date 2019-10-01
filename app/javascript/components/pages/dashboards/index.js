import React from 'react'
import { DynamicBoards } from '../../src/views/DynamicViews'
import AppLayout from '../../src/components/Layout/AppLayout'

const MainPage = () => (
  <AppLayout>
    <div className="dashboards-wrapper pcx">
      <DynamicBoards />
    </div>
  </AppLayout>
)

export default MainPage
