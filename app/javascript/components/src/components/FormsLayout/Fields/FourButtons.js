import React, { Fragment } from 'react'
import PropTypes from 'prop-types'
import Button from '@material-ui/core/Button'

const FourButtons = ({ pro: { buttons } }) => {
  return (
    <>
      {buttons.map(({ contained, buttonClass, text, ...e }) => (
        <Button
          key={text}
          onClick={() => {}}
          variant={!contained ? 'outlined' : 'contained'}
          {...e}
          className={`text-wrap text-${
            !contained ? 'primary' : 'white'
          } ${buttonClass}`}
        >
          {text}
        </Button>
      ))}
    </>
  )
}

export default FourButtons

FourButtons.propTypes = {
  pro: PropTypes.object.isRequired
}
