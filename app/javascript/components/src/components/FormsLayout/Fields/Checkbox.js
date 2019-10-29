import React from 'react'
import PropTypes from 'prop-types'
import MaterialCheckbox from '@material-ui/core/Checkbox'
import FormControlLabel from '@material-ui/core/FormControlLabel'
import FormLabel from '../FormLabel'

const Checkbox = props => {
  const {
    inputValue,
    name,
    label,
    description,
    isRequired,
    handleBoolean
  } = props

  const onChange = e => handleBoolean(e, name)

  return (
    <>
      <input type="hidden" name={name} value={inputValue} />
      {label && (
        <FormLabel required={isRequired} id="range-slider" gutterBottom>
          {label}
        </FormLabel>
      )}
      <FormControlLabel
        className="p-0 mx-0 mb-0"
        control={
          <MaterialCheckbox
            name=""
            className="pr-5"
            value={inputValue}
            checked={inputValue}
            onChange={onChange}
            required={isRequired}
          />
        }
        label={description}
      />
    </>
  )
}

export default Checkbox

Checkbox.propTypes = {
  inputValue: PropTypes.bool.isRequired,
  name: PropTypes.string.isRequired,
  label: PropTypes.string,
  description: PropTypes.string.isRequired,
  handleBoolean: PropTypes.func.isRequired,
  isRequired: PropTypes.bool
}
