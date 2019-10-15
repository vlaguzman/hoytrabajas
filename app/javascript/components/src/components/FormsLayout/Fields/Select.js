import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import FormControl from '@material-ui/core/FormControl'
import FormHelperText from '@material-ui/core/FormHelperText'
import MenuItem from '@material-ui/core/MenuItem'
import TextField from '@material-ui/core/TextField'
import { FlagIcon } from 'react-flag-kit'

const SelectComponent = props => {
  const {
    selectOptions,
    handleChange,
    name,
    label = null,
    inputValue,
    isRequired
  } = props

  const maskValue = val => {
    if (!val) return val
    const item = selectOptions.find(({ id }) => id === val)
    return item.description
  }

  const [maskedInput, setMaskedInput] = useState(maskValue(inputValue) || '')

  useEffect(() => {
    setMaskedInput(inputValue)
  }, [inputValue])

  const onChange = e => {
    handleChange(e, name)
  }

  const hasErrors = false

  return (
    <FormControl error={hasErrors}>
      <TextField
        key={name}
        name={name}
        onChange={onChange}
        value={maskedInput}
        label={label}
        required={isRequired}
        select
      >
        {selectOptions.map(({ id, description, code, size }) => (
          <MenuItem key={id} value={id}>
            {code && (
              <FlagIcon
                code={code.toUpperCase()}
                size={size}
                className="mr-10"
              />
            )}
            {description}
          </MenuItem>
        ))}
      </TextField>
      {hasErrors && (
        <FormHelperText>should display error message here</FormHelperText>
      )}
    </FormControl>
  )
}

export default SelectComponent

SelectComponent.propTypes = {
  inputValue: PropTypes.oneOfType([
    PropTypes.string,
    PropTypes.number,
    PropTypes.array
  ]).isRequired,
  name: PropTypes.string.isRequired,
  label: PropTypes.string,
  handleChange: PropTypes.func.isRequired,
  selectOptions: PropTypes.array.isRequired,
  isRequired: PropTypes.bool
}
