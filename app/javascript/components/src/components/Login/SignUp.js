import React from 'react'
import PropTypes from 'prop-types'
import MatButton from '@material-ui/core/Button'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import DialogActions from '@material-ui/core/DialogActions'
import DialogTitle from '@material-ui/core/DialogTitle'
import DialogContent from '@material-ui/core/DialogContent'
import DialogContentText from '@material-ui/core/DialogContentText'
import MailOutline from '@material-ui/icons/MailOutline'
import Lock from '@material-ui/icons/Lock'
import Divider from '@material-ui/core/Divider'

const SignUp = props => (
  <>
    <DialogTitle id="max-width-dialog-title" className="my-25">
      <div className="px-40 text-right">
        <a className="button-close" href="/">
          X
        </a>
      </div>
      <Row noGutters className="justify-content-center">
        <a className="ht-image" href="/">
          <img
            src="/assets/static/img/appLogoC.svg"
            className="mr-15 animeted fadeIn"
            alt="site logo"
          />
        </a>
      </Row>
    </DialogTitle>
    <DialogContent className="px-40">
      <DialogContentText>
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
        <div className="mb-2 mr-sm-2 mb-sm-0 position-relative">
          <input
            name={`${props.source_name}[email]`}
            id={`${props.source_name}_email`}
            className="pl-40 py-10 form-control"
            autoComplete="email"
            placeholder={props.session_translation.sign_up.email_label}
            type="email"
          />
          <MailOutline
            className="position-absolute"
            style={{
              color: 'lightgrey',
              top: '0.75rem',
              left: '.5rem'
            }}
          />
        </div>
        <div className="mb-2 mr-sm-2 mb-sm-0 position-relative">
          <input
            name={`${props.source_name}[password]`}
            id={`${props.source_name}_password`}
            className="pl-40 py-10 form-control"
            autoComplete="new-password"
            placeholder={props.session_translation.sign_up.password_label}
            type="password"
          />
          <Lock
            className="position-absolute"
            style={{
              color: 'lightgrey',
              top: '0.75rem',
              left: '.5rem'
            }}
          />
        </div>
        <div className="mb-2 mr-sm-2 mb-sm-0 position-relative">
          <input
            name={`${props.source_name}[password_confirmation]`}
            id={`${props.source_name}_password_confirmation`}
            className="pl-40 py-10 form-control"
            placeholder={props.session_translation.sign_up.pass_confirm_label}
            type="password"
          />
          <Lock
            className="position-absolute"
            style={{
              color: 'lightgrey',
              top: '0.75rem',
              left: '.5rem'
            }}
          />
        </div>
        <Row noGutters className="justify-content-center my-25">
          <Col xs={12}>
            <MatButton
              type="submit"
              className="text-white"
              color="primary"
              variant="contained"
            >
              {props.session_translation.sign_up.button_action.sign_up_label}
            </MatButton>
          </Col>
        </Row>
      </form>
      <Row className="justify-content-center align-items-center">
        <Divider variant="middle" className="mx-10 w-40" />
        <span style={{ color: 'lightgrey' }}>o</span>
        <Divider variant="middel" className="mx-10 w-40" />
      </Row>
      <Row className="my-30">
        <Col xs={12}>
          <MatButton variant="outlined" disabled>
            {props.session_translation.sign_up.button_action.sign_up_facebook}
          </MatButton>
        </Col>
      </Row>
      <Row className="my-30">
        <Col xs={12}>
          <MatButton variant="outlined" disabled>
            {props.session_translation.sign_up.button_action.sign_up_google}
          </MatButton>
        </Col>
      </Row>
    </DialogContent>
    <DialogActions className="">
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
