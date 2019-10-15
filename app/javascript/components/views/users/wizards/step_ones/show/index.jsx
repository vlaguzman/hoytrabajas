import React from 'react'
import { DynamicUsersWizardsStepOne } from '../../../../../src/views/DynamicViews'
import AppLayout from '../../../../../src/components/Layout/AppLayout'

const UsersWizardsStepOnePage = props => {
  return (
    <AppLayout>
      <DynamicUsersWizardsStepOne {...props} />
    </AppLayout>
  )
}

export default UsersWizardsStepOnePage
