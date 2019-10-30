import React from 'react'
import PropTypes from 'prop-types'
import Paper from '@material-ui/core/Paper'
import { Row } from 'reactstrap'
import FormProgress from '../../../../../components/FormsLayout/FormProgress'
import FormTitle from '../../../../../components/FormsLayout/FormTitle'
import FormButtons from '../../../../../components/FormsLayout/FormButtons'
import FormFields from './FormFields'

const showMesssage = (messageList, color='black')=>{
  if(messageList){
    return messageList
    .map( messages => messages
      .map( (message) => ( <span style={{color: color}} key={message}>* {message} <br/></span> ) ) )
  }
}

const UsersWizardsStepTen = props => {
  const { formInfo, csrf_param, csrf_token, registered_acknowledgments, registered_acknowledgments_message } = props
  const {
    title,
    subtitle,
    form: { buttons, action, method, formFields, errors }
  } = formInfo

  const { nextPath, previousPath, addOther } = buttons

  return (
    <div className="main-wrapper">
      <FormProgress value={0} />
      <Row className="mt-10 mb-70 justify-content-center w-100 pb-50 mx-0 px-20">
        <Paper className="d-flex flex-column position-relative paper-width justify-content-around align-items-center pt-60 mb-70">
          <>
            <FormTitle title={title} subtitle={subtitle} />
            <div className="w-80">
              <form className="forms__candidate" action={action} method="post" encType="multipart/form-data">
                <p>{registered_acknowledgments_message}</p>
                {showMesssage(registered_acknowledgments)}
                {showMesssage(errors, 'red')}
                <input type="hidden" name={csrf_param} value={csrf_token} />
                <input type="hidden" name="_method" value={method} />
                <FormFields formFields={formFields} />
                <div className="action-buttons-container">
                  <button name="add_other_acknowledgment" type='submit' value="1" className="accept">{addOther}</button>
                </div>
                <FormButtons
                  nextPath={nextPath}
                  prevPath={previousPath}
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
