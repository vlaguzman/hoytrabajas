import React from 'react'
import PropTypes from 'prop-types'
import FormControl from '@material-ui/core/FormControl'
import InputLabel from '@material-ui/core/InputLabel'
import Select from '@material-ui/core/Select'
import Input from '@material-ui/core/Input'
import Chip from '@material-ui/core/Chip'
import MenuItem from '@material-ui/core/MenuItem'
import Typography from '@material-ui/core/Typography'
import FormHelperText from '@material-ui/core/FormHelperText'

const SelectChip = props => {
  const {
    inputValue,
    inputName,
    handleChange,
    handleDeleteChip,
    name,
    label,
    isMultiple,
    selectOptions,
    sideText,
    sideTextRight
  } = props

  const defaultValue = isMultiple ? [] : ''
  const onChange = ev => handleChange(ev, name)
  const hasErrors = false

  return (
    <>
      {sideText && (
        <Typography variant="body1" className="animated fadeIn d-block">
          {sideText}
        </Typography>
      )}
      <FormControl key={name} error={hasErrors}>
        {label && (
          <InputLabel htmlFor="select-multiple-chip">{label}</InputLabel>
        )}
        <Select
          value={inputValue || defaultValue}
          input={
            <Input
              id="select-multiple-chip"
              name={inputName}
              onChange={onChange}
            />
          }
          renderValue={selected => {
            const selectValues = Array.isArray(selected)
              ? selected.map(item => selectOptions.find(a => a.id === item))
              : selectOptions.find(({ id }) => id === selected)
            return (
              <div className="d-flex flex-wrap">
                {Array.isArray(selected) ? (
                  selectValues.map(({ id, description }) => (
                    <Chip
                      key={id}
                      label={description}
                      onDelete={() => handleDeleteChip(id, name, isMultiple)}
                      className="mr-5 mt-5"
                    />
                  ))
                ) : (
                  <Chip
                    key={selected}
                    label={selectValues.description}
                    onDelete={() =>
                      handleDeleteChip(selected, name, isMultiple)
                    }
                    className="mr-5 mt-5"
                  />
                )}
              </div>
            )
          }}
        >
          {selectOptions.map(({ id, description }) => (
            <MenuItem key={id} value={id}>
              {description}
            </MenuItem>
          ))}
        </Select>
        {hasErrors && (
          <FormHelperText>should display error message here</FormHelperText>
        )}
      </FormControl>
      {sideTextRight && (
        <Typography variant="body1" className="animated fadeIn d-block">
          {sideTextRight}
        </Typography>
      )}
    </>
  )
}

export default SelectChip

SelectChip.propTypes = {
  inputValue: PropTypes.oneOfType([
    PropTypes.string,
    PropTypes.number,
    PropTypes.array
  ]).isRequired,
  inputName: PropTypes.string.isRequired,
  handleChange: PropTypes.func.isRequired,
  handleDeleteChip: PropTypes.func.isRequired,
  name: PropTypes.string.isRequired,
  label: PropTypes.string,
  isMultiple: PropTypes.bool,
  selectOptions: PropTypes.arrayOf(PropTypes.object),
  sideText: PropTypes.string,
  sideTextRight: PropTypes.string
}
