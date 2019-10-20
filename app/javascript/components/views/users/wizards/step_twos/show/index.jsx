import React from 'react'
import PropTypes from 'prop-types'
import { DynamicUsersWizardsStepTwo } from '../../../../../src/views/DynamicViews'
import AppLayout from '../../../../../src/components/Layout/AppLayout'

const UsersWizardsStepTwoPage = props => {
  return (
    <AppLayout
      log_out_companies={props.log_out_companies}
      company_signed_in={props.company_signed_in}
      user_signed_in={props.user_signed_in}
      log_out_user={props.log_out_user}
      csrf_param={props.csrf_param}
      csrf_token={props.csrf_token}
      session_translation={props.session_translation}
    >
      <DynamicUsersWizardsStepTwo {...props} />
    </AppLayout>
  )
}

export default UsersWizardsStepTwoPage

UsersWizardsStepTwoPage.propTypes = {
  csrf_name: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired,
  log_out_companies: PropTypes.string.isRequired,
  company_signed_in: PropTypes.bool.isRequired,
  user_signed_in: PropTypes.bool.isRequired,
  log_out_user: PropTypes.string.isRequired,
  session_translation: PropTypes.object.isRequired
}
