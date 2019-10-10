import React from 'react'
import PropTypes from 'prop-types'
import TextField from '@material-ui/core/TextField'
import FormControl from '@material-ui/core/FormControl'
import FormHelperText from '@material-ui/core/FormHelperText'

const StandardInput = React.memo(props => {
  const { inputValue, name, label, inputName, handleChange, extra } = props

  const renderCharCount = () => {
    const shouldDisplayError = inputValue && inputValue.length < 0

    return (
      extra.maxLength &&
      (inputValue || inputValue === '') && (
        <FormHelperText
          error={shouldDisplayError}
          className="standard_input__charCount"
        >
          {extra.maxLength - inputValue.length}
        </FormHelperText>
      )
    )
  }

  // TODO: add validation
  const hasErrors = false

  return (
    <FormControl error={hasErrors}>
      <TextField
        name={inputName}
        label={label}
        error={hasErrors}
        value={inputValue || ``}
        onChange={e => handleChange(e, name)}
        // onBlur={() => onFieldValidation()}
      />
      {/* {hasErrors && (
        <FormHelperText>{validation.errorMessage}</FormHelperText>
      )} */}
      {extra && extra.isLength && renderCharCount()}
    </FormControl>
  )
})

StandardInput.propTypes = {
  inputValue: PropTypes.string.isRequired,
  inputName: PropTypes.string.isRequired,
  handleChange: PropTypes.func.isRequired,
  name: PropTypes.string.isRequired,
  label: PropTypes.string,
  extra: PropTypes.object
}

export default StandardInput
