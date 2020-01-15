import React from 'react'
import PropTypes from 'prop-types'
import Paper from '@material-ui/core/Paper'
import { Row } from 'reactstrap'
import FormProgress from '../../../../../components/FormsLayout/FormProgress'
import FormTitle from '../../../../../components/FormsLayout/FormTitle'
import FormButtons from '../../../../../components/FormsLayout/FormButtons'
import FormFields from './FormFields'
import { ShowMessage } from '../../../../users/wizards/shared/message'

const CompaniesStepThree = ({ formInfo, csrf_param, csrf_token }) => {
  const {
    title,
    subtitle,
    offer_id,
    form: { buttons, action, method, type, formFields, errors = null }
  } = formInfo

  return (
    <div className="m-formWrapper">
      <FormProgress value={0} />
      <Row className="justify-content-center w-100 mx-0 px-20">
        <Paper className="d-flex flex-column position-relative paper-width justify-content-around align-items-center pt-60 mb-70">
          <>
            <FormTitle title={title} subtitle={subtitle} />
            <div className="w-80">
              {ShowMessage(errors, 'red')}
              <form className="forms__candidate" action={action} method="post">
                <FormFields type={type} formFields={formFields} />
                <input type="hidden" name={csrf_param} value={csrf_token} />
                <input type="hidden" name="_method" value={method} />
                <input type="hidden" name="offer[id]" value={offer_id} />
                <FormButtons buttons={buttons} />
              </form>
            </div>
          </>
        </Paper>
      </Row>
    </div>
  )
}

export default CompaniesStepThree

CompaniesStepThree.propTypes = {
  csrf_param: PropTypes.string,
  csrf_token: PropTypes.string,
  formInfo: PropTypes.shape({
    title: PropTypes.string.isRequired,
    subtitle: PropTypes.string.isRequired,
    offer_id: PropTypes.string.isRequired,
    form: PropTypes.shape({
      buttons: PropTypes.shape({
        submit: PropTypes.string.isRequired
      }),
      action: PropTypes.string.isRequired,
      method: PropTypes.string.isRequired,
      type: PropTypes.string.isRequired,
      formFields: PropTypes.object.isRequired,
      errors: PropTypes.object.isRequired
    })
  })
}
