import React from 'react'
import PropTypes from 'prop-types'
import { withStyles } from '@material-ui/core/styles'
import FormControl from '@material-ui/core/FormControl'
import FormHelperText from '@material-ui/core/FormHelperText'
import Typography from '@material-ui/core/Typography'
import Slider from '@material-ui/core/Slider'
import Label from '../styles/Label'

const styles = theme => ({
  root: {
    padding: `30px 0 0`,
    color: theme.palette.secondary.main
  },
  valueLabel: {
    top: `-19px`,
    left: `calc(-50% + 1px)`,
    '& > span': {
      width: '22px',
      height: '22px',
      color: theme.palette.primary.main
    },
    '& > span > span': {
      color: 'white',
      fontSize: '10px'
    }
  },
  thumb: {
    width: '15px',
    height: '15px',
    color: 'white',
    border: `1px solid rgba(0, 0, 0, .35)`
  },
  rail: {
    height: '4px'
  },
  track: {
    height: '4px'
  }
})

const StyledSlider = withStyles(styles)(Slider)

function valuetext(value) {
  return `${value}°C`
}

const RangeSlider = props => {
  const {
    pro: { name, label },
    inputValue,
    handleSlider,
    errors,
    extra
  } = props
  const { step, minValue, maxValue = null, valueLabelDisplay = null } = extra
  const defaultValue = minValue && maxValue && [minValue, maxValue]

  return (
    <FormControl error={!!errors}>
      {label && (
        <Label id="range-slider" gutterBottom>
          {label}
        </Label>
      )}
      <StyledSlider
        value={inputValue[name] || defaultValue}
        onChange={handleSlider}
        step={step || 1}
        min={minValue || 0}
        max={maxValue || 100}
        valueLabelDisplay={valueLabelDisplay || 'on'}
        aria-label={label || `hehehe-label`}
        // aria-labelledby="range-slider"
        getAriaValueText={valuetext}
      />
      {!!errors && <FormHelperText>{errors}</FormHelperText>}
    </FormControl>
  )
}

export default RangeSlider
