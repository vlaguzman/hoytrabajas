import React from 'react'
import PropTypes from 'prop-types'
import Paper from '@material-ui/core/Paper'
import { Row } from 'reactstrap'
import FormProgress from '../../../../../components/FormsLayout/FormProgress'
import FormTitle from '../../../../../components/FormsLayout/FormTitle'
import FormButtons from '../../../../../components/FormsLayout/FormButtons'
import FormFields from './FormFields'
import { showMessage } from '../../shared/message'

const UsersWizardsStepNine = props => {
  const {
    formInfo,
    csrf_param,
    csrf_token,
    registered_messages
  } = props
  const {
    title,
    subtitle,
    form: { buttons, action, method, formFields, errors }
  } = formInfo
  const { nextPath, previousPath } = buttons

  return (
    <div className="main-wrapper">
      <FormProgress value={0} />
      <Row className="mt-10 mb-70 justify-content-center w-100 pb-50 mx-0 px-20">
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
                <p>{registered_messages}</p>
                {showMessage(errors, 'red')}
                <input type="hidden" name={csrf_param} value={csrf_token} />
                <input type="hidden" name="_method" value={method} />
                <FormFields formFields={formFields} />
                <div className="action-buttons-container">
                </div>
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

export default UsersWizardsStepNine

UsersWizardsStepNine.propTypes = {
  csrf_param: PropTypes.string,
  csrf_token: PropTypes.string,
  formInfo: PropTypes.shape({
    title: PropTypes.string.isRequired,
    subtitle: PropTypes.string,
    form: PropTypes.shape({
      buttons: PropTypes.shape({
        submit: PropTypes.string.isRequired,
        next: PropTypes.string.isRequired,
        nextPath: PropTypes.string.isRequired,
        previous: PropTypes.string.isRequired,
        previousPath: PropTypes.string.isRequired,
        addOther: PropTypes.string.isRequired
      }),
      action: PropTypes.string.isRequired,
      method: PropTypes.string.isRequired,
      type: PropTypes.string.isRequired,
      formFields: PropTypes.object.isRequired
    })
  })
}
