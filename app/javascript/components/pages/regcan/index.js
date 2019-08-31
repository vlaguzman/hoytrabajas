import React, {Fragment} from 'react'
import { DynamicReg } from 'Views/DynamicViews'
import IsLoggedIn from 'Components/Permissions/IsLoggedIn'

const RegPage = () => (
  <Fragment>
    <IsLoggedIn>
      <DynamicReg />
    </IsLoggedIn>
  </Fragment>
)

export default RegPage
