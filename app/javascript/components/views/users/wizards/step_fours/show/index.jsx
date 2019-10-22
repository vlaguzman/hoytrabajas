import React from 'react'
import { DynamicUsersWizardsStepFour } from '../../../../../src/views/DynamicViews'
import AppLayout from '../../../../../src/components/Layout/AppLayout'

const UsersWizardsStepFourPage = props => {
  return (
    <AppLayout {...props}>
      <DynamicUsersWizardsStepFour {...props} />
    </AppLayout>
  )
}

export default UsersWizardsStepFourPage
