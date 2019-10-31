import React from 'react'
import { DynamicUsersWizardsStepNine } from '../../../../../src/views/DynamicViews'
import { MuiPickersUtilsProvider } from '@material-ui/pickers';

import DateFnsUtils from '@date-io/date-fns';
import { es } from 'date-fns/locale'

const UsersWizardsStepNinePage = props => {
  return (
    <>
      <MuiPickersUtilsProvider utils={DateFnsUtils} locale={es}>
        <DynamicUsersWizardsStepNine {...props} />
      </MuiPickersUtilsProvider>
    </>
  )
}

export default UsersWizardsStepNinePage