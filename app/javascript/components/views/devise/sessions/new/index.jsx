import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import MatButton from '@material-ui/core/Button'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import Dialog from '@material-ui/core/Dialog'
import DialogActions from '@material-ui/core/DialogActions'
import DialogTitle from '@material-ui/core/DialogTitle'
import DialogContent from '@material-ui/core/DialogContent'
import DialogContentText from '@material-ui/core/DialogContentText'
import MailOutline from '@material-ui/icons/MailOutline'
import Lock from '@material-ui/icons/Lock'
import Divider from '@material-ui/core/Divider'
import AppLayout from '../../../../src/components/Layout/AppLayout'

const Index = props => {
  const [open] = useState(true)

  const resource_name = props.source_name

  return (
    <div className="main-wrapper">
      <AppLayout
        user_signed_in={props.user_signed_in}
        company_signed_in={props.company_signed_in}
        log_out_user={props.log_out_user}
        log_out_companies={props.log_out_companies}
        session_translation={props.session_translation}
      >
        <Dialog
          fullWidth
          maxWidth="xs"
          open={open}
          aria-labelledby="max-width-dialog-title"
        >
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
                {props.session_translation.sign_in.title}
              </Typography>
            </DialogContentText>
            <form
              id={`new_${resource_name}`}
              className={`new_${resource_name}`}
              action={props.sessions_path}
              acceptCharset="UFT-8"
              method="post"
            >
              <input
                type="hidden"
                name={props.csrf_param}
                value={props.csrf_token}
              />
              <div className="mb-2 mr-sm-2 mb-sm-0 position-relative">
                <input
                  name={`${resource_name}[email]`}
                  id={`${resource_name}_email`}
                  className="pl-40 py-10 form-control"
                  autoComplete="email"
                  placeholder={props.session_translation.sign_in.email_label}
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
                  name={`${resource_name}[password]`}
                  id={`${resource_name}_password`}
                  className="pl-40 py-10 form-control"
                  autoComplete="new-password"
                  placeholder={props.session_translation.sign_in.password_label}
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
              <Typography
                component="a"
                variant="caption"
                style={{ color: 'robin-blue' }}
                href={`/${
                  resource_name === 'user' ? 'users' : 'companies'
                }/password/new`}
              >
                {props.session_translation.sign_in.forget_password}
              </Typography>
              <Row noGutters className="justify-content-center my-25">
                <Col xs={12}>
                  <MatButton
                    type="submit"
                    className="text-white"
                    color="primary"
                    variant="contained"
                  >
                    {
                      props.session_translation.sign_in.button_action
                        .sign_in_label
                    }
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
                  {
                    props.session_translation.sign_in.button_action
                      .sign_in_facebook
                  }
                </MatButton>
              </Col>
            </Row>
            <Row className="my-30">
              <Col xs={12}>
                <MatButton variant="outlined" disabled>
                  {
                    props.session_translation.sign_in.button_action
                      .sign_in_google
                  }
                </MatButton>
              </Col>
            </Row>
          </DialogContent>
          <DialogActions className="">
            <div className="w-100 text-center">
              <Typography variant="caption" component="span">
                {props.session_translation.sign_in.no_account.title}
              </Typography>
              <Typography
                variant="caption"
                className="ml-5"
                component="a"
                style={{ color: '#00CED5', cursor: 'pointer' }}
                href={`/${
                  resource_name === 'user' ? 'users' : 'companies'
                }/sign_up`}
              >
                {props.session_translation.sign_in.no_account.sign_up}
              </Typography>
            </div>
          </DialogActions>
          <DialogActions className="">
            <div className="w-100 text-center">
              <Typography
                component="a"
                variant="caption"
                style={{ color: 'robin-blue' }}
                href="/"
              >
                Home
              </Typography>
            </div>
          </DialogActions>
        </Dialog>
      </AppLayout>
    </div>
  )
}

export default Index

Index.propTypes = {
  csrf_token: PropTypes.string.isRequired,
  csrf_param: PropTypes.string.isRequired,
  source_name: PropTypes.string.isRequired,
  sessions_path: PropTypes.string.isRequired,
  user_signed_in: PropTypes.bool.isRequired,
  company_signed_in: PropTypes.bool.isRequired,
  log_out_companies: PropTypes.string.isRequired,
  log_out_user: PropTypes.string.isRequired,
  session_translation: PropTypes.object.isRequired
}
