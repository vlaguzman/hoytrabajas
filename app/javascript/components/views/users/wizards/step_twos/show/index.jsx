import React from 'react'
import PropTypes from 'prop-types'
import { DynamicUsersWizardsStepTwo } from '../../../../../src/views/DynamicViews'
import { MuiPickersUtilsProvider } from '@material-ui/pickers';

import DateFnsUtils from '@date-io/date-fns';
import { es } from 'date-fns/locale'

const UsersWizardsStepTwoPage = props => {
  return (
    <>
      <MuiPickersUtilsProvider utils={DateFnsUtils} locale={es}>
        <DynamicUsersWizardsStepTwo {...props} />
      </MuiPickersUtilsProvider>
    </>
  )
}

export default UsersWizardsStepTwoPage

UsersWizardsStepTwoPage.propTypes = {
  csrf_param: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired,
  log_out_companies: PropTypes.string.isRequired,
  company_signed_in: PropTypes.bool.isRequired,
  user_signed_in: PropTypes.bool.isRequired,
  log_out_user: PropTypes.string.isRequired,
  session_translation: PropTypes.object.isRequired
}
