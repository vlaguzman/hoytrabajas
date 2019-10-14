/**
 * App Header
 */
import React from 'react'
import MatButton from '@material-ui/core/Button'
import IconButton from '@material-ui/core/IconButton'
import Typography from '@material-ui/core/Typography'
import AppBar from '@material-ui/core/AppBar'
import Toolbar from '@material-ui/core/Toolbar'
import Menu from '@material-ui/icons/Menu'
import Visibility from '@material-ui/icons/Visibility'
import MailOutline from '@material-ui/icons/MailOutline'
import Lock from '@material-ui/icons/Lock'
import Fab from '@material-ui/core/Fab'
import { Row, Col, Form, FormGroup, Label, Input } from 'reactstrap'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import Dialog from '@material-ui/core/Dialog'
import DialogActions from '@material-ui/core/DialogActions'
import DialogContent from '@material-ui/core/DialogContent'
import DialogContentText from '@material-ui/core/DialogContentText'
import DialogTitle from '@material-ui/core/DialogTitle'
import Divider from '@material-ui/core/Divider'
import dialogState from '../../hooks/dialogState'
import { fields1 } from './data'
import FormGen from '../inlineFormgenerartor'

const Header = ({ scrollState, csrf_param, csrf_token, user_signed_in, log_out_user }) => {
  console.log("estoy serrando sesion", `${log_out_user}`)
  console.log("hola, estoy en el header", user_signed_in)
  const [open, setOpen] = React.useState(false)
  const [loginState, setloginState] = React.useState(true)
  const [fullWidth, setFullWidth] = React.useState(true)
  const [maxWidth, setMaxWidth] = React.useState('sm')

  function handleClickOpen() {
    setOpen(true)
  }

  function handleClose() {
    setOpen(false)
  }
  function toggleLoginState() {
    setloginState(!loginState)
  }

  const { value: state, toggleState } = dialogState({ open: false })

  return (
    <AppBar
      position="static"
      className={`rct-header ${scrollState && 'bg-header'}`}
    >
      <div
        className={` w-100 p-0 m-0 ${scrollState && 'MuiPaper-elevation10'}`}
      >
        <Toolbar
          disableGutters
          className="d-flex justify-content-start w-100 px-20 pb-0"
          color="primary"
        >
          <div className="d-flex align-items-center">
            <div className="site-logo">
              <a href="/" className="logo-mini">
                <img
                  src={
                    !scrollState
                      ? '/assets/static/img/appLogoW.svg'
                      : '/assets/static/img/appLogoC.svg'
                  }
                  className="mr-15 logo animated fadeIn"
                  alt="site logo"
                  height="100%"
                />
              </a>
            </div>
          </div>
          <Form
            className={`search-width-container d-none d-lg-flex header-bar  mt-10 ${scrollState &&
              'show'}`}
            inline
          >
            <FormGroup className="search-width">
              <Label for="exampleEmail" hidden>
                Buscar ofertas
              </Label>
              <Input
                style={{ width: '98%' }}
                type="email"
                name="email"
                id="exampleEmail"
                placeholder="Buscar ofertas"
              />
            </FormGroup>{' '}
            <Fab
              size="small"
              style={{ marginTop: '1%' }}
              className="mb-10 ml-10 text-white"
              color="primary"
            >
              <FontAwesomeIcon icon="search" size="sm" />
            </Fab>
          </Form>
          <ul className="navbar-right list-inline mb-0 ml-auto">
            <li className="list-inline-item responsive">
              <IconButton aria-label="menu" className="mt-5">
                <Menu style={{ color: !scrollState ? 'white' : 'black' }} />
              </IconButton>
            </li>
            <li className="list-inline-item no-responsive">
              <MatButton
                style={{ color: !scrollState ? 'white' : 'black' }}
                href="/"
              >
                Inicio
              </MatButton>
            </li>
            {/* TODO: With "Candidato" and "Empleador", to press button redirect me a static landing page.
          We must take into account to make the change in redirection */}
            <li className="list-inline-item no-responsive">
              <MatButton
                style={{ color: !scrollState ? 'white' : 'black' }}
                href="/users/sign_up"
              >
                Candidato
              </MatButton>
            </li>
            <li className="list-inline-item no-responsive">
              <MatButton
                style={{ color: !scrollState ? 'white' : 'black' }}
                href="/companies/sign_up"
              >
                Empleador
              </MatButton>
            </li>
            <li className="list-inline-item no-responsive">
              {/* {!isAuthenticated ? ( */}
              {/* TODO:only login with the user_path */}
              {!user_signed_in && (
              <MatButton
                style={{ color: !scrollState ? 'white' : 'black' }}
                onClick={handleClickOpen}
              >
                Login
              </MatButton>)}
              {user_signed_in && (
              <MatButton
                style={{ color: !scrollState ? 'white' : 'black' }}
                href={log_out_user}
              >
                Log Out
              </MatButton>)}
	     
              {/* ) : (
              <MatButton style={{color: !scrollState ? 'white': 'black'}} onClick={() => logout()}>Logout</MatButton>
            )} */}
            </li>
            {/* ******************** */}
            {/* ******************** */}
            {/* LOGIN */}
            {/* ******************** */}
            {/* ******************** */}

            <Dialog
              fullWidth
              maxWidth="xs"
              open={open}
              onClose={handleClose}
              aria-labelledby="max-width-dialog-title"
            >
              <DialogTitle id="max-width-dialog-title" className="my-25">
                <Row noGutters className="justify-content-center">
                  <img
                    src="/assets/static/img/appLogoC.svg"
                    className="mr-15  animated fadeIn"
                    alt="site logo"
                    width="50%"
                  />
                </Row>
              </DialogTitle>
              <DialogContent className="px-40">
                <DialogContentText>
                  <Typography variant="body2" component="span">
                    Lorem ipsum dolor sit amet, consectetur adipi.
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
                      placeholder="Correo Electronico"
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
                      placeholder="Contraseña"
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
                  {loginState && (
                    <Typography
                      variant="caption"
                      style={{ color: '#00CED5' }}
                      href="users/password/new"
                    >
                      ¿Olvidó su contraseña?
                    </Typography>
                  )}
                  <Row noGutters className="justify-content-center my-25">
                    <Col xs={12}>
                      <MatButton
                        type="submit"
                        className="text-white"
                        color="primary"
                        variant="contained"
                      >
                        {loginState ? 'Iniciar Sesión' : 'Registrarse'}
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
                    <MatButton variant="outlined">
                      conectarse con Google
                    </MatButton>
                  </Col>
                  <Col xs={12}>
                    <MatButton variant="outlined">
                      conectarse con Facebook
                    </MatButton>
                  </Col>
                </Row>
              </DialogContent>
              <DialogActions className="">
                <div className="w-100 text-center">
                  <Typography variant="caption" component="span">
                    {loginState ? 'No tienes una cuenta' : '¿Ya tienes cuenta?'}
                  </Typography>
                  <Typography
                    onClick={toggleLoginState}
                    variant="caption"
                    className="ml-5"
                    component="span"
                    style={{ color: '#00CED5', cursor: 'pointer' }}
                  >
                    {loginState ? 'Registrate' : 'Iniciar session'}
                  </Typography>
                </div>
              </DialogActions>
            </Dialog>
            {/* ******************** */}
            {/* ******************** */}
            {/* ******************** */}
            {/* ******************** */}
            <li className="list-inline-item no-responsive">
              {/* TODO:Temporaly registration with rout por users */}
              {
                <MatButton
                  style={{ color: !scrollState ? 'white' : 'black' }}
                  href="/users/sign_up"
                >
                  Registrarse
                </MatButton>
              }
            </li>
          </ul>
        </Toolbar>
        <Row
          className={`d-none d-lg-flex justify-content-around px-20 py-0 header-bar ${scrollState &&
            'show'}`}
        >
          <Col xs={12} md={1} className="pt-rem p-0 align-items-center">
            <Typography
              onClick={toggleState}
              variant="body2"
              className="text-primary text-center"
            >
              Categorias
            </Typography>
          </Col>
          <FormGen fields={fields1} />
          <Col
            xs={12}
            md={2}
            className="pt-rem p-0 align-items-center text-center"
          >
            <Typography variant="caption" className="text-primary">
              <FontAwesomeIcon
                className="ml-auto text-primary mr-10"
                icon={['fas', 'list']}
                size="sm"
              />
              Búsqueda avanzada
            </Typography>
          </Col>
          <Col xs={12} md={2} className="pt-rem align-items-center px-20">
            <MatButton
              type="button"
              color="primary"
              variant="contained"
              style={{ borderRadius: '20px' }}
              onClick={toggleState}
              className="text-white h-50"
            >
              <Typography variant="caption">Prueba Premiun</Typography>
            </MatButton>
          </Col>
        </Row>
      </div>
    </AppBar>
  )
}

export default Header
