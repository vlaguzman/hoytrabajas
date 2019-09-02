import React from 'react'
import { Row } from 'reactstrap'
import { connect } from 'react-redux'
import withMobileDialog from '@material-ui/core/withMobileDialog'
import MaterialButton from '@material-ui/core/Button'
import { AddCircleOutline } from '@material-ui/icons'
import { makeGetMultiForm } from 'Src/selectors/forms'
import dialogState from '../hooks/dialogState'
import FormDialog from './FormDialog'

const ResponsiveDialog = props => {
  const {
    formName,
    formSection,
    addSingleForm,
    singleFormID,
    currentMultiForm,
    pro: {
      buttonClass,
      buttonSize,
      className,
      color,
      contained,
      fullScreen,
      icon,
      sizes,
      style,
      text,
      ...e
    }
  } = props

  const { value: state, handleClickOpen, handleClose } = dialogState({
    open: false
  })
  return (
    <div>
      <Row className={className}>
        <MaterialButton
          {...{ color, style } }
          onClick={handleClickOpen}
          variant={!contained ? 'outlined' : 'contained'}
          size={buttonSize}
          className={`text-wrap text-${
            !contained ? 'primary' : 'white'
          } ${buttonClass}`}
        >
          {text}
          {icon && <AddCircleOutline className="d-inline-block ml-10" />}
        </MaterialButton>
      </Row>
      <FormDialog
        {...{
          open: state.open,
          formSection,
          currentMultiForm,
          handleClose,
          addSingleForm
        }}
      />
    </div>
  )
}

const makeMapStateToProps = () => {
  const getMultiForm = makeGetMultiForm()
  const mapStateToProps = (state, props) => ({
    currentMultiForm: getMultiForm(state, props)
  })
  return mapStateToProps
}

export default connect(makeMapStateToProps)(ResponsiveDialog)

// export default withMobileDialog()(ResponsiveDialog)
