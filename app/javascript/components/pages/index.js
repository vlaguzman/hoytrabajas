import React from 'react'
import PropTypes from 'prop-types'
import { DynamicHome } from '../src/views/DynamicViews'
import AppLayout from '../src/components/Layout/AppLayout'

const HomePage = ({
  offers,
  offers_path,
  csrf_param,
  csrf_token,
  path_applied_offers,
  new_offer_path,
  home_translations,
  offer_translations,
  filterForm,
  common
}) => {
  return (
    <div className="main-wrapper">
      <AppLayout>
        <DynamicHome
          offers={offers}
          offers_path={offers_path}
          home_translations={home_translations}
          offer_translations={offer_translations}
          new_offer_path={new_offer_path}
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
  new_offer_path: PropTypes.string.isRequired,
  path_applied_offers: PropTypes.string.isRequired,
  offers_path: PropTypes.string.isRequired,
  offers: PropTypes.object.isRequired,
  offer_translations: PropTypes.object.isRequired,
  home_translations: PropTypes.object.isRequired,
  filterForm: PropTypes.object.isRequired,
  common: PropTypes.object.isRequired
}
