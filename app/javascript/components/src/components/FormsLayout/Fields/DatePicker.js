import React, {useState} from 'react'
import PropTypes from 'prop-types'
import { DatePicker as MaterialDatePicker } from '@material-ui/pickers'
import InputAdornment from '@material-ui/core/InputAdornment'
import IconButton from '@material-ui/core/IconButton'
import CalendarIcon from '@material-ui/icons/CalendarToday'
import ArrowBackIcon from '@material-ui/icons/ArrowBackIos'
import ArrowForwardIcon from '@material-ui/icons/ArrowForwardIos'
import { format } from '../../../helpers'

const pro = {
  className: ' animated fadeIn',
  datepicker: {
    format: 'dd MMM yyyy',
    disableFuture: true,
    emptyLabel: '...'
  }
}

const style = {
  textTransform: 'capitalize'
}

function capitalize(string) {
  return string.replace(/(?:^|\s)\S/g, a => a.toUpperCase())
}

const DatePicker = props => {
  const { inputValue, handleSimpleChange, name, label, dateOptions } = props
  const formatString = dateOptions && dateOptions.format

  const formatLabel = date => {
    const stringDate = format(date, formatString)
    const capitalized = capitalize(stringDate)
    return capitalized
  }

  const onChange = value => handleSimpleChange(value, name)

  return (
    <MaterialDatePicker
      format={dateOptions.format || 'dd MMM yyyy'}
      name={name}
      label={label}
      maxDate={new Date()}
      onChange={onChange}
      value={inputValue || ''}
      labelFunc={formatLabel}
      InputProps={{
        endAdornment: (
          <InputAdornment position="end" className="date-picker-icon">
            <IconButton>
              <CalendarIcon />
            </IconButton>
          </InputAdornment>
        )
      }}
      animateYearScrolling={false}
      leftArrowIcon={<ArrowBackIcon />}
      rightArrowIcon={<ArrowForwardIcon />}
    />
  )
}

export default DatePicker

DatePicker.propTypes = {
  inputValue: PropTypes.oneOfType([
    PropTypes.string,
    PropTypes.number,
    PropTypes.array
  ]).isRequired,
  handleSimpleChange: PropTypes.func.isRequired,
  name: PropTypes.string.isRequired,
  label: PropTypes.string.isRequired,
  dateOptions: PropTypes.shape({
    format: PropTypes.string,
    disableFuture: PropTypes.bool,
    emptyLabel: PropTypes.string,
    views: PropTypes.array
  }).isRequired
}
