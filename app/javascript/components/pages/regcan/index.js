import React, {Fragment} from 'react'
import { DynamicReg } from '../../src/views/DynamicViews'
import IsLoggedIn from '../../src/components/Permissions/IsLoggedIn'

const RegPage = () => (
  <Fragment>
    <IsLoggedIn>
      <DynamicReg />
    </IsLoggedIn>
  </Fragment>
)

export default RegPage
