import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import DialogActions from '@material-ui/core/DialogActions'
import DialogContent from '@material-ui/core/DialogContent'
import DialogContentText from '@material-ui/core/DialogContentText'
import Typography from '@material-ui/core/Typography'
import MailOutline from '@material-ui/icons/MailOutline'
import Radio from '@material-ui/core/Radio'
import RadioGroup from '@material-ui/core/RadioGroup'
import FormControlLabel from '@material-ui/core/FormControlLabel'
import Lock from '@material-ui/icons/Lock'
import { Row, Col } from 'reactstrap'
import CloseIcon from './CloseIcon'
import LoginButton from './LoginButton'

const SignIn = props => {
  const {
    session = null,
    sessions_path = null,
    source_name = null,
    toggleOpenState = null,
    setCurrentModal = null
  } = props

  const [sourceName, setSourceName] = useState(source_name || 'user')
  const [sessionPath, setSessionPath] = useState(
    session || sessions_path[source_name] || sessions_path.user
  )

  useEffect(() => {
    if (!session) setSessionPath(sessions_path[sourceName])
  }, [sourceName])

  const handleRadioChange = event => {
    if (!source_name) setSourceName(event.target.value)
  }
  return (
    <>
      <div
        id="max-width-dialog-title"
        style={{ position: 'relative' }}
        className="m-loginHeader mt-25"
      >
        <CloseIcon
          color="primary"
          className="a-button--close"
          onClick={() => {
            if (toggleOpenState) toggleOpenState('login', false)
            else window.location.assign('/')
          }}
        />
        <Row noGutters className="justify-content-center">
          <div className="ht-image">
            <img
              src="/assets/static/img/appLogoC.svg"
              className="mr-15 animeted fadeIn"
              alt="site logo"
            />
          </div>
        </Row>
      </div>
      <DialogContent className="m-loginContent mt-20 p-0 px-40">
        <DialogContentText style={{ textAlign: 'center' }}>
          <p className="a-typo__body2 color__slategray-main mb-5">
            {props.session_translation.sign_in.subtitle}
          </p>
          <h5 className="color__blue-main">
            {props.session_translation.sign_in.title}
          </h5>
        </DialogContentText>
        <form
          id={`new_${sourceName}`}
          className={`new_${sourceName}`}
          action={sessionPath}
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
                className="loginInput__icon color__slategray-light"
                style={{}}
              />
              <input
                name={`${sourceName}[email]`}
                id={`${sourceName}_email`}
                className="loginInput pl-15 py-10"
                autoComplete="email"
                placeholder={props.session_translation.sign_in.email_label}
                type="email"
              />
            </div>
            <div className="loginInputContainer">
              <Lock className="loginInput__icon color__slategray-light" />
              <input
                name={`${sourceName}[password]`}
                id={`${sourceName}_password`}
                className="loginInput pl-15 py-10"
                autoComplete="new-password"
                placeholder={props.session_translation.sign_in.password_label}
                type="password"
              />
            </div>
          </div>

          {!source_name && (
            <>
              <p
                className="m-0 mt-20 color__blue-main fw-bold"
                style={{ textAlign: 'center', fontSize: '1rem' }}
              >
                {props.session_translation.sign_in.sign_in_as}
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

          <Typography
            component="a"
            variant="caption"
            style={{ color: 'robin-blue', marginTop: 10 }}
            href={`/${
              sourceName === 'user' ? 'users' : 'companies'
            }/password/new`}
          >
            {props.session_translation.sign_in.forget_password}
          </Typography>
          <Row noGutters className="justify-content-center my-20">
            <Col xs={12} className="px-30">
              <button
                type="submit"
                className="a-button a-button--primary fw-bold"
                style={{
                  textTransform: 'uppercase',
                  fontSize: '1rem',
                  paddingTop: 12,
                  paddingBottom: 12
                }}
              >
                {props.session_translation.sign_in.button_action.sign_in_label}
              </button>
            </Col>
          </Row>
        </form>
        <Row className="mt-40">
          <Col xs={12}>
            <LoginButton
              variant="outlined"
              href={props.user_facebook_omniauth_authorize_path}
            >
              {props.session_translation.sign_in.button_action.sign_in_facebook}
            </LoginButton>
          </Col>
        </Row>
        <Row className="mt-10">
          <Col xs={12}>
            <LoginButton variant="outlined" disabled>
              {props.session_translation.sign_in.button_action.sign_in_google}
            </LoginButton>
          </Col>
        </Row>
      </DialogContent>
      <DialogActions className="my-10">
        <div className="w-100 text-center">
          <Typography variant="caption" component="span">
            {props.session_translation.sign_in.no_account.title}
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
              if (setCurrentModal) setCurrentModal('sign_up')
              else
                window.location.assign(
                  `/${sourceName === 'user' ? 'users' : 'companies'}/sign_up`
                )
            }}
          >
            {props.session_translation.sign_in.no_account.sign_up}
          </Typography>
        </div>
      </DialogActions>
    </>
  )
}

export default SignIn

SignIn.propTypes = {
  toggleOpenState: PropTypes.func.isRequired,
  setCurrentModal: PropTypes.func.isRequired,
  user_facebook_omniauth_authorize_path: PropTypes.string.isRequired,
  session: PropTypes.string.isRequired,
  sessions_path: PropTypes.string.isRequired,
  source_name: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired,
  csrf_param: PropTypes.string.isRequired,
  session_translation: PropTypes.object.isRequired
}
