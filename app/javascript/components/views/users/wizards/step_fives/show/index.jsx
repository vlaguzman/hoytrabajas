import React from 'react'
import { DynamicUsersWizardsStepFive } from '../../../../../src/views/DynamicViews'
import AppLayout from '../../../../../src/components/Layout/AppLayout'

const UsersWizardsStepFivePage = props => {
  return (
    <>
    {/* <AppLayout {...props}> */}
      <DynamicUsersWizardsStepFive {...props} />
    {/* </AppLayout> */}
    </>
  )
}

export default UsersWizardsStepFivePage
