import React, { useState, useEffect, useMemo, useCallback } from 'react'
import PropTypes from 'prop-types'
import Downshift from 'downshift'
import deburr from 'lodash/deburr'
import { makeStyles } from '@material-ui/styles'
import TextField from '@material-ui/core/TextField'
import Paper from '@material-ui/core/Paper'
import MenuItem from '@material-ui/core/MenuItem'
import Chip from '@material-ui/core/Chip'
import { useDebouncedCallback } from 'use-debounce'
import FormControl from '@material-ui/core/FormControl'
import FormHelperText from '@material-ui/core/FormHelperText'
import useWhyDidYouUpdate from '../../../hooks/useWhyDidYouUpdate'
import { compareArrays } from 'Helpers'

const MAX_VALUES = 3
const suggestions = [
  { value: 1, label: 'Afghanistan' },
  { value: 2, label: 'Aland Islands' },
  { value: 3, label: 'Albania' },
  { value: 4, label: 'Algeria' },
  { value: 5, label: 'American Samoa' },
  { value: 6, label: 'Andorra' },
  { value: 7, label: 'Angola' },
  { value: 8, label: 'Anguilla' },
  { value: 9, label: 'Antarctica' },
  { value: 10, label: 'Antigua and Barbuda' },
  { value: 11, label: 'Argentina' },
  { value: 12, label: 'Armenia' },
  { value: 13, label: 'Aruba' },
  { value: 14, label: 'Australia' },
  { value: 15, label: 'Austria' },
  { value: 15, label: 'Azerbaijan' },
  { value: 15, label: 'Bahamas' },
  { value: 19, label: 'Bahrain' },
  { value: 20, label: 'Bangladesh' },
  { value: 21, label: 'Barbados' },
  { value: 22, label: 'Belarus' },
  { value: 23, label: 'Belgium' },
  { value: 24, label: 'Belize' },
  { value: 25, label: 'Benin' },
  { value: 26, label: 'Bermuda' },
  { value: 27, label: 'Bhutan' },
  { value: 28, label: 'Bolivia, Plurinational State of' },
  { value: 29, label: 'Bonaire, Sint Eustatius and Saba' },
  { value: 30, label: 'Bosnia and Herzegovina' },
  { value: 31, label: 'Botswana' },
  { value: 32, label: 'Bouvet Island' },
  { value: 33, label: 'Brazil' },
  { value: 34, label: 'British Indian Ocean Territory' },
  { value: 35, label: 'Brunei Darussalam' }
]

const newSkillSuggestion = { value: 9999, label: 'Añadir nueva habilidad' }

const useStyles = makeStyles({
  root: {
    flexGrow: 1,
    height: 250
  },
  container: {
    flexGrow: 1,
    position: 'relative'
  },
  paper: {
    position: 'absolute',
    zIndex: 1,
    marginTop: '5px',
    left: 0,
    right: 0
  },
  chip: {
    margin: `5px 10px`
  },
  inputRoot: {
    flexWrap: 'wrap'
  },
  inputInput: {
    width: 'auto',
    flexGrow: 1
  },
  divider: {
    height: '10px'
  }
})

const renderInput = inputProps => {
  const { InputProps, ref, classes, errors, ...other } = inputProps
  return (
    <TextField
      error={!!errors}
      InputProps={{
        inputRef: ref,
        classes: {
          root: classes.inputRoot,
          input: classes.inputInput
        },
        ...InputProps
      }}
      {...other}
    />
  )
}

renderInput.propTypes = {
  InputProps: PropTypes.object
}

function renderSuggestion(suggestionProps) {
  const {
    suggestion,
    index,
    itemProps,
    highlightedIndex,
    selectedItem
  } = suggestionProps
  const isHighlighted = highlightedIndex === index
  const isSelected = (selectedItem || '').indexOf(suggestion.label) > -1
  return (
    <MenuItem
      {...itemProps}
      key={suggestion.label}
      value={suggestion.value}
      selected={isHighlighted}
      component="div"
      style={{
        fontWeight: isSelected ? 500 : 400
      }}
    >
      {suggestion.label}
    </MenuItem>
  )
}

renderSuggestion.propTypes = {
  highlightedIndex: PropTypes.oneOfType([
    PropTypes.oneOf([null]),
    PropTypes.number
  ]).isRequired,
  index: PropTypes.number.isRequired,
  itemProps: PropTypes.object.isRequired,
  selectedItem: PropTypes.string.isRequired,
  suggestion: PropTypes.shape({
    label: PropTypes.string.isRequired
  }).isRequired
}

function getSuggestions(value, { showEmpty = false } = {}) {
  const inputValue = deburr(value.trim()).toLowerCase()
  const inputLength = inputValue.length
  let count = 0

  const results = suggestions.filter(suggestion => {
    const keep =
      count < 5 &&
      suggestion.label.slice(0, inputLength).toLowerCase() === inputValue

    if (keep) {
      count += 1
    }

    return keep
  })

  return inputLength === 0 && !showEmpty
    ? []
    : (results.length > 0 && results) || [newSkillSuggestion]
}

const TextChip = props => {
  const {
    formSection,
    rowValue = null,
    inputValue: parentInputValue,
    setValue,
    setRowValue,
    pro,
    name,
    extra
  } = props
  const { subFields = null } = extra
  const { className = null, label = null } = pro

  const defaultRowValue = rowValue && rowValue[name]
  const defaultValue = parentInputValue && parentInputValue[name]

  const [inputValue, setInputValue] = useState('')
  const [selectedItem, setSelectedItem] = useState(
    defaultRowValue || defaultValue || []
  )
  const [errors, setErrors] = useState(false)
  const classes = useStyles()

  useWhyDidYouUpdate('textchip', props)

  useEffect(() => {
    if (
      rowValue &&
      rowValue[name] &&
      !compareArrays(rowValue[name], selectedItem)
    ) {
      setSelectedItem(rowValue[name])
    } else if (
      parentInputValue &&
      parentInputValue[name] &&
      !compareArrays(parentInputValue[name], selectedItem)
    ) {
      setSelectedItem(parentInputValue[name])
    }
  }, [formSection, rowValue, parentInputValue])

  const [updateRowValue] = useDebouncedCallback(() => {
    console.log('updateRowValue')
    console.log(selectedItem)
    setRowValue(prevState => ({
      ...prevState,
      [name]: [...selectedItem]
    }))
  }, 750)

  useEffect(() => {
    if (rowValue) {
      updateRowValue()
    } else if (parentInputValue) {
      setValue(prevState => ({
        ...prevState,
        [name]: [...selectedItem]
      }))
    }
  }, [selectedItem])

  const handleKeyDown = event => {
    if (event.key === 'Enter') event.preventDefault()
    if (
      selectedItem.length &&
      !inputValue.length &&
      event.key === 'Backspace'
    ) {
      setSelectedItem(selectedItem.slice(0, selectedItem.length - 1))
    }
  }

  const [cleanErrors] = useDebouncedCallback(() => setErrors(false), 3000)

  const handleInputChange = event => {
    if (selectedItem.length >= MAX_VALUES) {
      setInputValue('')
      setErrors(`El máximo de habilidades permitidas es de ${MAX_VALUES}`)
      cleanErrors()
      return
    }
    setInputValue(event.target.value)
  }

  const mapValue = obj => ({
    [subFields['value']]: obj.value,
    [subFields['label']]: obj.label
  })

  const handleChange = item => {
    if (selectedItem.length >= MAX_VALUES) return

    const mappedValue = mapValue(item)

    if (item.value === 9999) {
      const index = selectedItem.findIndex(
        sel =>
          sel[subFields['label']].toLowerCase() === inputValue.toLowerCase()
      )
      if (index !== -1) {
        setInputValue('')
      } else {
        setInputValue('')
        setSelectedItem(prevState => [
          ...prevState,
          {
            ...mappedValue,
            [subFields['label']]: inputValue
          }
        ])
      }
    } else if (
      selectedItem.findIndex(sel => sel[subFields['value']] === item.value) ===
      -1
    ) {
      setSelectedItem(prevState => [...prevState, { ...mappedValue }])
      setInputValue('')
    } else {
      setInputValue('')
    }
  }

  const handleDelete = item => () => {
    const newSelectedItem = [...selectedItem]
    const index = newSelectedItem.findIndex(sel => sel.label === item.label)
    newSelectedItem.splice(index, 1)
    setSelectedItem(newSelectedItem)
  }

  const mappedValues = useMemo(
    () =>
      (selectedItem &&
        selectedItem.map(sel => {
          if (!sel[subFields['value']]) return null
          return {
            value: sel[subFields['value']],
            label: sel[subFields['label']]
          }
        })) ||
      [],
    [selectedItem]
  )

  return (
    <FormControl className={className} style={{ flex: 1 }} error={!!errors}>
      <Downshift
        id="downshift-multiple"
        inputValue={inputValue}
        onChange={handleChange}
        selectedItem={mappedValues}
        itemToString={item => (item ? item.label : '')}
      >
        {({
          getInputProps,
          getItemProps,
          getLabelProps,
          isOpen,
          inputValue: inputValue2,
          selectedItem: selectedItem2,
          highlightedIndex
        }) => {
          const { onBlur, onChange, onFocus, ...inputProps } = getInputProps({
            onKeyDown: handleKeyDown,
            placeholder:
              selectedItem &&
              selectedItem.length === 0 &&
              extra &&
              extra.placeholder
                ? extra.placeholder
                : ''
          })

          return (
            <div className={classes.container}>
              {renderInput({
                fullWidth: true,
                classes,
                label: label || '',
                errors,
                InputLabelProps: getLabelProps(),
                InputProps: {
                  startAdornment: mappedValues.map(item => {
                    if (!item || !item.value || !item.label) return null
                    return (
                      <Chip
                        key={item.label}
                        tabIndex={-1}
                        label={item.label}
                        className={classes.chip}
                        onDelete={handleDelete(item)}
                      />
                    )
                  }),
                  onBlur,
                  onChange: event => {
                    handleInputChange(event)
                    onChange(event)
                  },
                  onFocus
                },
                inputProps
              })}
              {errors && <FormHelperText>{errors}</FormHelperText>}

              {isOpen ? (
                <Paper className={classes.paper} square>
                  {getSuggestions(inputValue2).map((suggestion, index) =>
                    renderSuggestion({
                      suggestion,
                      index,
                      itemProps: getItemProps({ item: suggestion }),
                      highlightedIndex,
                      selectedItem: selectedItem2
                    })
                  )}
                </Paper>
              ) : null}
            </div>
          )
        }}
      </Downshift>
    </FormControl>
  )
}

TextChip.propTypes = {
  // classes: PropTypes.object
}

export default TextChip
