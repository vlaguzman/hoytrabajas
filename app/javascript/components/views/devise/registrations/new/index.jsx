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
        <AppLayout>
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
                  Regístrate ahora
                </Typography>
              </DialogContentText>
              <form
                id="new_user"
                className="new_user"
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
                    placeholder="Correo electronico"
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
                    placeholder="Contraseña"
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
                    placeholder="Confirma tu contraseña"
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
                      Regístrarme
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
                    Continuar con Facebook
                  </MatButton>
                </Col>
              </Row>
              <Row className="my-30">
                <Col xs={12}>
                  <MatButton variant="outlined">Continuar con Google</MatButton>
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
  registration_path: PropTypes.string.isRequired
}
