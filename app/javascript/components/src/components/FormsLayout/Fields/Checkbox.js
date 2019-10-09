import React from 'react'
import PropTypes from 'prop-types'
import MaterialCheckbox from '@material-ui/core/Checkbox'
import FormControlLabel from '@material-ui/core/FormControlLabel'

const Checkbox = ({ aux, inputValue, pro, handleBoolean }) => (
  <FormControlLabel
    className="p-0 mx-0 mb-0"
    value={aux}
    key={aux}
    control={
      <MaterialCheckbox
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

export default Checkbox

Checkbox.propTypes = {
  inputValue: PropTypes.object.isRequired,
  handleBoolean: PropTypes.func.isRequired,
  pro: PropTypes.object.isRequired,
  aux: PropTypes.oneOfType([PropTypes.string, PropTypes.object]).isRequired
}
