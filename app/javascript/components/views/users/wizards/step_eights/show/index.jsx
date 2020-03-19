import React from 'react'
import { DynamicUsersWizardsStepEight } from '../../../../../src/views/DynamicViews'
import { MuiPickersUtilsProvider } from '@material-ui/pickers';

import DateFnsUtils from '@date-io/date-fns';
import { es } from 'date-fns/locale'

const UsersWizardsStepEightPage = props => {
  return (
    <>
      <MuiPickersUtilsProvider utils={DateFnsUtils} locale={es}>
        <DynamicUsersWizardsStepEight {...props} />
      </MuiPickersUtilsProvider>
    </>
  )
}

export default UsersWizardsStepEightPage