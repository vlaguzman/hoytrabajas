import React from 'react'
import PropTypes from 'prop-types'

const FormProgress = ({ value }) => {
  return (
    <div className="a-progressBar">
      <div className="progressBar__wrapper">
        <div
          className="progressBar__bar"
          style={{ width: `${value}%` }}
          value={value}
        />
        <div className="progressBar__dots">
          <div />
          <div />
          <div />
        </div>
      </div>
    </div>
  )
}

FormProgress.propTypes = {
  value: PropTypes.number.isRequired
}

export default FormProgress
