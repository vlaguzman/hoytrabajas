import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import MatButton from '@material-ui/core/Button'
import MenuIcon from '@material-ui/icons/Menu'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import Typography from '@material-ui/core/Typography'
import Input from '@material-ui/core/Input'
import InputAdornment from '@material-ui/core/InputAdornment'
import IconButton from '@material-ui/core/IconButton'
import AddCircleIcon from '@material-ui/icons/AddCircle'
import StarsIcon from '@material-ui/icons/Stars'
import CloseIcon from '@material-ui/icons/Close'
import {
  Row,
  Col,
  Form,
  FormGroup,
  Label,
  Collapse,
  Navbar,
  NavbarToggler,
  NavbarBrand,
  NavItem
} from 'reactstrap'
import Login from '../Login'
import { fields1 } from './data'
import FormGen from '../inlineFormgenerartor'

const Header = props => {
  const {
    should_change_nav_color = false,
    user_signed_in,
    company_signed_in,
    log_out_user,
    log_out_companies
  } = props

  const pathTo = (to = '') => {
    if (user_signed_in) return `/users/${to}`
    if (company_signed_in) return `/companies/${to}`
    return '/'
  }

  const [isTop, setIsTop] = useState(true)

  useEffect(() => {
    const handleScroll = () => {
      const currentTop = window.scrollY < 200
      if (currentTop !== isTop) setIsTop(currentTop)
    }
    document.addEventListener('scroll', handleScroll)
    return () => {
      document.removeEventListener('scroll', handleScroll)
    }
  }, [isTop])

  const pathToProfile = pathTo('profile')
  const pathToDashboard = pathTo('dashboard')

  const pathToOffers = '/offers'
  const pathToCreateOffer = pathTo('first_offer/step_three')

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

  const [currentModal, setCurrentModal] = useState('')

  const handleOpenModal = name => {
    setCurrentModal(name)
    toggleOpenState('login')
  }

  const isNavTransparent = !openState.navbar && should_change_nav_color && isTop

  const [searchValue, setSearchValue] = useState('')

  const handleSearchChange = event => setSearchValue(event.target.value)
  const handleSearchReset = () => setSearchValue('')

  const colorOfNavToggler = () =>
    isNavTransparent
      ? {
          style: {
            color: 'white'
          }
        }
      : {
          color: 'primary'
        }

  function renderMyProfileButton() {
    if (user_signed_in)
      return (
        <NavItem className="list-inline-item">
          <MatButton
            className="navbar-item-button"
            href={pathToProfile}
            style={{
              color: isNavTransparent ? 'white' : 'black'
            }}
          >
            MI PERFIL
          </MatButton>
        </NavItem>
      )
    return false
  }

  const LoggedInNav = () => (
    <>
      <NavItem className="list-inline-item a-navItem">
        <a href="/">Inicio</a>
      </NavItem>
      <NavItem className="list-inline-item a-navItem">
        <a href={pathToDashboard}>Ver mi tablero</a>
      </NavItem>
      <NavItem className="list-inline-item a-navItem">
        <a href="/">Mi perfil</a>
      </NavItem>
      <NavItem className="list-inline-item a-navItem">
        <a href={user_signed_in ? log_out_user : log_out_companies}>
          Cerrar sesión
        </a>
      </NavItem>
      {user_signed_in ? (
        <NavItem className="list-inline-item a-navItem__button">
          <a className="a-button a-button--primary d-flex align-items-center">
            <StarsIcon className="text-white mr-5" />
            Crecer a premium
          </a>
        </NavItem>
      ) : (
        <NavItem className="list-inline-item a-navItem__button">
          <a
            href={pathToCreateOffer}
            className="a-button a-button--primary d-flex align-items-center"
          >
            <AddCircleIcon className="text-white mr-5" />
            Publicar oferta
          </a>
        </NavItem>
      )}
    </>
  )

  const LoggedOutNav = () => (
    <>
      <NavItem className="list-inline-item a-navItem">
        <a href="/">Inicio</a>
      </NavItem>
      <NavItem className="list-inline-item a-navItem">
        <a href={pathToOffers}>Busco empleo</a>
      </NavItem>
      <NavItem className="list-inline-item a-navItem">
        <a href="/">Ofrezco trabajo</a>
      </NavItem>
      <NavItem className="list-inline-item a-navItem">
        <button
          type="button"
          className="default a-navOpenLogin"
          onClick={() => handleOpenModal('sign_in')}
        >
          Ingresar
        </button>
      </NavItem>
      <NavItem className="list-inline-item a-navItem">
        <button
          type="button"
          className="default a-navOpenSignUp"
          onClick={() => handleOpenModal('sign_up')}
        >
          Registrarme
        </button>
      </NavItem>
    </>
  )

  /* TODO Oscar move the search bar to a component to have control of this */
  const FullSearchBarInNavBar = () => (
    <Row
      className={`d-none d-lg-flex w-100 m-0 justify-content-around p-0 header-bar ${(!should_change_nav_color ||
        !isTop) &&
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
      <Col xs={12} md={2} className="pt-rem p-0 align-items-center text-center">
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
  )
  return (
    <Navbar
      position="static"
      className={`navbar-wrapper navbar-expand-lg ${
        !isNavTransparent ? 'bg-header' : ''
      }`}
      style={{
        backgroundColor: isNavTransparent ? 'transparent' : 'white'
      }}
    >
      <div className="navbar-row mui-fixed">
        <div className="d-flex align-items-center">
          <div className="site-logo">
            <NavbarBrand href="/" className="logo-mini mr-auto">
              <img
                src="/assets/static/img/hoytrabajas-logo-color.png"
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
          <MenuIcon {...colorOfNavToggler()} />
        </NavbarToggler>
        {/* Search bar in white nav bar */}
        <Collapse isOpen={openState.navbar} navbar id="navbarNav">
          {!isNavTransparent && (
            <Form
              className="d-flex search-bar-wrapper navbar-search-form"
              action="/offers/"
              method="get"
              inline
            >
              <FormGroup className="search-bar">
                <Label for="title_cont" hidden>
                  Buscar ofertas
                </Label>
                <Input
                  name="q[title_cont]"
                  id="q[title_cont]"
                  type="text"
                  className="searchBar__input"
                  value={searchValue}
                  placeholder="Palabra clave"
                  onChange={handleSearchChange}
                  endAdornment={
                    <InputAdornment position="end">
                      <div className="d-flex">
                        {searchValue ? (
                          <IconButton
                            className="mr-5"
                            aria-label="Reset search"
                            onClick={handleSearchReset}
                          >
                            <CloseIcon
                              {...props}
                              style={{ cursor: 'pointer' }}
                              className="searchBar--resetIcon"
                              focusable
                            />
                          </IconButton>
                        ) : null}
                        <IconButton
                          className="searchBar__searchIcon"
                          aria-label="Search"
                          type="submit"
                        >
                          <FontAwesomeIcon icon="search" size="sm" />
                        </IconButton>
                      </div>
                    </InputAdornment>
                  }
                  aria-describedby="standard-weight-helper-text"
                  inputProps={{
                    'aria-label': 'weight'
                  }}
                />
              </FormGroup>
              {/* <Fab
                id="searchbar_submit_button"
                type="submit"
                size="small"
                style={{ marginTop: '1%' }}
                className="mb-10 ml-10 text-white"
                color="primary"
              >
                <FontAwesomeIcon icon="search" size="sm" />
              </Fab> */}
            </Form>
          )}
          <ul className="navbar-nav align-items-center m-navItems navbar-item-wrapper">
            {user_signed_in || company_signed_in ? (
              <LoggedInNav />
            ) : (
              <LoggedOutNav />
            )}
            {/* <NavItem className="list-inline-item">
              <MatButton
                className="navbar-item-button"
                style={{
                  color: isNavTransparent ? 'white' : 'black'
                }}
                href="/"
              >
                INICIO
              </MatButton>
            </NavItem>
            {user_signed_in || company_signed_in ? (
              renderMyProfileButton()
            ) : (
              <>
                <NavItem className="list-inline-item">
                  <MatButton
                    id="nav_sign_in_candidate"
                    className="navbar-item-button"
                    style={{
                      color: isNavTransparent ? 'white' : 'black'
                    }}
                    onClick={() => handleOpenModal('users_sign_in')}
                  >
                    SIGN IN CANDIDATO
                  </MatButton>
                </NavItem>
                <NavItem className="list-inline-item">
                  <MatButton
                    className="navbar-item-button"
                    style={{
                      color: isNavTransparent ? 'white' : 'black'
                    }}
                    onClick={() => handleOpenModal('companies_sign_in')}
                  >
                    SIGN IN EMPRESA
                  </MatButton>
                </NavItem>
              </>
            )}
            {(user_signed_in || company_signed_in) && (
              <NavItem className="list-inline-item">
                <MatButton
                  className="navbar-item-button"
                  href={user_signed_in ? pathToOffers : pathToCreateOffer}
                  style={{
                    color: isNavTransparent ? 'white' : 'black'
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
                  href={pathToDashboard}
                  className="navbar-item-button"
                  style={{
                    color: isNavTransparent ? 'white' : 'black'
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
                    className="navbar-item-button"
                    style={{
                      color: isNavTransparent ? 'white' : 'black'
                    }}
                    onClick={() => handleOpenModal('users_sign_up')}
                  >
                    SIGN UP CANDIDATO
                  </MatButton>
                </NavItem>
                <NavItem className="list-inline-item">
                  <MatButton
                    className="navbar-item-button"
                    style={{
                      color: isNavTransparent ? 'white' : 'black'
                    }}
                    onClick={() => handleOpenModal('companies_sign_up')}
                  >
                    SIGN UP EMPRESA
                  </MatButton>
                </NavItem>
              </>
            ) : (
              <>
                <NavItem className="list-inline-item">
                  <MatButton
                    className="navbar-item-button"
                    href={user_signed_in ? log_out_user : log_out_companies}
                    style={{
                      color: isNavTransparent ? 'white' : 'black'
                    }}
                  >
                    CERRAR SESIÓN
                  </MatButton>
                </NavItem>
              </>
            )} */}
          </ul>
        </Collapse>
      </div>
      {/* TODO uncomment when advance search is ready */}
      {/* <div
        className={`navbar-row ${should_change_nav_color && isTop && 'd-none'}`}
      >
        <FullSearchBarInNavBar/> 
      </div> */}
      <Login
        {...props}
        currentModal={currentModal}
        setCurrentModal={setCurrentModal}
        isOpen={openState.login}
        toggleOpenState={toggleOpenState}
      />
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
  should_change_nav_color: PropTypes.bool,
  isTop: PropTypes.bool,
  user_facebook_omniauth_authorize_path: PropTypes.string
}
