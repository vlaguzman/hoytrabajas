import React from 'react'
import PropTypes from 'prop-types'
import MatButton from '@material-ui/core/Button'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import Dialog from '@material-ui/core/Dialog'
import DialogTitle from '@material-ui/core/DialogTitle'
import DialogContent from '@material-ui/core/DialogContent'
import DialogContentText from '@material-ui/core/DialogContentText'
import MailOutline from '@material-ui/icons/MailOutline'
import Lock from '@material-ui/icons/Lock'
import Divider from '@material-ui/core/Divider'
import AppLayout from '../../../../src/components/Layout/AppLayout'

export default class Index extends React.Component {
  constructor(props) {
    super(props)
    this.state = { open: true }
    this.props = props
  }

  render() {
    const resource_name = this.props.source_name
    return (
      <div className="main-wrapper">
        <AppLayout
          user_signed_in={this.props.user_signed_in}
          company_signed_in={this.props.company_signed_in}
          log_out_user={this.props.log_out_user}
          log_out_companies={this.props.log_out_companies}
          t={this.props.t}
        >
          <Dialog
            fullWidth
            maxWidth="xs"
            open={this.state.open}
            aria-labelledby="max-width-dialog-title"
          >
            <DialogTitle id="max-width-dialog-title" className="my-25">
              <Row noGutters className="justify-content-center">
                <img
                  src="/assets/static/img/appLogoC.svg"
                  className="mr-15 animeted fadeIn"
                  alt="site logo"
                  width="50%"
                />
              </Row>
            </DialogTitle>
            <DialogContent className="px-40">
              <DialogContentText>
                <Typography variant="body2" component="span">
                  {this.props.t.sign_up.title}
                </Typography>
              </DialogContentText>
              <form
                id={`new_${resource_name}`}
                className={`new_${resource_name}`}
                action={this.props.registration_path}
                acceptCharset="UFT-8"
                method="post"
              >
                <input
                  type="hidden"
                  name={this.props.csrf_param}
                  value={this.props.csrf_token}
                />
                <div className="mb-2 mr-sm-2 mb-sm-0 position-relative">
                  <input
                    name={`${resource_name}[email]`}
                    id={`${resource_name}_email`}
                    className="pl-40 py-10 form-control"
                    autoComplete="email"
                    placeholder={this.props.t.sign_up.email_label}
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
                    placeholder={this.props.t.sign_up.password_label}
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
                    name={`${resource_name}[password_confirmation]`}
                    id={`${resource_name}_password_confirmation`}
                    className="pl-40 py-10 form-control"
                    placeholder={this.props.t.sign_up.pass_confirm_label}
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
                      {this.props.t.sign_up.button_action.sign_up_label}
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
                  <MatButton variant="outlined">
                    {this.props.t.sign_up.button_action.sign_up_facebook}
                  </MatButton>
                </Col>
              </Row>
              <Row className="my-30">
                <Col xs={12}>
                  <MatButton variant="outlined">{this.props.t.sign_up.button_action.sign_up_google}</MatButton>
                </Col>
              </Row>
            </DialogContent>
          </Dialog>
        </AppLayout>
      </div>
    )
  }
}

Index.propTypes = {
  csrf_token: PropTypes.string.isRequired,
  csrf_param: PropTypes.string.isRequired,
  source_name: PropTypes.string.isRequired,
  registration_path: PropTypes.string.isRequired,
  t: PropTypes.object.isRequired
}
