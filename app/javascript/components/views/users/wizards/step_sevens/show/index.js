import React from 'react'
import PropTypes from 'prop-types'
import Paper from '@material-ui/core/Paper'
import { Row } from 'reactstrap'
import FormTitle from '../../../../../src/components/FormsLayout/FormTitle'
import FormButtons from '../../../../../src/components/FormsLayout/FormButtons'

const UsersWizardsStepSeven = props => {
  const { formInfo, csrf_param, csrf_token } = props
  const {
    title,
    subtitle,
    form: { buttons, action, method }
  } = formInfo

  const {
    haveExperience,
    acceptButton,
    skipButton,
    skipPath,
    nextPath,
    previousPath
  } = buttons

  const redirectTo = path => {
    return e => {
      e.preventDefault()
      window.location.assign(path)
    }
  }

  return (
    <div className="m-formWrapper">
      <Row className="justify-content-center w-100 mx-0 px-20">
        <Paper className="d-flex flex-column position-relative paper-width justify-content-around align-items-center pt-60 mb-70">
          <>
            <FormTitle title={title} subtitle={subtitle} />
            <div className="w-80">
              <form className="forms__candidate" action={action} method="post">
                <input type="hidden" name={csrf_param} value={csrf_token} />
                <input type="hidden" name="_method" value={method} />

                <div className="action-buttons-container">
                  <p>{haveExperience}</p>
                  <button type="button" href={nextPath} className="accept">
                    {acceptButton}
                  </button>
                  <button
                    type="button"
                    onClick={redirectTo(skipPath)}
                    href={skipPath}
                    className="skip"
                  >
                    {skipButton}
                  </button>
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

export default UsersWizardsStepSeven

UsersWizardsStepSeven.propTypes = {
  csrf_param: PropTypes.string,
  csrf_token: PropTypes.string,
  formInfo: PropTypes.shape({
    title: PropTypes.string.isRequired,
    subtitle: PropTypes.string.isRequired,
    form: PropTypes.shape({
      buttons: PropTypes.object,
      action: PropTypes.string.isRequired,
      method: PropTypes.string.isRequired,
      type: PropTypes.string.isRequired,
      formFields: PropTypes.object.isRequired
    })
  })
}
