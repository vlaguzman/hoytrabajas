import React from 'react'
import PropTypes from 'prop-types'
import Radio from '@material-ui/core/Radio'
import RadioGroup from '@material-ui/core/RadioGroup'
import FormControlLabel from '@material-ui/core/FormControlLabel'

const Radios = ({ pro: { ariaLabel, ...e }, aux }) => {
  return (
    <RadioGroup
      // ref={node => {
      //    this.radioGroup = node;
      // }}
      aria-label={ariaLabel}
      {...e}
    >
      {aux.map(option => (
        <FormControlLabel
          className="p-0 mx-0 mb-0"
          value={option}
          key={option}
          control={<Radio className="pr-5" />}
          label={option}
        />
      ))}
    </RadioGroup>
  )
}

export default Radios

Radios.propTypes = {
  pro: PropTypes.object.isRequired,
  aux: PropTypes.object.isRequired
}
