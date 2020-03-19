import React from 'react'
import PropTypes from 'prop-types'
import Paper from '@material-ui/core/Paper'
import { Row } from 'reactstrap'
import { MuiPickersUtilsProvider } from '@material-ui/pickers'
import DateFnsUtils from '@date-io/date-fns'
import { es } from 'date-fns/locale'
import FormTitle from '../../../../../src/components/FormsLayout/FormTitle'
import FormButtons from '../../../../../src/components/FormsLayout/FormButtons'
import FormFields from './FormFields'
import { ShowMessage } from '../../shared/message'

const UsersWizardsStepTen = props => {
  const { formInfo, csrf_param, csrf_token } = props
  const {
    title,
    subtitle,
    form: { buttons, action, method, formFields, errors }
  } = formInfo

  const { nextPath, previousPath } = buttons

  return (
    <MuiPickersUtilsProvider utils={DateFnsUtils} locale={es}>
      <div className="m-formWrapper">
        <Row className="justify-content-center w-100 mx-0 px-20">
          <Paper className="d-flex flex-column position-relative paper-width justify-content-around align-items-center pt-60 mb-70">
            <>
              <FormTitle title={title} subtitle={subtitle} />
              <div className="w-80">
                <form
                  className="forms__candidate"
                  action={action}
                  method="post"
                  encType="multipart/form-data"
                >
                  {ShowMessage(errors, 'red')}
                  <input type="hidden" name={csrf_param} value={csrf_token} />
                  <input type="hidden" name="_method" value={method} />
                  <FormFields formFields={formFields} />
                  <div className="action-buttons-container" />
                  <FormButtons
                    nextPath={nextPath}
                    previousPath={previousPath}
                    buttons={buttons}
                  />
                </form>
              </div>
            </>
          </Paper>
        </Row>
      </div>
    </MuiPickersUtilsProvider>
  )
}

export default UsersWizardsStepTen

UsersWizardsStepTen.propTypes = {
  csrf_param: PropTypes.string,
  csrf_token: PropTypes.string,
  formInfo: PropTypes.shape({
    title: PropTypes.string.isRequired,
    subtitle: PropTypes.string,
    form: PropTypes.shape({
      buttons: PropTypes.shape({
        addOther: PropTypes.string,
        submit: PropTypes.string.isRequired,
        next: PropTypes.string.isRequired,
        nextPath: PropTypes.string.isRequired,
        previous: PropTypes.string.isRequired,
        previousPath: PropTypes.string.isRequired
      }),
      action: PropTypes.string.isRequired,
      method: PropTypes.string.isRequired,
      type: PropTypes.string.isRequired,
      formFields: PropTypes.object.isRequired
    })
  })
}
