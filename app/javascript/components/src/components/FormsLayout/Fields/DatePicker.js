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
  const { label, inputName } = props
  const { datepicker = null } = pro
  const formatString = datepicker && datepicker.format

  const formatLabel = date => {
    const stringDate = format(date, formatString)
    const capitalized = capitalize(stringDate)
    return capitalized
  }

  const [selectedDate, handleDateChange] = useState(new Date());

  return (
    <MaterialDatePicker
      format="dd MMM yyyy"
      name={ inputName }
      {...pro}
      label={label}
      style={style}
      maxDate={new Date()}
      onChange={handleDateChange}
      value={selectedDate}
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
  inputName: PropTypes.string.isRequired,
  label: PropTypes.string.isRequired
}
