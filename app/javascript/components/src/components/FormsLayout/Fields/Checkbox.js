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
      {label && (
        <FormLabel required={isRequired} id="range-slider" gutterBottom>
          {label}
        </FormLabel>
      )}
      <FormControlLabel
        className="p-0 mx-0 mb-0"
        control={
          <MaterialCheckbox
            name={name}
            className="pr-5"
            value={inputValue}
            checked={inputValue || false}
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
  label: PropTypes.string.isRequired,
  description: PropTypes.string.isRequired,
  handleBoolean: PropTypes.func.isRequired,
  isRequired: PropTypes.bool
}
