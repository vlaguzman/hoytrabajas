import React, {Fragment} from 'react'
import { DynamicReg } from '../views/DynamicViews'
import IsLoggedIn from '../components/Permissions/IsLoggedIn'

const RegPage = () => (
  <Fragment>
    <IsLoggedIn>
      <DynamicReg />
    </IsLoggedIn>
  </Fragment>
)

export default RegPage
