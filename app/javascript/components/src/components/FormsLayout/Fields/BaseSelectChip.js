import React, { useState } from 'react'
import PropTypes from 'prop-types'
import FormControl from '@material-ui/core/FormControl'
import InputLabel from '@material-ui/core/InputLabel'
import Select from '@material-ui/core/Select'
import Input from '@material-ui/core/Input'
import Chip from '@material-ui/core/Chip'
import MenuItem from '@material-ui/core/MenuItem'
import FormHelperText from '@material-ui/core/FormHelperText'
import { baseHandleDeleteChip } from '../handleFunctions'

const chipBuilder = ({key, label, handleOnDelete}) => {


  return (
    <Chip
      key={key}
      label={label}
      onClick={e => e.stopPropagation()}
      onDelete={() => {
        handleOnDelete(key)
      }}
      className="mr-5 mt-5"
    />
  )
}


const BaseSelectChip = props => {
  const {
    inputValue,
    name,
    label,
    isMultiple = false,
    isRequired = false,
    isDisabled = false,
    errors,
    handleGetSelectValue = null,
    selectOptions
  } = props

  const defaultValue = isMultiple ? [] : ''
  const [internalValue, setInternalValue] = useState(inputValue || defaultValue)

  const [openState, setOpenState] = useState(false)

  const toggleOpenState = e => {
    e.stopPropagation()
    setOpenState(!openState)
  }

  const onChange = e => {
    e.stopPropagation()

    if (handleGetSelectValue) handleGetSelectValue(e.target.value)

    setInternalValue(e.target.value)

    setOpenState(false)
  }

  const handleOnDelete = id => {
    baseHandleDeleteChip(
      id,
      internalValue,
      setInternalValue,
      isMultiple,
      handleGetSelectValue
    )
  }

  return (
    <>
      <FormControl key={name} error={errors} disabled={isDisabled}>
        {label && (
          <InputLabel required={isRequired} htmlFor="select-multiple-chip">
            {label}
          </InputLabel>
        )}
        <Select
          value={internalValue}
          open={openState}
          onClick={toggleOpenState}
          input={
            <Input
              id="select-multiple-chip"
              name={name}
              onChange={onChange}
              required={isRequired}
            />
          }
          renderValue={selected => {
            console.log("selected" + selected)
            console.log("selectValues" + name)
            const selectValues = Array.isArray(selected)
              ? selected.map(item => selectOptions.find(a => a.id === item))
              : selectOptions.find(({ id }) => id === selected)
            console.log(selectValues)

            return (
              <div className="d-flex flex-wrap">
                {Array.isArray(selected) ? (
                  selectValues.map(({ id, description }) => (
                    <Chip
                      key={id}
                      label={description}
                      onClick={e => e.stopPropagation()}
                      onDelete={() => {
                        handleOnDelete(id)
                      }}
                      className="mr-5 mt-5"
                    />
                  ))
                ) : (
                  <Chip
                    key={selected}
                    label={ selectValues && selectValues.description}
                    onDelete={() => {
                      handleOnDelete(selected || '')
                    }}
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
        {errors && <FormHelperText>{errors}</FormHelperText>}
      </FormControl>
    </>
  )
}

export default BaseSelectChip

BaseSelectChip.propTypes = {
  inputValue: PropTypes.oneOfType([
    PropTypes.string,
    PropTypes.number,
    PropTypes.array
  ]).isRequired,
  name: PropTypes.string.isRequired,
  errors: PropTypes.string,
  label: PropTypes.string,
  isMultiple: PropTypes.bool,
  isRequired: PropTypes.bool,
  isDisabled: PropTypes.bool,
  handleGetSelectValue: PropTypes.func,
  selectOptions: PropTypes.arrayOf(PropTypes.object).isRequired
}
