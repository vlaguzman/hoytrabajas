import React, {Fragment} from 'react'
import { DynamicOffers } from '../../src/views/DynamicViews'
import IsLoggedIn from '../../src/components/Permissions/IsLoggedIn'

const OffersPage = () => (
  <Fragment>
    <IsLoggedIn>
      <DynamicOffers />
    </IsLoggedIn>
  </Fragment>
)

export default OffersPage
