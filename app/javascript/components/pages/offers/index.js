import React, {Fragment} from 'react'
import { DynamicOffers } from 'Views/DynamicViews'
import IsLoggedIn from 'Components/Permissions/IsLoggedIn'

const OffersPage = () => (
  <Fragment>
    <IsLoggedIn>
      <DynamicOffers />
    </IsLoggedIn>
  </Fragment>
)

export default OffersPage
