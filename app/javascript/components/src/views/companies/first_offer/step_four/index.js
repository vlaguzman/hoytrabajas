import React from 'react'
import PropTypes from 'prop-types'
import Paper from '@material-ui/core/Paper'
import { Row } from 'reactstrap'
import FormProgress from '../../../../components/FormsLayout/FormProgress'
import FormTitle from '../../../../components/FormsLayout/FormTitle'
import FormButtons from '../../../../components/FormsLayout/FormButtons'
import FormFields from './FormFields'

const CompaniesStepFour = ({ formInfo }) => {
  const {
    title,
    subtitle,
    form: { buttons, nextPath, prevPath, action, method, type, formFields }
  } = formInfo

  const handleSubmit = e => {
    e.preventDefault()
  }

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
                method={method}
                onSubmit={handleSubmit}
              >
                <FormFields type={type} formFields={formFields} />
                <FormButtons
                  nextPath={nextPath}
                  prevPath={prevPath}
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

export default CompaniesStepFour

CompaniesStepFour.propTypes = {
  formInfo: PropTypes.shape({
    title: PropTypes.string.isRequired,
    subtitle: PropTypes.string.isRequired,
    form: PropTypes.shape({
      buttons: PropTypes.shape({
        submit: PropTypes.string.isRequired,
        prev: PropTypes.string.isRequired,
        next: PropTypes.string.isRequired
      }),
      nextPath: PropTypes.string.isRequired,
      prevPath: PropTypes.string.isRequired,
      action: PropTypes.string.isRequired,
      method: PropTypes.string.isRequired,
      type: PropTypes.string.isRequired,
      formFields: PropTypes.object.isRequired
    })
  })
}
