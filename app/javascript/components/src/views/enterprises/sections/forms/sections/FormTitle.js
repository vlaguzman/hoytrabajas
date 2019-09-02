import React from 'react'
import Typography from '@material-ui/core/Typography'

const FormTitle = ({ title, subtitle }) => {
  return (
    <div
      className="w-75 d-flex flex-column justify-content-center mt-40  animated bounceInDown"
      style={{ height: '15%' }}
    >
      <Typography className="text-center fw-bold" variant="h5">
        <span>{title}</span>
      </Typography>
      <Typography
        className="text-center fw-bold text-muted"
        variant="subtitle1"
      >
        <small>{subtitle}</small>
      </Typography>
    </div>
  )
}

export default FormTitle
