import React from 'react'
import { DynamicCompaniesStepFour } from '../../../../../src/views/DynamicViews'
import { MuiPickersUtilsProvider } from '@material-ui/pickers';

import DateFnsUtils from '@date-io/date-fns';
import { es } from 'date-fns/locale'

const CompaniesStepFourPage = props => {

  return (
    <>
      <MuiPickersUtilsProvider utils={DateFnsUtils} locale={es}>
        <DynamicCompaniesStepFour {...props} />
      </MuiPickersUtilsProvider>
    </>
  )
}

export default CompaniesStepFourPage
