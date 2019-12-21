import React from 'react'
import Autocomplete, {
  createFilterOptions
} from '@material-ui/lab/Autocomplete'
import TextField from '@material-ui/core/TextField'
import { PropTypes } from 'prop-types'

const filterOptions = createFilterOptions({
  trim: true
})

const SelectFindOrCreate = ({
  label,
  name,
  options = [],
  text_key = 'description',
  input_value,
  no_options_text
}) => (
  <>
    <Autocomplete
      freeSolo
      includeInputInList
      noOptionsText={no_options_text}
      options={options.map(option => option[text_key])}
      filterOptions={filterOptions}
      defaultValue={input_value}
      renderInput={params => (
        <TextField
          {...params}
          label={label}
          name={name}
          margin="normal"
          fullWidth
        />
      )}
    />
  </>
)

SelectFindOrCreate.propTypes = {
  label: PropTypes.string,
  name: PropTypes.string.isRequired,
  options: PropTypes.array.isRequired,
  text_key: PropTypes.string,
  input_value: PropTypes.string,
  no_options_text: PropTypes.string
}

export default SelectFindOrCreate
