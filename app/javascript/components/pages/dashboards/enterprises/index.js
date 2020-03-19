import React from 'react'
import PropTypes from 'prop-types'
import { DynamicBoardsEnterprises } from '../../../src/views/DynamicViews'
import AppLayout from '../../../src/components/Layout/AppLayout'

const DashBoarEnterprisesPage = props => {
  const { my_offers, edit_offer_path, component_translations } = props

  return (
    <div className="dashboardEnterprises-wrapper pcx">
      <AppLayout>
        <DynamicBoardsEnterprises
          my_offers={my_offers}
          component_translations={component_translations}
          edit_offer_path={edit_offer_path}
        />
      </AppLayout>
    </div>
  )
}

export default DashBoarEnterprisesPage

DashBoarEnterprisesPage.propTypes = {
  my_offers: PropTypes.object.isRequired,
  component_translations: PropTypes.object.isRequired,
  edit_offer_path: PropTypes.string.isRequired
}
