import React, { useState } from 'react'
import PropTypes from 'prop-types'
import { makeStyles } from '@material-ui/core/styles'
import MatButton from '@material-ui/core/Button'
import IconButton from '@material-ui/core/IconButton'
import MenuIcon from '@material-ui/icons/Menu'
import Fab from '@material-ui/core/Fab'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import Typography from '@material-ui/core/Typography'
import {
  Row,
  Col,
  Form,
  FormGroup,
  Label,
  Input,
  Collapse,
  Navbar,
  NavbarToggler,
  NavbarBrand,
  NavItem
} from 'reactstrap'
import Login from '../Login'
import { fields1 } from './data'
import FormGen from '../inlineFormgenerartor'

const useStyles = makeStyles(theme => ({
  nav: {
    position: 'fixed',
    backgroundColor: 'transparent',
    zIndex: '999 !important',
    transition: 'all 500ms ease-in-out',
    color: 'white',
    top: 0,
    width: '100%',
    padding: '0 5%',
    flexDirection: 'column'
  },
  wrapper: {
    width: '100%',
    display: 'flex',
    flexFlow: 'row nowrap',
    justifyContent: 'flex-start',
    [theme.breakpoints.down('md')]: {
      paddingLeft: '20px',
      paddingRight: '20px',
      flexWrap: 'wrap',
      alignItems: 'center',
      justifyContent: 'space-between'
    }
  },
  searchBar: {
    margin: 0
  },
  searchForm: {
    flexGrow: 1,
    [theme.breakpoints.down('md')]: {
      justifyContent: 'space-around'
    }
  },
  navItemWrapper: {
    [theme.breakpoints.down('md')]: {
      margin: '20px 0'
    }
  },
  navItemButton: {
    [theme.breakpoints.down('md')]: {
      width: '100%'
    }
  }
}))

const Header = props => {
  const {
    isScrollTop = true,
    shouldChangeColorOfNav = false,
    csrf_param,
    csrf_token,
    user_signed_in,
    company_signed_in,
    log_out_user,
    log_out_companies,
    session_translation
  } = props

  const classes = useStyles()

  const [openState, setOpenState] = useState({
    login: false,
    navbar: false,
    categories: false,
    advancedSearch: false
  })

  const toggleOpenState = (name, newValue = null) =>
    setOpenState(prevState => ({
      ...prevState,
      [name]: newValue || !openState[name]
    }))

  return (
    <Navbar
      position="static"
      className={`${classes.nav} navbar-expand-lg ${(!shouldChangeColorOfNav ||
        !isScrollTop) &&
        'bg-header'}`}
      style={{
        backgroundColor:
          !shouldChangeColorOfNav || !isScrollTop ? 'white' : 'none'
      }}
    >
      <div className={classes.wrapper}>
        <div className="d-flex align-items-center">
          <div className="site-logo">
            <NavbarBrand href="/" className="logo-mini mr-auto">
              <img
                src={
                  shouldChangeColorOfNav && isScrollTop
                    ? '/assets/static/img/appLogoW.svg'
                    : '/assets/static/img/appLogoC.svg'
                }
                className="mr-15 logo animated fadeIn"
                alt="site logo"
                height="100%"
              />
            </NavbarBrand>
          </div>
        </div>
        <NavbarToggler
          onClick={() => toggleOpenState('navbar')}
          className="mt-5"
          id="navbar-toggler"
        >
          <MenuIcon
            color={shouldChangeColorOfNav && isScrollTop ? 'white' : 'primary'}
          />
        </NavbarToggler>
        <Collapse isOpen={openState.navbar} navbar id="navbarNav">
          <Form
            className={`d-flex header-bar  mt-10 ${(!shouldChangeColorOfNav ||
              !isScrollTop) &&
              'show'} ${classes.searchForm}`}
            inline
          >
            <FormGroup className={`search-width ${classes.searchBar}`}>
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
            </FormGroup>
            <Fab
              size="small"
              style={{ marginTop: '1%' }}
              className="mb-10 ml-10 text-white"
              color="primary"
            >
              <FontAwesomeIcon icon="search" size="sm" />
            </Fab>
          </Form>
          <ul className={`navbar-nav ${classes.navItemWrapper}`}>
            <NavItem className="list-inline-item">
              <MatButton
                className={classes.navItemButton}
                style={{
                  color:
                    shouldChangeColorOfNav && isScrollTop ? 'white' : 'black'
                }}
                href="/"
              >
                INICIO
              </MatButton>
            </NavItem>
            {/* TODO: With "Candidato" and "Empleador", to press button redirect me a static landing page.
            We must take into account to make the change in redirection */}
            {user_signed_in || company_signed_in ? (
              <NavItem className="list-inline-item">
                <MatButton
                  className={classes.navItemButton}
                  style={{
                    color:
                      shouldChangeColorOfNav && isScrollTop ? 'white' : 'black'
                  }}
                >
                  MI PERFIL
                </MatButton>
              </NavItem>
            ) : (
              <>
                <NavItem className="list-inline-item">
                  <MatButton
                    className={classes.navItemButton}
                    style={{
                      color:
                        shouldChangeColorOfNav && isScrollTop
                          ? 'white'
                          : 'black'
                    }}
                    onClick={() => toggleOpenState('login')}
                  >
                    SIGN IN CANDIDATO
                  </MatButton>
                </NavItem>
                <NavItem className="list-inline-item">
                  <MatButton
                    className={classes.navItemButton}
                    style={{
                      color:
                        shouldChangeColorOfNav && isScrollTop
                          ? 'white'
                          : 'black'
                    }}
                    href="/companies/sign_in"
                  >
                    SIGN IN EMPRESA
                  </MatButton>
                </NavItem>
              </>
            )}
            {(user_signed_in || company_signed_in) && (
              <NavItem className="list-inline-item">
                <MatButton
                  className={classes.navItemButton}
                  style={{
                    color:
                      shouldChangeColorOfNav && isScrollTop ? 'white' : 'black'
                  }}
                >
                  {(user_signed_in && 'BUSCAR OFERTAS') ||
                    (company_signed_in && 'PUBLICAR OFERTAS')}
                </MatButton>
              </NavItem>
            )}
            {(user_signed_in || company_signed_in) && (
              <NavItem className="list-inline-item">
                <MatButton
                  className={classes.navItemButton}
                  style={{
                    color:
                      shouldChangeColorOfNav && isScrollTop ? 'white' : 'black'
                  }}
                >
                  VER MI TABLERO
                </MatButton>
              </NavItem>
            )}
            {!user_signed_in && !company_signed_in ? (
              <>
                <NavItem className="list-inline-item">
                  <MatButton
                    className={classes.navItemButton}
                    style={{
                      color:
                        shouldChangeColorOfNav && isScrollTop
                          ? 'white'
                          : 'black'
                    }}
                    href="/users/sign_up"
                  >
                    SIGN UP CANDIDATO
                  </MatButton>
                </NavItem>
                <NavItem className="list-inline-item">
                  <MatButton
                    className={classes.navItemButton}
                    style={{
                      color:
                        shouldChangeColorOfNav && isScrollTop
                          ? 'white'
                          : 'black'
                    }}
                    href="/companies/sign_up"
                  >
                    SIGN UP EMPRESA
                  </MatButton>
                </NavItem>
              </>
            ) : (
              <>
                <NavItem className="list-inline-item">
                  <MatButton
                    className={classes.navItemButton}
                    href={user_signed_in ? log_out_user : log_out_companies}
                    style={{
                      color:
                        shouldChangeColorOfNav && isScrollTop
                          ? 'white'
                          : 'black'
                    }}
                    onClick={() => toggleOpenState('login')}
                  >
                    CERRAR SESIÓN
                  </MatButton>
                </NavItem>
              </>
            )}
          </ul>
        </Collapse>
      </div>
      <div
        className={`${classes.wrapper} ${shouldChangeColorOfNav &&
          isScrollTop &&
          'd-none'}`}
      >
        <Row
          className={`d-none d-lg-flex w-100 m-0 justify-content-around p-0 header-bar ${(!shouldChangeColorOfNav ||
            !isScrollTop) &&
            'show'}`}
        >
          <Col xs={12} md={1} className="pt-rem p-0 align-items-center">
            <Typography
              onClick={() => toggleOpenState('categories')}
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
              onClick={() => toggleOpenState('advancedSearch')}
              className="text-white h-50"
            >
              <Typography variant="caption">Prueba Premium</Typography>
            </MatButton>
          </Col>
        </Row>
        <Login
          {...props}
          isOpen={openState.login}
          toggleOpenState={toggleOpenState}
        />
      </div>
    </Navbar>
  )
}
export default Header

Header.propTypes = {
  log_out_companies: PropTypes.string.isRequired,
  company_signed_in: PropTypes.bool.isRequired,
  user_signed_in: PropTypes.bool.isRequired,
  log_out_user: PropTypes.string.isRequired,
  csrf_param: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired,
  session_translation: PropTypes.object.isRequired,
  shouldChangeColorOfNav: PropTypes.bool,
  isScrollTop: PropTypes.bool
}
