import React, { useState, useEffect, useMemo } from 'react'
import PropTypes from 'prop-types'
import Downshift from 'downshift'
import deburr from 'lodash/deburr'
import { makeStyles } from '@material-ui/styles'
import TextField from '@material-ui/core/TextField'
import Paper from '@material-ui/core/Paper'
import MenuItem from '@material-ui/core/MenuItem'
import Chip from '@material-ui/core/Chip'
import FormControl from '@material-ui/core/FormControl'
import FormHelperText from '@material-ui/core/FormHelperText'

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
    margin: `5px 10px`,
    position: 'absolute',
    bottom: '2px'
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
  const isSelected = selectedItem === suggestion.description
  return (
    <MenuItem
      {...itemProps}
      key={suggestion.description}
      value={suggestion.id}
      selected={isHighlighted}
      component="div"
      style={{
        fontWeight: isSelected ? 500 : 400
      }}
    >
      {suggestion.description}
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
    description: PropTypes.string.isRequired
  }).isRequired
}

const TextChip = props => {
  const {
    selectOptions,
    handleChange,
    inputValue = null,
    description = null,
    label = null,
    newItemDescription = null,
    placeholder = null,
    isMultiple = false
  } = props

  const [inputText, setInputText] = useState('')
  const [selectedItem, setSelectedItem] = useState(
    { id: inputValue, description } || []
  )
  const [errors, setErrors] = useState(false)
  const classes = useStyles()

  useEffect(() => {
    if (
      (inputValue && inputValue !== selectedItem.id) ||
      (inputValue &&
        inputValue === 9999 &&
        description !== selectedItem.description)
    ) {
      setSelectedItem({
        id: inputValue,
        description
      })
    }
  }, [inputValue, description])

  useEffect(() => {
    handleChange(selectedItem)
  }, [selectedItem])

  function getSelectedOptions(desc, { showEmpty = false } = {}) {
    const text = deburr(desc.trim()).toLowerCase()
    const inputLength = text.length
    let count = 0

    const results = selectOptions.filter(suggestion => {
      const keep =
        count < 5 &&
        suggestion.description.slice(0, inputLength).toLowerCase() === text

      if (keep) {
        count += 1
      }

      return keep
    })

    return inputLength === 0 && !showEmpty
      ? []
      : (results.length > 0 && results) || [
          { id: 9999, description: newItemDescription }
        ]
  }

  const handleKeyDown = event => {
    if (event.key === 'Enter') event.preventDefault()
    if (
      selectedItem &&
      selectedItem.length &&
      !inputText.length &&
      event.key === 'Backspace'
    ) {
      setSelectedItem(selectedItem.slice(0, selectedItem.length - 1))
    }
  }

  const handleInputChange = event => {
    if (!isMultiple && description) {
      setInputText('')
      return
    }
    setInputText(event.target.value)
  }

  const handleSelectChange = item => {
    if (!isMultiple) {
      const desc = item.id === 9999 ? inputText : item.description
      setInputText('')
      setSelectedItem({
        ...item,
        description: desc
      })
    }
  }

  const handleDelete = () => setSelectedItem(null)

  return (
    <FormControl
      className="classNameGoesHere"
      style={{ flex: 1 }}
      error={!!errors}
    >
      <Downshift
        id="downshift-multiple"
        inputValue={inputText}
        onChange={handleSelectChange}
        selectedItem={selectedItem}
        itemToString={item => (item ? item.description : '')}
      >
        {({
          getInputProps,
          getItemProps,
          getLabelProps,
          isOpen,
          inputValue: inputText2,
          selectedItem: selectedItem2,
          highlightedIndex
        }) => {
          const { onBlur, onChange, onFocus, ...inputProps } = getInputProps({
            onKeyDown: handleKeyDown,
            placeholder:
              (selectedItem && selectedItem.length === 0 && placeholder) || ''
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
                  disabled: selectedItem && selectedItem.description,
                  startAdornment: Array.isArray(selectedItem)
                    ? selectedItem.map(item => {
                        if (!item || !item.id || !item.description) return null
                        return (
                          <Chip
                            key={item.description}
                            tabIndex={-1}
                            label={item.description}
                            className={classes.chip}
                            onDelete={handleDelete(item)}
                          />
                        )
                      })
                    : (selectedItem && selectedItem.description && (
                        <Chip
                          key={selectedItem.description}
                          tabIndex={-1}
                          label={selectedItem.description}
                          className={classes.chip}
                          onDelete={handleDelete(selectedItem)}
                        />
                      )) ||
                      null,
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
                  {getSelectedOptions(inputText2).map((suggestion, index) =>
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
  inputValue: PropTypes.string.isRequired,
  description: PropTypes.string,
  selectOptions: PropTypes.array.isRequired,
  handleChange: PropTypes.func.isRequired,
  label: PropTypes.string,
  placeholder: PropTypes.string,
  isMultiple: PropTypes.bool
}

export default TextChip
