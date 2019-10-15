import React from 'react'
import PropTypes from 'prop-types'
import { withStyles } from '@material-ui/core/styles'
import FormControl from '@material-ui/core/FormControl'
import FormHelperText from '@material-ui/core/FormHelperText'
import Slider from '@material-ui/core/Slider'
import styled from 'styled-components'
import FormLabel from '../FormLabel'

const styles = theme => ({
  root: {
    flex: 1,
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

const FlexContainer = styled.div`
  display: flex;
  align-items: center;
  padding: 20px 0 0;
`
const SideText = styled.div`
  flex: 0 1 20%;
  margin-bottom: 3px;
`

const RangeSlider = props => {
  const {
    inputValue,
    handleSimpleChange,
    name,
    label,
    beforeLabel,
    afterLabel,
    values,
    step,
    isMultiple,
    isRequired = false
  } = props
  const { min, max } = values
  const defaultValue = isMultiple ? min && max && [min, max] : min

  const hasErrors = false

  const onChange = (e, value) => handleSimpleChange(value, name)

  return (
    <FormControl error={hasErrors}>
      {label && (
        <FormLabel required={isRequired} id="range-slider" gutterBottom>
          {label}
        </FormLabel>
      )}
      <FlexContainer>
        {beforeLabel && <SideText>{beforeLabel}</SideText>}
        <StyledSlider
          name={name}
          value={inputValue || defaultValue}
          onChange={onChange}
          step={step || 1}
          min={min || 0}
          max={max || 100}
          aria-label={label || `slider`}
          valueLabelDisplay="on"
          style={{
            marginLeft: beforeLabel ? `5px` : 0,
            marginRight: afterLabel ? `15px` : 0
          }}
        />
        {afterLabel && (
          <SideText style={{ textAlign: 'right' }}>{afterLabel}</SideText>
        )}
      </FlexContainer>
      {hasErrors && <FormHelperText>should display error here</FormHelperText>}
    </FormControl>
  )
}

export default RangeSlider

RangeSlider.propTypes = {
  inputValue: PropTypes.oneOfType([
    PropTypes.string,
    PropTypes.number,
    PropTypes.array
  ]).isRequired,
  handleSimpleChange: PropTypes.func.isRequired,
  name: PropTypes.string.isRequired,
  label: PropTypes.string,
  beforeLabel: PropTypes.string,
  afterLabel: PropTypes.string,
  isMultiple: PropTypes.bool,
  isRequired: PropTypes.bool,
  values: PropTypes.shape({
    min: PropTypes.number.isRequired,
    max: PropTypes.number
  }),
  step: PropTypes.number.isRequired
}
