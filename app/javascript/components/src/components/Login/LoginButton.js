import React from 'react'
import PropTypes from 'prop-types'
import Button from '@material-ui/core/Button'

const LoginButton = ({ children, ...props }) => (
  <Button {...props} style={{ textTransform: 'none', fontSize: '1rem', paddingTop: 12, paddingBottom: 12 }}>
    {children}
  </Button>
)

export default LoginButton

LoginButton.propTypes = {
  children: PropTypes.string.isRequired
}
