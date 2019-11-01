import React from 'react'
import PropTypes from 'prop-types'
import { DynamicBoards } from '../../src/views/DynamicViews'
import AppLayout from '../../src/components/Layout/AppLayout'

const MainPage = (props) => (
 <AppLayout {...props}>
    <div className="dashboards-wrapper pcx">
      <DynamicBoards {...props} />
    </div>
  </AppLayout>
)

export default MainPage

MainPage.propTypes = {
  csrf_param: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired,
  user_signed_in: PropTypes.bool.isRequired,
  company_signed_in: PropTypes.bool.isRequired,
  log_out_user: PropTypes.string.isRequired,
  log_out_companies: PropTypes.string.isRequired,
  session_translation: PropTypes.object.isRequired,
}
