import React, {Fragment} from 'react'
import { DynamicReg } from '../../src/views/DynamicViews'
import AppLayout from '../../src/components/Layout/AppLayout'

const RegPage = () => (
  <Fragment>
    <AppLayout>
      <DynamicReg />
    </AppLayout>
  </Fragment>
)

export default RegPage
