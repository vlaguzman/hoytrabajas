import React from 'react'
import Typography from '@material-ui/core/Typography'

const FormTitle = ({ title, subtitle }) => {
  return (
    <div
      className="w-75 d-flex flex-column justify-content-center mt-40  animated bounceInDown"
      style={{ height: '15%' }}
    >
      <Typography
        style={{ lineHeight: '1' }}
        className="text-center fw-bold"
        variant="h5"
      >
        <span>{title}</span>
      </Typography>
      <Typography
        className="text-center fw-bold text-muted mt-10"
        variant="subtitle1"
      >
        <small className="fw-bold">{subtitle}</small>
      </Typography>
    </div>
  )
}

export default FormTitle
