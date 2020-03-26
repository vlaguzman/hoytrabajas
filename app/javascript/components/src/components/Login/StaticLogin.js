import React from 'react'
import PropTypes from 'prop-types'
import SignIn from './SignIn'
import SignUp from './SignUp'

const Login = ({
  currentContent = null,
  companies_registration_path = null,
  users_registration_path = null,
  companies_sessions_path = null,
  users_sessions_path = null,
  source_name = null,
  session_path = null,
  registration_path = null,
  ...rest
}) => (
  <div className="m-register">
    {currentContent === 'sign_in' && (
      <SignIn
        isStatic
        source_name={source_name || null}
        session={session_path || null}
        sessions_path={{
          user: users_sessions_path,
          company: companies_sessions_path
        }}
        {...rest}
      />
    )}
    {currentContent === 'sign_up' && (
      <SignUp
        isStatic
        source_name={source_name || null}
        registration={registration_path || null}
        registration_path={{
          user: users_registration_path,
          company: companies_registration_path
        }}
        {...rest}
      />
    )}
  </div>
)

export default Login

Login.propTypes = {
  csrf_token: PropTypes.string.isRequired,
  csrf_param: PropTypes.string.isRequired,
  currentContent: PropTypes.string.isRequired,
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
