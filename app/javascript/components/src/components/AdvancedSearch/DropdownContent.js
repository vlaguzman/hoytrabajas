import React from 'react'
import PropTypes from 'prop-types'
import Checkbox from '@material-ui/core/Checkbox'
import FormControlLabel from '@material-ui/core/FormControlLabel'
import ClickAwayListener from '@material-ui/core/ClickAwayListener'

const AdvancedSearchDropdown = ({
  field,
  currentValues,
  setFormValues,
  handleClose,
  disableClickAway = false
}) => {
  const { name, values: options, multiple } = field

  const handleCheck = event => {
    const { checked, value } = event.target

    if (multiple) {
      setFormValues(prevState => ({
        ...prevState,
        [name]: { ...prevState[name], [value]: checked }
      }))
    } else {
      setFormValues(prevState => ({
        ...prevState,
        [name]: { [value]: checked }
      }))
    }
  }

  const disable = disableClickAway ? false : 'onClick'

  return options && options.length > 0 ? (
    <ClickAwayListener onClickAway={handleClose} mouseEvent={disable}>
      <div className="advancedSearch__dropdownWrapper">
        {options.map(option => (
          <div key={option.id} className="advancedSearch__checkboxItem">
            <FormControlLabel
              className="advancedSearch__checkboxWrapper"
              control={
                <>
                  <Checkbox
                    className="advancedSearch__checkbox"
                    checked={currentValues[option.id] || false}
                    checkedIcon={
                      <span className="advancedSearch__checkboxIcon advancedSearch__checkedIcon" />
                    }
                    icon={<span className="advancedSearch__checkboxIcon" />}
                    onChange={handleCheck}
                    value={option.id}
                    disableRipple
                    color="default"
                  />
                </>
              }
              label={option.description}
              name={`${name}[${option.id}]`}
            />
          </div>
        ))}
      </div>
    </ClickAwayListener>
  ) : null
}

AdvancedSearchDropdown.propTypes = {
  field: PropTypes.shape({
    name: PropTypes.string.isRequired,
    values: PropTypes.object.isRequired,
    multiple: PropTypes.bool
  }).isRequired,
  currentValues: PropTypes.object,
  setFormValues: PropTypes.func.isRequired,
  handleClose: PropTypes.func.isRequired,
  disableClickAway: PropTypes.bool
}

export default AdvancedSearchDropdown
