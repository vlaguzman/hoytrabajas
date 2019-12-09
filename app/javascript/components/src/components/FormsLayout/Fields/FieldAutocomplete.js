import React from 'react';
import TextField from '@material-ui/core/TextField';
import Autocomplete from '@material-ui/lab/Autocomplete';

export default function FieldAutocomplete({ value, cities, filterCity, setValue }) {
  return (
    <Autocomplete
      id="combo-box-demo"
      inputValue={value}
      onInputChange={ (event, value)=> {setValue(value); filterCity(value)} }
      options={cities["cities"]}
      getOptionLabel={option => option.label}
      renderInput={params => (
        <TextField {...params} label="Ciudad" fullWidth />
      )}
    />
  );
}
