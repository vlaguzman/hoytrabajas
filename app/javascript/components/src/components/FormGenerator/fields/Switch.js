import React from 'react'
import PropTypes from 'prop-types'
import MaterialSwitch from '@material-ui/core/Switch'
import FormControlLabel from '@material-ui/core/FormControlLabel'

const Switch = ({ aux, inputValue, pro, handleBoolean }) => (
  <FormControlLabel
    control={
      <MaterialSwitch
        {...pro}
        className="pr-5"
        checked={inputValue[pro.name] || false}
        onChange={handleBoolean}
        value={inputValue[pro.name]}
      />
    }
    label={aux}
  />
)

export default Switch

Switch.propTypes = {
  inputValue: PropTypes.object.isRequired,
  handleBoolean: PropTypes.func.isRequired,
  pro: PropTypes.object.isRequired,
  aux: PropTypes.oneOfType([PropTypes.string, PropTypes.object]).isRequired
}
