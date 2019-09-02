import React from 'react'
import PropTypes from 'prop-types'
import { DatePicker as MaterialDatePicker } from '@material-ui/pickers'
import InputAdornment from '@material-ui/core/InputAdornment'
import IconButton from '@material-ui/core/IconButton'
import CalendarIcon from '@material-ui/icons/CalendarToday'
import ArrowBackIcon from '@material-ui/icons/ArrowBackIos'
import ArrowForwardIcon from '@material-ui/icons/ArrowForwardIos'
import { format } from 'Helpers'

const style = {
  textTransform: 'capitalize'
}

function capitalize(string) {
  return string.replace(/(?:^|\s)\S/g, a => a.toUpperCase())
}

const DatePicker = props => {
  const { pro, inputValue, handleDate, extra } = props
  const { datepicker = null } = pro
  const formatString = datepicker && datepicker.format

  const formatLabel = date => {
    const stringDate = format(date, formatString)
    const capitalized = capitalize(stringDate)
    return capitalized
  }

  return (
    <MaterialDatePicker
      format="dd MMM yyyy"
      {...pro}
      // views={(extra && extra.dateViews) || ['date', 'month', 'year']}
      style={style}
      maxDate={new Date()}
      onChange={handleDate}
      value={inputValue[pro.name] || new Date()}
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
  pro: PropTypes.object.isRequired,
  inputValue: PropTypes.object.isRequired,
  handleDate: PropTypes.func.isRequired
}
