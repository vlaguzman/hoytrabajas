import React from 'react'
import PropTypes from 'prop-types'
import Typography from '@material-ui/core/Typography'
import styled from 'styled-components'

const themeColor = props => {
  if (props.theme.palette) return props.theme.palette.secondary.main
}

const StyledLabel = styled(Typography)`
  color: ${props => themeColor(props)};
  font-size: 16px;
`

const FormLabel = ({ children, isRequired = false, ...props }) => {
  return (
    <StyledLabel className="MuiInputLabel-shrink" {...props}>
      {children}
      {isRequired && ` *`}
    </StyledLabel>
  )
}

export default FormLabel

FormLabel.propTypes = {
  children: PropTypes.string.isRequired,
  isRequired: PropTypes.bool
}
