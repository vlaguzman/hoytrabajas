import React from 'react'
import PropTypes from 'prop-types'
import Dialog from '@material-ui/core/Dialog'
import SignIn from './SignIn'
import SignUp from './SignUp'

const Login = ({
  isOpen = true,
  toggleOpenState = null,
  currentModal = null,
  companies_registration_path = null,
  users_registration_path = null,
  companies_sessions_path = null,
  users_sessions_path = null,
  source_name = null,
  session_path = null,
  registration_path = null,
  ...rest
}) => (
  <Dialog
    fullWidth
    maxWidth="xs"
    open={isOpen}
    onClose={() => {
      if (toggleOpenState) toggleOpenState('login', false)
      else window.location.assign('/')
    }}
    aria-labelledby="max-width-dialog-title"
    className="m-loginModal"
  >
    {currentModal === 'sign_in' && (
      <SignIn
        source_name={source_name || null}
        session={session_path || null}
        sessions_path={{
          user: users_sessions_path,
          company: companies_sessions_path
        }}
        toggleOpenState={toggleOpenState}
        {...rest}
      />
    )}
    {currentModal === 'sign_up' && (
      <SignUp
        source_name={source_name || null}
        registration={registration_path || null}
        registration_path={{
          user: users_registration_path,
          company: companies_registration_path
        }}
        toggleOpenState={toggleOpenState}
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
  companies_registration_path: PropTypes.string,
  users_registration_path: PropTypes.string,
  companies_sessions_path: PropTypes.string,
  users_sessions_path: PropTypes.string,
  source_name: PropTypes.string,
  session_path: PropTypes.string,
  registration_path: PropTypes.string,
  isOpen: PropTypes.bool,
  toggleOpenState: PropTypes.func,
  session_translation: PropTypes.object.isRequired
}
