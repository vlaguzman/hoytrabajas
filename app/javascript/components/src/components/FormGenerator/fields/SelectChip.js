import React, { Fragment } from 'react'
import FormControl from '@material-ui/core/FormControl'
import InputLabel from '@material-ui/core/InputLabel'
import Select from '@material-ui/core/Select'
import Input from '@material-ui/core/Input'
import Chip from '@material-ui/core/Chip'
import MenuItem from '@material-ui/core/MenuItem'
import Typography from '@material-ui/core/Typography'
import FormHelperText from '@material-ui/core/FormHelperText'

const SelectChip = ({
  pro: {
    className,
    style,
    name,
    sideText,
    multiple = false,
    sideTextRight,
    label: fieldLabel,
    ...e
  },
  inputValue,
  handleChange,
  handleDeleteChip,
  errors = null,
  aux
}) => {
  const isArray = multiple
  const defaultValue = isArray ? [] : ''
  const onChange = ev => handleChange(ev, name)

  return (
    <Fragment>
      {sideText && (
        <Typography variant="body1" className="animated fadeIn d-block">
          {sideText}
        </Typography>
      )}
      <FormControl
        key={name}
        {...{ className }}
        {...{ style }}
        error={!!errors}
      >
        {fieldLabel && (
          <InputLabel htmlFor="select-multiple-chip">{fieldLabel}</InputLabel>
        )}
        <Select
          {...e}
          value={inputValue[name] || defaultValue}
          input={<Input id="select-multiple-chip" {...{ onChange }} />}
          renderValue={selected => {
            const auxItem = Array.isArray(selected)
              ? selected.map(item => aux.find(a => a.value === item))
              : aux.find(({ value }) => value === selected)
            return (
              <div className="d-flex flex-wrap">
                {Array.isArray(selected) ? (
                  auxItem.map(({ value, label }) => (
                    <Chip
                      key={value}
                      label={label}
                      onDelete={() => handleDeleteChip(value, name)}
                      className="mr-5 mt-5"
                    />
                  ))
                ) : (
                  <Chip
                    key={selected}
                    label={auxItem.label}
                    onDelete={() => handleDeleteChip(selected, name)}
                    className="mr-5 mt-5"
                  />
                )}
              </div>
            )
          }}
        >
          {aux.map(({ value, label }) => (
            <MenuItem key={value} value={value}>
              {label}
            </MenuItem>
          ))}
        </Select>
        {!!errors && <FormHelperText>{errors}</FormHelperText>}
      </FormControl>
      {sideTextRight && (
        <Typography variant="body1" className="animated fadeIn d-block">
          {sideTextRight}
        </Typography>
      )}
    </Fragment>
  )
}

export default SelectChip
