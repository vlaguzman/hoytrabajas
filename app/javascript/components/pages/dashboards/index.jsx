import React from 'react'
import { DynamicBoards } from '../../src/views/DynamicViews'
import AppLayout from '../../src/components/Layout/AppLayout'

const MainPage = props => (
  <AppLayout {...props}>
    <div className="dashboards-wrapper pcx">
      <DynamicBoards {...props} />
    </div>
  </AppLayout>
)

export default MainPage
