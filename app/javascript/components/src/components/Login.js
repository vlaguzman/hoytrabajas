import React from 'react'
import PropTypes from 'prop-types'
import MatButton from '@material-ui/core/Button'
import Dialog from '@material-ui/core/Dialog'
import DialogActions from '@material-ui/core/DialogActions'
import DialogContent from '@material-ui/core/DialogContent'
import DialogContentText from '@material-ui/core/DialogContentText'
import DialogTitle from '@material-ui/core/DialogTitle'
import Divider from '@material-ui/core/Divider'
import Typography from '@material-ui/core/Typography'
import MailOutline from '@material-ui/icons/MailOutline'
import Visibility from '@material-ui/icons/Visibility'
import Lock from '@material-ui/icons/Lock'
import { Row, Col, Form, FormGroup, Input } from 'reactstrap'

const Login = ({
  isOpen,
  toggleOpenState,
  session_translation,
  user_facebook_omniauth_authorize_path,
  csrf_param,
  csrf_token
}) => (
  <Dialog
    fullWidth
    maxWidth="xs"
    open={isOpen}
    onClose={() => toggleOpenState('login', false)}
    aria-labelledby="max-width-dialog-title"
  >
    <DialogTitle id="max-width-dialog-title" className="my-25">
      <Row noGutters className="justify-content-center">
        <a className="ht-image" href="/">
          <img
            src="/assets/static/img/appLogoC.svg"
            className="mr-15  animated fadeIn"
            alt="site logo"
          />
        </a>
      </Row>
    </DialogTitle>
    <DialogContent className="px-40">
      <DialogContentText>
        <Typography variant="body2" component="span">
          {session_translation.sign_in.title}
        </Typography>
      </DialogContentText>
      <Form
        id="new_user"
        className="new_user"
        action="/users/sign_in"
        accept-charset="UFT-8"
        method="post"
      >
        <Input type="hidden" name={csrf_param} value={csrf_token} />
        <FormGroup className="mb-2 mr-sm-2 mb-sm-0 position-relative">
          <Input
            id="user_email"
            autofocus="autofocus"
            autocomplete="email"
            className="pl-40 py-10"
            type="email"
            name="user[email]"
            placeholder={session_translation.sign_in.email_label}
          />
          <MailOutline
            className="position-absolute"
            style={{
              color: 'lightgrey',
              top: '0.75rem',
              left: '.5rem'
            }}
          />
        </FormGroup>
        <FormGroup className="mb-2 mr-sm-2 mb-sm-0 position-relative">
          <Input
            id="user_password"
            autocomplete="current-password"
            className="pl-40 py-10"
            type="password"
            name="user[password]"
            placeholder={session_translation.sign_in.password_label}
          />
          <Visibility
            className="position-absolute"
            style={{
              color: '#00CED5',
              top: '0.75rem',
              right: '1rem'
            }}
          />
          <Lock
            className="position-absolute"
            style={{
              color: 'lightgrey',
              top: '0.75rem',
              left: '.5rem'
            }}
          />
        </FormGroup>
        <Typography
          component="a"
          variant="caption"
          style={{ color: '#00CED5' }}
          href="users/password/new"
        >
          {session_translation.sign_in.forget_password}
        </Typography>
        <Row noGutters className="justify-content-center my-25">
          <Col xs={12}>
            <MatButton
              type="submit"
              className="text-white"
              color="primary"
              variant="contained"
            >
              {session_translation.sign_in.button_action.sign_in_label}
            </MatButton>
          </Col>
        </Row>
      </Form>
      <Row className="justify-content-center align-items-center">
        <Divider variant="middle" className="mx-10 w-40" />
        <span style={{ color: 'lightgrey' }}>o</span>
        <Divider variant="middle" className="mx-10 w-40" />
      </Row>
      <Row className="my-30">
        <Col xs={12} className="mb-10">
          <MatButton variant="outlined" href={user_facebook_omniauth_authorize_path}>
            {session_translation.sign_in.button_action.sign_in_facebook}
          </MatButton>
        </Col>
        <Col xs={12}>
          <MatButton variant="outlined">
            {session_translation.sign_in.button_action.sign_in_google}
          </MatButton>
        </Col>
      </Row>
    </DialogContent>
    <DialogActions className="">
      <div className="w-100 text-center">
        <Typography
          variant="caption"
          component="a"
          href="users/sign_up"
          style={{ color: '#00CED5', cursor: 'pointer' }}>
          {session_translation.sign_in.no_account.title}
        </Typography>
        <Typography
          variant="caption"
          className="ml-5"
          component="a"
          href="users/sign_up"
          style={{ color: '#00CED5', cursor: 'pointer' }}
        >
          {session_translation.sign_in.no_account.sign_in}
        </Typography>
      </div>
    </DialogActions>
  </Dialog>
)

export default Login
Login.propTypes = {
  csrf_token: PropTypes.string.isRequired,
  csrf_param: PropTypes.string.isRequired,
  isOpen: PropTypes.bool.isRequired,
  toggleOpenState: PropTypes.func.isRequired,
  session_translation: PropTypes.object.isRequired
}
