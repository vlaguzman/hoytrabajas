import React, { useState } from 'react'
import Autocomplete, {
  createFilterOptions
} from '@material-ui/lab/Autocomplete'
import TextField from '@material-ui/core/TextField'
import { PropTypes } from 'prop-types'

const filterOptions = createFilterOptions({
  trim: true
})

// Internal Functions

const SelectFindOrCreate = ({
  label,
  name,
  options = [],
  text_key = 'description',
  input_value,
  no_options_text,
  isMultiple = false
}) => {
  const [interValue, setInterValue] = useState(input_value)
  const [updateOptions, setUpdateOptions] = useState(options)

  const handleValueNoPresent = (e, value, r) => {
    if (value.split('').includes(',')) {
      setUpdateOptions([
        ...updateOptions,
        { [text_key]: value.split(',').join('') }
      ])
      setInterValue(
        isMultiple
          ? [...interValue, value.split(',').join('')]
          : value.split(',').join('')
      )
    }
  }

  return (
    <>
      <Autocomplete
        freeSolo
        multiple={isMultiple}
        includeInputInList
        noOptionsText={no_options_text}
        options={updateOptions.map(option => option[text_key])}
        filterOptions={filterOptions}
        value={interValue}
        onChange={(e, value) => {
          setInterValue(value)
        }}
        onInputChange={handleValueNoPresent}
        renderInput={params => (
          <TextField {...params} label={label} margin="normal" fullWidth />
        )}
      />
      <input name={name} type="hidden" value={interValue} />
    </>
  )
}

SelectFindOrCreate.propTypes = {
  label: PropTypes.string,
  name: PropTypes.string.isRequired,
  options: PropTypes.array.isRequired,
  text_key: PropTypes.string,
  input_value: PropTypes.any,
  no_options_text: PropTypes.string,
  isMultiple: PropTypes.bool
}

export default SelectFindOrCreate
