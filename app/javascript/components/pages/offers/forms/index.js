import React from 'react'
import { DynamicOffersSteps } from '../../../src/views/DynamicViews'
import AppLayout from '../../../src/components/Layout/AppLayout'

const OffersStepsPage = props => {
  const { formIndex = 0 } = props
  return (
  <AppLayout>
    <DynamicOffersSteps formIndex={formIndex} />
  </AppLayout>
)}

export default OffersStepsPage
