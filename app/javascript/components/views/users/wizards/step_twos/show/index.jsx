import React from 'react'
import { DynamicUsersWizardsStepTwo } from '../../../../../src/views/DynamicViews'
import AppLayout from '../../../../../src/components/Layout/AppLayout'

const UsersWizardsStepTwoPage = props => {
  return (
    <AppLayout>
      <DynamicUsersWizardsStepTwo {...props} />
    </AppLayout>
  )
}

export default UsersWizardsStepTwoPage
