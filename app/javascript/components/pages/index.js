import React from 'react'
import PropTypes from 'prop-types'
import { DynamicHome } from '../src/views/DynamicViews'
import AppLayout from '../src/components/Layout/AppLayout'

const HomePage = ({
  offers,
  csrf_param,
  csrf_token,
  path_applied_offers,
  offer_translations,
  filterForm,
  common
}) => {
  return (
    <div className="main-wrapper">
      <AppLayout>
        <DynamicHome
          offers={offers}
          offer_translations={offer_translations}
          path_applied_offers={path_applied_offers}
          csrf_param={csrf_param}
          csrf_token={csrf_token}
          filterForm={filterForm}
          common={common}
        />
      </AppLayout>
    </div>
  )
}
export default HomePage

HomePage.propTypes = {
  csrf_param: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired,
  path_applied_offers: PropTypes.string.isRequired,
  offers: PropTypes.object.isRequired,
  offer_translations: PropTypes.object.isRequired,
  filterForm: PropTypes.object.isRequired,
  common: PropTypes.object.isRequired
}
