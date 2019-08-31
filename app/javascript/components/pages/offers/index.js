import React, {Fragment} from 'react'
import { DynamicOffers } from '../views/DynamicViews'
import IsLoggedIn from '../components/Permissions/IsLoggedIn'

const OffersPage = () => (
  <Fragment>
    <IsLoggedIn>
      <DynamicOffers />
    </IsLoggedIn>
  </Fragment>
)

export default OffersPage
