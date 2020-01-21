import React, { useState } from 'react'
import Autocomplete, {
  createFilterOptions
} from '@material-ui/lab/Autocomplete'
import TextField from '@material-ui/core/TextField'
import { PropTypes } from 'prop-types'
import Tooltip from '@material-ui/core/Tooltip'

const filterOptions = createFilterOptions({
  trim: true
})

const SelectFindOrCreate = ({
  id,
  label,
  name,
  options = [],
  text_key = 'description',
  input_value,
  no_options_text,
  isMultiple = false,
  tooltip_description,
  handleOnChange = null
}) => {

  const [interValue, setInterValue] = useState(input_value)
  const [updateOptions, setUpdateOptions] = useState(options)

  const handleValueNoPresent = value => {
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

  const handleOnInputChange = (e, value, r) => {
    handleValueNoPresent(value)
    if (handleOnChange) handleOnChange({ target: { value: null } }, name, value)
  }

  return (
    <>
      <Tooltip title={tooltip_description} arrow>
        <Autocomplete
          freeSolo
          id={id}
          name={id}
          value={interValue}
          multiple={isMultiple}
          includeInputInList
          noOptionsText={no_options_text}
          options={updateOptions.map(option => option[text_key])}
          filterOptions={filterOptions}
          onChange={(e, value) => {
            setInterValue(value)
          }}
          onInputChange={handleOnInputChange}
          renderInput={params => (
            <TextField
              {...params}
              label={label}
              name={!isMultiple && name}
              margin="normal"
              fullWidth
            />
          )}
        />
      </Tooltip>
      {isMultiple && (
        <input name={name} type="hidden" value={interValue || ''} />
      )}
    </>
  )
}

SelectFindOrCreate.propTypes = {
  handleOnChange: PropTypes.func,
  tooltip_description: PropTypes.string,
  id: PropTypes.string,
  label: PropTypes.string,
  name: PropTypes.string.isRequired,
  options: PropTypes.array.isRequired,
  text_key: PropTypes.string,
  input_value: PropTypes.any,
  no_options_text: PropTypes.string,
  isMultiple: PropTypes.bool
}

export default SelectFindOrCreate
