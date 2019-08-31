import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import FormControl from '@material-ui/core/FormControl'
import FormHelperText from '@material-ui/core/FormHelperText'
import MenuItem from '@material-ui/core/MenuItem'
import TextField from '@material-ui/core/TextField'
import { FlagIcon } from 'react-flag-kit'

const SelectComponent = props => {
  const { pro, aux, handleChange, inputValue, errors } = props
  const { name } = pro

  const maskValue = val => {
    if (!val) return val
    const item = aux.find(({ value }) => value === val)
    return item.label
  }
  const [maskedInput, setMaskedInput] = useState(
    maskValue(inputValue[name]) || ''
  )

  useEffect(() => {
    setMaskedInput(inputValue[name])
  }, [inputValue])

  const onChange = e => {
    handleChange(e, name)
  }

  return (
    <FormControl error={!!errors}>
      <TextField
        {...pro}
        {...{ onChange }}
        key={name}
        error={!!errors}
        value={maskedInput}
      >
        {aux.map(({ value, label, code, size }) => (
          <MenuItem key={value} {...{ value }}>
            {code && (
              <FlagIcon
                {...{ code: code.toUpperCase() }}
                {...{ size }}
                className="mr-10"
              />
            )}
            {label}
          </MenuItem>
        ))}
      </TextField>
      {!!errors && <FormHelperText>{errors}</FormHelperText>}
    </FormControl>
  )
}

export default SelectComponent

SelectComponent.propTypes = {
  pro: PropTypes.object.isRequired,
  aux: PropTypes.any.isRequired,
  inputValue: PropTypes.object.isRequired,
  handleChange: PropTypes.func.isRequired,
  errors: PropTypes.oneOfType([PropTypes.object, PropTypes.bool])
}
