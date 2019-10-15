import React from 'react'
import { DynamicCompaniesStepOne } from '../../../../../src/views/DynamicViews'
import AppLayout from '../../../../../src/components/Layout/AppLayout'

const CompaniesStepOnePage = props => {
  return (
    <AppLayout>
      <DynamicCompaniesStepOne {...props} />
    </AppLayout>
  )
}

export default CompaniesStepOnePage
