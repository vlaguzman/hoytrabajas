import React from 'react'
import { MuiPickersUtilsProvider } from '@material-ui/pickers'

import DateFnsUtils from '@date-io/date-fns'
import { es } from 'date-fns/locale'
import { DynamicUsersWizardsStepTen } from '../../../../../src/views/DynamicViews'

const UsersWizardsStepTenPage = props => {
  return (
    <>
      <MuiPickersUtilsProvider utils={DateFnsUtils} locale={es}>
        <DynamicUsersWizardsStepTen {...props} />
      </MuiPickersUtilsProvider>
    </>
  )
}

export default UsersWizardsStepTenPage
