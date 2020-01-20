import React from 'react'
import PropTypes from 'prop-types'
import Paper from '@material-ui/core/Paper'
import { Row } from 'reactstrap'
import FormTitle from '../../../../../components/FormsLayout/FormTitle'
import FormButtons from '../../../../../components/FormsLayout/FormButtons'
import FormFields from './FormFields'
import { ShowMessage } from '../../shared/message'

const UsersWizardsStepEight = props => {
  const { formInfo, csrf_param, csrf_token, tooltip_description } = props
  const {
    title,
    subtitle,
    form: { buttons, action, method, formFields, errors = null }
  } = formInfo

  const { nextPath, previousPath } = buttons

  return (
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
                <FormFields
                  formFields={formFields}
                  tooltip_description={tooltip_description}
                />
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
  )
}

export default UsersWizardsStepEight

UsersWizardsStepEight.propTypes = {
  registered_experience: PropTypes.any,
  registered_messages: PropTypes.string,
  csrf_param: PropTypes.string,
  csrf_token: PropTypes.string,
  formInfo: PropTypes.shape({
    title: PropTypes.string.isRequired,
    subtitle: PropTypes.string,
    form: PropTypes.shape({
      errors: PropTypes.object,
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
