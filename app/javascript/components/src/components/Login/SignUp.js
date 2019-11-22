import React from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import DialogActions from '@material-ui/core/DialogActions'
import DialogTitle from '@material-ui/core/DialogTitle'
import DialogContent from '@material-ui/core/DialogContent'
import DialogContentText from '@material-ui/core/DialogContentText'
import MailOutline from '@material-ui/icons/MailOutline'
import Lock from '@material-ui/icons/Lock'
import Divider from '@material-ui/core/Divider'
import CloseIcon from './CloseIcon'
import LoginButton from './LoginButton'
import {
  LoginInputWrapper,
  LoginInputContainer,
  LoginInput
} from './LoginInput'

const SignUp = props => (
  <>
    <div
      id="max-width-dialog-title"
      style={{ position: 'relative' }}
      className="mt-25"
    >
      <CloseIcon
        color="primary"
        onClick={() => props.toggleOpenState('login', false)}
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
    <DialogContent className="mt-20 p-0 px-40">
      <DialogContentText style={{ textAlign: 'center' }}>
        <Typography variant="body2" component="span">
          {props.session_translation.sign_up.title}
        </Typography>
      </DialogContentText>
      <form
        id={`new_${props.source_name}`}
        className={`new_${props.source_name}`}
        action={props.registration_path}
        acceptCharset="UFT-8"
        method="post"
      >
        <input type="hidden" name={props.csrf_param} value={props.csrf_token} />
        <LoginInputWrapper>
          <LoginInputContainer style={{ borderBottom: '1px solid' }}>
            <MailOutline
              style={{
                color: 'lightgrey',
                top: '0.75rem',
                left: '.5rem',
                marginLeft: '15px'
              }}
            />
            <LoginInput
              name={`${props.source_name}[email]`}
              id={`${props.source_name}_email`}
              className="pl-15 py-10"
              autoComplete="email"
              placeholder={props.session_translation.sign_up.email_label}
              type="email"
            />
          </LoginInputContainer>
          <LoginInputContainer style={{ borderBottom: '1px solid' }}>
            <Lock
              style={{
                color: 'lightgrey',
                top: '0.75rem',
                left: '.5rem',
                marginLeft: '15px'
              }}
            />
            <LoginInput
              name={`${props.source_name}[password]`}
              id={`${props.source_name}_password`}
              className="pl-15 py-10"
              autoComplete="new-password"
              placeholder={props.session_translation.sign_up.password_label}
              type="password"
            />
          </LoginInputContainer>
          <LoginInputContainer>
            <Lock
              style={{
                color: 'lightgrey',
                top: '0.75rem',
                left: '.5rem',
                marginLeft: '15px'
              }}
            />
            <LoginInput
              name={`${props.source_name}[password_confirmation]`}
              id={`${props.source_name}_password_confirmation`}
              className="pl-15 py-10"
              placeholder={props.session_translation.sign_up.pass_confirm_label}
              type="password"
            />
          </LoginInputContainer>
        </LoginInputWrapper>
        <Row noGutters className="justify-content-center my-20">
          <Col xs={12}>
            <LoginButton type="submit" color="primary" variant="contained">
              {props.session_translation.sign_up.button_action.sign_up_label}
            </LoginButton>
          </Col>
        </Row>
      </form>
      <Row className="justify-content-center align-items-center my-20">
        <Divider variant="middle" className="mx-10 w-40" />
        <span style={{ color: 'lightgrey' }}>o</span>
        <Divider variant="middle" className="mx-10 w-40" />
      </Row>
      <Row className="mt-10">
        <Col xs={12}>
          <LoginButton variant="outlined" disabled>
            {props.session_translation.sign_up.button_action.sign_up_facebook}
          </LoginButton>
        </Col>
      </Row>
      <Row className="mt-10">
        <Col xs={12}>
          <LoginButton variant="outlined" disabled>
            {props.session_translation.sign_up.button_action.sign_up_google}
          </LoginButton>
        </Col>
      </Row>
    </DialogContent>
    <DialogActions className="my-10">
      <div className="w-100 text-center">
        <Typography variant="caption" component="span">
          {props.session_translation.sign_up.with_account.title}
        </Typography>
        <Typography
          variant="caption"
          className="ml-5"
          component="a"
          style={{ color: '#00CED5', cursor: 'pointer' }}
          onClick={() =>
            props.setCurrentModal(
              props.source_name === 'user'
                ? 'users_sign_in'
                : 'companies_sign_in'
            )
          }
        >
          {props.session_translation.sign_up.with_account.sign_in}
        </Typography>
      </div>
    </DialogActions>
  </>
)

export default SignUp

SignUp.propTypes = {
  toggleOpenState: PropTypes.func.isRequired,
  setCurrentModal: PropTypes.func.isRequired,
  registration_path: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired,
  csrf_param: PropTypes.string.isRequired,
  source_name: PropTypes.string.isRequired,
  session_translation: PropTypes.object.isRequired
}
