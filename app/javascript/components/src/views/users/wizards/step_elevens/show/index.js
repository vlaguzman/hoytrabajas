import React from 'react'
import PropTypes from 'prop-types'
import Paper from '@material-ui/core/Paper'
import { Row } from 'reactstrap'
// import FormProgress from '../../../../../components/FormsLayout/FormProgress'
import FormTitle from '../../../../../components/FormsLayout/FormTitle'

const redirectTo = path => {
  return e => {
    e.preventDefault()
    window.location.assign(path)
  }
}

const UsersWizardsStepEleven = props => {
  const { formInfo, csrf_param, csrf_token } = props
  const {
    title,
    subtitle,
    form: { buttons, action, method }
  } = formInfo

  const { nextPath, next, goHome, goHomePath } = buttons

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
                  <button
                    type="button"
                    onClick={redirectTo(nextPath)}
                    className="accept next"
                  >
                    {next}
                  </button>
                  <a className="home_link" href={goHomePath}>
                    {goHome}
                  </a>
                </div>
              </form>
            </div>
          </>
        </Paper>
      </Row>
    </div>
  )
}

export default UsersWizardsStepEleven

UsersWizardsStepEleven.propTypes = {
  csrf_param: PropTypes.string,
  csrf_token: PropTypes.string,
  formInfo: PropTypes.shape({
    title: PropTypes.string.isRequired,
    subtitle: PropTypes.string,
    form: PropTypes.shape({
      buttons: PropTypes.shape({
        nextPath: PropTypes.string,
        next: PropTypes.string,
        goHome: PropTypes.string,
        goHomePath: PropTypes.string
      }),
      action: PropTypes.string.isRequired,
      method: PropTypes.string.isRequired,
      type: PropTypes.string.isRequired,
      formFields: PropTypes.object.isRequired
    })
  })
}
