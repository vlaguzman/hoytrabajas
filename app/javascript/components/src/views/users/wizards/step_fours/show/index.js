import React from 'react'
import PropTypes from 'prop-types'
import Paper from '@material-ui/core/Paper'
import { Row } from 'reactstrap'
import FormProgress from '../../../../../components/FormsLayout/FormProgress'
import FormTitle from '../../../../../components/FormsLayout/FormTitle'
import FormButtons from '../../../../../components/FormsLayout/FormButtons'
import FormFields from './FormFields'

const UsersWizardsStepFour = props => {
  const { formInfo, csrf_param, csrf_token } = props
  const {
    title,
    subtitle,
    form: { buttons, action, method, type, formFields }
  } = formInfo

  const { nextPath, previousPath } = buttons

  return (
    <div className="m-formWrapper">
      <FormProgress value={0} />
      <Row className="justify-content-center w-100 mx-0 px-20">
        <Paper className="d-flex flex-column position-relative paper-width justify-content-around align-items-center pt-60 mb-70">
          <>
            <FormTitle title={title} subtitle={subtitle} />
            <div className="w-80">
              <form className="forms__candidate" action={action} method="post">
                <input type="hidden" name={csrf_param} value={csrf_token} />
                <input type="hidden" name="_method" value={method} />
                <FormFields type={type} formFields={formFields} />
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
  )
}

export default UsersWizardsStepFour

UsersWizardsStepFour.propTypes = {
  csrf_param: PropTypes.string,
  csrf_token: PropTypes.string,
  formInfo: PropTypes.shape({
    title: PropTypes.string.isRequired,
    subtitle: PropTypes.string.isRequired,
    form: PropTypes.shape({
      buttons: PropTypes.shape({
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
