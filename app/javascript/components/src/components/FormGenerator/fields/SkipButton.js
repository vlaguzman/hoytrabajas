import React, { useContext } from 'react'
import PropTypes from 'prop-types'
import { Row } from 'reactstrap'
import Btn from '@material-ui/core/Button'
import Typography from '@material-ui/core/Typography'
import { AddCircleOutline } from '@material-ui/icons'
import { DispatchContext } from 'Context/formContext'

const SkipButton = ({
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
  },
  aux: { skip },
  scrollAction
}) => {
  const dispatch = useContext(DispatchContext)

  const skipForm = () => {
    dispatch({ type: skip })
    scrollAction()
  }
  return (
    <Row className={className}>
      {title && (
        <Typography variant="body1" className={titleClass}>
          {title}
        </Typography>
      )}
      <Btn
        onClick={() => skipForm()}
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

export default SkipButton

SkipButton.propTypes = {
  pro: PropTypes.object.isRequired,
  aux: PropTypes.object.isRequired,
  scrollAction: PropTypes.func.isRequired
}
