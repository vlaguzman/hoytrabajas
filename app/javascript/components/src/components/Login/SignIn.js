import React from 'react'
import PropTypes from 'prop-types'
import DialogActions from '@material-ui/core/DialogActions'
import DialogContent from '@material-ui/core/DialogContent'
import DialogContentText from '@material-ui/core/DialogContentText'
import Divider from '@material-ui/core/Divider'
import Typography from '@material-ui/core/Typography'
import MailOutline from '@material-ui/icons/MailOutline'
import Lock from '@material-ui/icons/Lock'
import { Row, Col } from 'reactstrap'
import CloseIcon from './CloseIcon'
import LoginButton from './LoginButton'
import Checkbox from '../FormsLayout/Fields/Checkbox'
import {
  LoginInputWrapper,
  LoginInputContainer,
  LoginInput
} from './LoginInput'


const SignIn = props => (
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
          {props.session_translation.sign_in.title}
        </Typography>
      </DialogContentText>
      <form
        id={`new_${props.source_name}`}
        className={`new_${props.source_name}`}
        action={props.sessions_path}
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
              placeholder={props.session_translation.sign_in.email_label}
              type="email"
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
              name={`${props.source_name}[password]`}
              id={`${props.source_name}_password`}
              className="pl-15 py-10"
              autoComplete="new-password"
              placeholder={props.session_translation.sign_in.password_label}
              type="password"
            />


          </LoginInputContainer>
        </LoginInputWrapper>

        <Checkbox
          description={'aceptar términos y condiciones.'}
          isRequired
        />

        <Typography
          component="a"
          variant="caption"
          style={{ color: 'robin-blue', marginTop: 10 }}
          href={`/${
            props.source_name === 'user' ? 'users' : 'companies'
          }/password/new`}
        >
          {props.session_translation.sign_in.forget_password}
        </Typography>
        <Row noGutters className="justify-content-center my-20">
          <Col xs={12}>
            <LoginButton type="submit" color="primary" variant="contained">
              {props.session_translation.sign_in.button_action.sign_in_label}
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
          className="ml-5"
          component="a"
          style={{ color: '#00CED5', cursor: 'pointer' }}
          onClick={() =>
            props.setCurrentModal(
              props.source_name === 'user'
                ? 'users_sign_up'
                : 'companies_sign_up'
            )
          }
        >
          {props.session_translation.sign_in.no_account.sign_up}
        </Typography>
      </div>
    </DialogActions>
  </>
)

export default SignIn

SignIn.propTypes = {
  toggleOpenState: PropTypes.func.isRequired,
  setCurrentModal: PropTypes.func.isRequired,
  user_facebook_omniauth_authorize_path: PropTypes.string.isRequired,
  sessions_path: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired,
  csrf_param: PropTypes.string.isRequired,
  source_name: PropTypes.string.isRequired,
  session_translation: PropTypes.object.isRequired
}
