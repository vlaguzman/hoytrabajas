/**
 * Crm Routes
 */

import React from 'react'
import { Redirect, Route, Switch } from 'react-router-dom'

import { AsyncEnterprisesMainRole } from 'Pages/AsyncPages'

const RouteEnterprises = ({ match }) => (
  <div className="enterprises-wrapper pcx">
    <Switch>
      <Redirect exact from={`${match.url}/`} to={`${match.url}/main`} />
      <Route path={`${match.url}/main`} component={AsyncEnterprisesMainRole} />
    </Switch>
  </div>
)

export default RouteEnterprises
