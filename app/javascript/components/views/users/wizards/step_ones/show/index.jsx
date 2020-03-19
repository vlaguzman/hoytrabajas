import React from 'react'
import PropTypes from 'prop-types'
import { DynamicUsersWizardsStepOne } from '../../../../../src/views/DynamicViews'
import AppLayout from '../../../../../src/components/Layout/AppLayout'

const UsersWizardsStepOnePage = props => {
  return (
    <>
      <DynamicUsersWizardsStepOne {...props} />
    </>
  )
}

export default UsersWizardsStepOnePage

UsersWizardsStepOnePage.propTypes = {
  csrf_param: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired,
  log_out_companies: PropTypes.string.isRequired,
  company_signed_in: PropTypes.bool.isRequired,
  user_signed_in: PropTypes.bool.isRequired,
  log_out_user: PropTypes.string.isRequired,
  session_translation: PropTypes.object.isRequired
}
