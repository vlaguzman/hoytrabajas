import React from 'react'
import PropTypes from 'prop-types'
import TextField from '@material-ui/core/TextField'
import FormControl from '@material-ui/core/FormControl'
import FormHelperText from '@material-ui/core/FormHelperText'

const StandardInput = props => {
  const {
    inputValue,
    name,
    label,
    handleChange,
    extra,
    beforeLabel = null,
    placeholder = null
  } = props

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

  const textAreaProperties = {
    multiline:true,
    rows: 3,
    rowsMax: 3
  }

  const addTextArea =() => {
    if(isTextArea) return textAreaProperties
  }

  return (
    <FormControl error={hasErrors}>
      <TextField
        name={name}
        label={label}
        error={hasErrors}
        value={inputValue || ``}
        onChange={e => handleChange(e, name)}
        placeholder={placeholder}
      />
      {hasErrors && (
        <FormHelperText>should display validation here</FormHelperText>
      )}
      {extra && extra.isLength && renderCharCount()}
    </FormControl>
  )
}

StandardInput.propTypes = {
  isTextArea: PropTypes.bool,
  inputValue: PropTypes.string.isRequired,
  handleChange: PropTypes.func.isRequired,
  name: PropTypes.string.isRequired,
  label: PropTypes.string,
  beforeLabel: PropTypes.string,
  placeholder: PropTypes.string,
  extra: PropTypes.object
}

export default StandardInput
