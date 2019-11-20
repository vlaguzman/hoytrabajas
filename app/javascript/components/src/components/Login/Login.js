import React from 'react'
import PropTypes from 'prop-types'
import Dialog from '@material-ui/core/Dialog'
import SignIn from './SignIn'
import SignUp from './SignUp'

const Login = ({
  isOpen,
  toggleOpenState,
  currentModal,
  companies_registration_path,
  users_registration_path,
  companies_sessions_path,
  users_sessions_path,
  ...rest
}) => (
  <Dialog
    fullWidth
    maxWidth="xs"
    open={isOpen}
    onClose={() => toggleOpenState('login', false)}
    aria-labelledby="max-width-dialog-title"
  >
    {currentModal === 'users_sign_in' && (
      <SignIn
        source_name="user"
        sessions_path={users_sessions_path}
        {...rest}
      />
    )}
    {currentModal === 'users_sign_up' && (
      <SignUp
        source_name="user"
        registration_path={users_registration_path}
        {...rest}
      />
    )}
    {currentModal === 'companies_sign_in' && (
      <SignIn
        source_name="company"
        sessions_path={companies_sessions_path}
        {...rest}
      />
    )}
    {currentModal === 'companies_sign_up' && (
      <SignUp
        source_name="company"
        registration_path={companies_registration_path}
        {...rest}
      />
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
