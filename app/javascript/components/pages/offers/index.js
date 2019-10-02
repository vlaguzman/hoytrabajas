import React from 'react'
import { DynamicOffers } from '../../src/views/DynamicViews'
import AppLayout from '../../src/components/Layout/AppLayout'

const OffersPage = props => (
  <AppLayout>
    <DynamicOffers {...props} />
  </AppLayout>
)

export default OffersPage
