import React from 'react'
import PropTypes from 'prop-types'
import { Row } from 'reactstrap'
import Btn from '@material-ui/core/Button'
import Typography from '@material-ui/core/Typography'
import { AddCircleOutline } from '@material-ui/icons'

const Button = ({
  pro: {
    title,
    titleClass,
    contained,
    toggle,
    icon,
    text,
    action,
    buttonClass,
    className,
    ...e
  }
}) => {
  return (
    <Row className={className}>
      {title && (
        <Typography variant="body1" className={titleClass}>
          {title}
        </Typography>
      )}
      <Btn
        onClick={() => {
          alert('este es un boton')
        }}
        variant={!contained ? 'outlined' : 'contained'}
        {...e}
        className={`text-wrap text-${
          !contained ? 'primary' : 'white'
        } ${buttonClass}`}
      >
        {text}
        {icon && <AddCircleOutline className="d-inline-block ml-10" />}
      </Btn>
    </Row>
  )
}

Button.propTypes = {
  pro: PropTypes.object.isRequired
}

export default Button
