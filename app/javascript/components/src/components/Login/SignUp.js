import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import DialogActions from '@material-ui/core/DialogActions'
import Radio from '@material-ui/core/Radio'
import RadioGroup from '@material-ui/core/RadioGroup'
import FormControlLabel from '@material-ui/core/FormControlLabel'
import DialogContent from '@material-ui/core/DialogContent'
import DialogContentText from '@material-ui/core/DialogContentText'
import MailOutline from '@material-ui/icons/MailOutline'
import Lock from '@material-ui/icons/Lock'
import CloseIcon from './CloseIcon'
import LoginButton from './LoginButton'
import TermsAndConditionsTLink from '../../../views/devise/registrations/new/terms_and_conditions_tLink'

const SignUp = props => {
  const {
    registration = null,
    registration_path,
    source_name = null,
    toggleOpenState = null,
    setCurrentModal = null,
    isStatic = false
  } = props

  const [sourceName, setSourceName] = useState(source_name || 'user')
  const [registerPath, setRegisterPath] = useState(
    registration || registration_path[source_name] || registration_path.user
  )

  useEffect(() => {
    if (!registration) setRegisterPath(registration_path[sourceName])
  }, [sourceName])

  const handleRadioChange = event => {
    setSourceName(event.target.value)
  }

  return (
    <>
      <div
        id="max-width-dialog-title"
        style={{ position: 'relative' }}
        className="m-loginHeader mt-25"
      >
        {!isStatic && (
          <CloseIcon
            className="a-button--close"
            onClick={() => {
              if (toggleOpenState) toggleOpenState('login', false)
              else window.location.assign('/')
            }}
          />
        )}
        <Row noGutters className="justify-content-center">
          <div className="ht-image">
            <img
              src="/assets/static/img/hoytrabajas-logo-color.svg"
              className="mr-15 animated fadeIn"
              alt="site logo"
            />
          </div>
        </Row>
      </div>
      <DialogContent className="m-loginContent mt-20">
        <h5 className="color__blue-main loginTitle">
          {props.session_translation.sign_up.title}
        </h5>
        <form
          id={`new_${sourceName}`}
          className={`new_${sourceName}`}
          action={registerPath}
          acceptCharset="UFT-8"
          method="post"
        >
          <input
            type="hidden"
            name={props.csrf_param}
            value={props.csrf_token}
          />
          <div>
            <div className="loginInputContainer">
              <MailOutline
                className="color__slategray-light"
                style={{
                  top: '0.75rem',
                  left: '.5rem',
                  marginLeft: '15px'
                }}
              />
              <input
                name={`${sourceName}[email]`}
                id={`${sourceName}_email`}
                className="loginInput"
                autoComplete="email"
                placeholder={props.session_translation.sign_up.email_label}
                type="email"
              />
            </div>
            <div className="loginInputContainer">
              <Lock className="loginInput__icon color__slategray-light" />
              <input
                name={`${sourceName}[password]`}
                id={`${sourceName}_password`}
                className="loginInput"
                autoComplete="new-password"
                placeholder={props.session_translation.sign_up.password_label}
                type="password"
              />
            </div>
            <div className="loginInputContainer">
              <Lock className="loginInput__icon color__slategray-light" />
              <input
                name={`${sourceName}[password_confirmation]`}
                id={`${sourceName}_password_confirmation`}
                className="loginInput"
                placeholder={
                  props.session_translation.sign_up.pass_confirm_label
                }
                type="password"
              />
            </div>
          </div>
          <TermsAndConditionsTLink
            session_translation={props.session_translation.sign_up}
            terms_and_conditions_file_path={
              props.terms_and_conditions_file_path
            }
          />

          {!source_name && (
            <>
              <p className="color__blue-main loginAs">
                {props.session_translation.sign_up.sign_up_as}
              </p>
              <RadioGroup
                aria-label="gender"
                name="gender1"
                value={sourceName}
                onChange={handleRadioChange}
              >
                <div className="a-radioItems d-flex justify-content-center">
                  <FormControlLabel
                    value="user"
                    control={<Radio />}
                    label="Candidato"
                  />
                  <FormControlLabel
                    value="company"
                    control={<Radio />}
                    label="Empleador"
                  />
                </div>
              </RadioGroup>
            </>
          )}

          <div className="loginButton__wrapper">
            <button
              type="submit"
              className="a-button --primary --big loginButton"
            >
              {props.session_translation.sign_up.button_action.sign_up_label}
            </button>
          </div>
        </form>
        <Row className="mt-40">
          <Col xs={12}>
            <LoginButton variant="outlined" disabled>
              {props.session_translation.sign_up.button_action.sign_up_facebook}
            </LoginButton>
          </Col>
        </Row>
      </DialogContent>
      {!isStatic && (
        <DialogActions className="loginActions my-10">
          <div className="w-100 text-center">
            <div className="loginActions__divider" />
            <Typography variant="caption" component="span">
              {props.session_translation.sign_up.with_account.title}
            </Typography>
            <Typography
              variant="caption"
              className="ml-5 color__blue-main fw-bold"
              component="a"
              style={{
                color: '#0b5aa0',
                textDecoration: 'underline',
                cursor: 'pointer'
              }}
              onClick={() => {
                if (setCurrentModal) setCurrentModal('sign_in')
                else
                  window.location.assign(
                    `/${sourceName === 'user' ? 'users' : 'companies'}/sign_in`
                  )
              }}
            >
              {props.session_translation.sign_up.with_account.sign_in}
            </Typography>
          </div>
        </DialogActions>
      )}
    </>
  )
}

export default SignUp

SignUp.propTypes = {
  toggleOpenState: PropTypes.func.isRequired,
  setCurrentModal: PropTypes.func.isRequired,
  registration: PropTypes.string.isRequired,
  source_name: PropTypes.string.isRequired,
  registration_path: PropTypes.object.isRequired,
  csrf_token: PropTypes.string.isRequired,
  csrf_param: PropTypes.string.isRequired,
  session_translation: PropTypes.object.isRequired
}
