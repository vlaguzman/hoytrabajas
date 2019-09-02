import React, { useState } from 'react'
import PropTypes from 'prop-types'
import TextField from '@material-ui/core/TextField'
import FormControl from '@material-ui/core/FormControl'
import FormHelperText from '@material-ui/core/FormHelperText'

const StandardInput = props => {
  const {
    pro,
    inputValue,
    name,
    handleChange,
    validation,
    onFieldValidation,
    extra
  } = props

  const renderCharCount = () => {
    const shouldDisplayError = inputValue[name] && inputValue[name].length < 0

    return (
      extra.maxLength &&
      (inputValue[name] || inputValue[name] === '') && (
        <FormHelperText
          error={shouldDisplayError}
          className="stInput__charCount"
        >
          {extra.maxLength - inputValue[name].length}
        </FormHelperText>
      )
    )
  }

  const hasErrors =
    validation && validation[name] && validation[name].errorMessage

  return (
    <FormControl error={hasErrors}>
      <TextField
        {...pro}
        error={hasErrors}
        value={inputValue[name] || ``}
        onChange={handleChange}
        onBlur={() => onFieldValidation()}
      />
      {hasErrors && (
        <FormHelperText>{validation[name].errorMessage}</FormHelperText>
      )}
      {extra && extra.isLength && renderCharCount()}
    </FormControl>
  )
}

StandardInput.propTypes = {
  inputValue: PropTypes.object.isRequired,
  handleChange: PropTypes.func.isRequired,
  pro: PropTypes.object.isRequired,
  name: PropTypes.string.isRequired,
  extra: PropTypes.object,
  validation: PropTypes.object,
  onFieldValidation: PropTypes.func.isRequired
}

export default StandardInput
