import React from 'react'
import { DynamicCompaniesStepTwo } from '../../../../../src/views/DynamicViews'
import AppLayout from '../../../../../src/components/Layout/AppLayout'

const CompaniesStepTwoPage = props => {
  return (
    <AppLayout>
      <DynamicCompaniesStepTwo {...props} />
    </AppLayout>
  )
}

export default CompaniesStepTwoPage
