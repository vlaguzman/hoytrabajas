import React from 'react'
import PropTypes from 'prop-types'
import Dialog from '@material-ui/core/Dialog'
import SignIn from './SignIn'
import SignUp from './SignUp'

const Login = ({ isOpen, toggleOpenState, currentModal, ...rest }) => (
  <Dialog
    fullWidth
    maxWidth="xs"
    open={isOpen}
    onClose={() => toggleOpenState('login', false)}
    aria-labelledby="max-width-dialog-title"
  >
    {currentModal === 'users_sign_in' && (
      <SignIn source_name="user" {...rest} />
    )}
    {currentModal === 'users_sign_up' && (
      <SignUp source_name="user" {...rest} />
    )}
    {currentModal === 'companies_sign_in' && (
      <SignIn source_name="company" {...rest} />
    )}
    {currentModal === 'companies_sign_up' && (
      <SignUp source_name="company" {...rest} />
    )}
  </Dialog>
)

export default Login

Login.propTypes = {
  csrf_token: PropTypes.string.isRequired,
  csrf_param: PropTypes.string.isRequired,
  currentModal: PropTypes.string.isRequired,
  isOpen: PropTypes.bool.isRequired,
  toggleOpenState: PropTypes.func.isRequired,
  session_translation: PropTypes.object.isRequired
}
