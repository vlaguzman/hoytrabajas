import React from 'react'
import TextField from '@material-ui/core/TextField'
import PropTypes from 'prop-types'
import Autocomplete from '@material-ui/lab/Autocomplete'

export default function FieldAutocomplete({
  value,
  cities,
  filterCity,
  setValue
}) {
  return (
    <Autocomplete
      id="combo-box-demo"
      inputValue={value}
      onInputChange={(event, value) => {
        setValue(value)
        filterCity(value)
      }}
      options={cities['cities']}
      getOptionLabel={option => option.label}
      renderInput={params => <TextField {...params} label="Ciudad" fullWidth />}
    />
  )
}

FieldAutocomplete.propTypes = {
  value: PropTypes.object.isRequired,
  cities: PropTypes.object.isRequired,
  filterCity: PropTypes.func.isRequired,
  setValue: PropTypes.func.isRequired
}
