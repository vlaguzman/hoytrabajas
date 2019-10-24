import React from 'react'
import { DynamicUsersWizardsStepThree } from '../../../../../src/views/DynamicViews'
import AppLayout from '../../../../../src/components/Layout/AppLayout'

const UsersWizardsStepThreePage = props => {
  return (
    <>
    {/* <AppLayout {...props} > */}
      <DynamicUsersWizardsStepThree {...props} />
    {/* </AppLayout> */}
    </>
  )
}

export default UsersWizardsStepThreePage
