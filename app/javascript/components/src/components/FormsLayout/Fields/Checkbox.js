import React from 'react'
import PropTypes from 'prop-types'
import MaterialCheckbox from '@material-ui/core/Checkbox'
import FormControlLabel from '@material-ui/core/FormControlLabel'
import Tooltip from '@material-ui/core/Tooltip'
import FormLabel from '../FormLabel'

const Checkbox = props => {
  const {
    inputValue,
    name,
    label,
    description,
    tooltip_description,
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
      <div>
        <Tooltip title={tooltip_description}>
          <FormControlLabel
            className="p-0 mx-0 mb-0"
            control={
              <MaterialCheckbox
                className="pr-5"
                value={inputValue}
                checked={inputValue}
                onChange={onChange}
                required={isRequired}
              />
            }
            label={description}
          />
        </Tooltip>
      </div>
    </>
  )
}

export default Checkbox

Checkbox.propTypes = {
  inputValue: PropTypes.bool.isRequired,
  name: PropTypes.string.isRequired,
  label: PropTypes.string,
  description: PropTypes.string.isRequired,
  tooltip_description: PropTypes.string.isRequired,
  handleBoolean: PropTypes.func.isRequired,
  isRequired: PropTypes.bool
}
