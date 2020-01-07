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
    log_out_companies,
    profile_path
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

  const LoggedInNav = () => (
    <>
      <NavItem className="list-inline-item a-navItem">
        <a href="/">{props.session_translation.nav.home}</a>
      </NavItem>
      <NavItem className="list-inline-item a-navItem">
        <a href={pathToDashboard}>{props.session_translation.nav.dashboard}</a>
      </NavItem>
      {<NavItem className="list-inline-item a-navItem">
        <a href={profile_path}>{props.session_translation.nav.profile}</a>
      </NavItem>}
      <NavItem className="list-inline-item a-navItem">
        <a href={user_signed_in ? log_out_user : log_out_companies}>
          {props.session_translation.nav.sign_out}
        </a>
      </NavItem>
      {/* TODO any: replace code below with commented one when premium page is ready */}
      {company_signed_in && (
        <NavItem className="list-inline-item a-navItem__button">
          <a
            href={pathToCreateOffer}
            className="a-button a-button--primary d-flex align-items-center"
          >
            <AddCircleIcon className="text-white mr-5" />
            {props.session_translation.nav.create_offer}
          </a>
        </NavItem>
      )}
      {/* TODO any: uncomment when premium page is ready */}
      {/* {user_signed_in ? (
        <NavItem className="list-inline-item a-navItem__button">
          <a className="a-button a-button--primary d-flex align-items-center">
            <StarsIcon className="text-white mr-5" />
            {props.session_translation.nav.premium}
          </a>
        </NavItem>
      ) : (
        <NavItem className="list-inline-item a-navItem__button">
          <a
            href={pathToCreateOffer}
            className="a-button a-button--primary d-flex align-items-center"
          >
            <AddCircleIcon className="text-white mr-5" />
            {props.session_translation.nav.create_offer}
          </a>
        </NavItem>
      )} */}
    </>
  )

  const LoggedOutNav = () => (
    <>
      <NavItem className="list-inline-item a-navItem">
        <a href="/">{props.session_translation.nav.home}</a>
      </NavItem>
      <NavItem className="list-inline-item a-navItem">
        <a href={pathToOffers}>{props.session_translation.nav.i_need_job}</a>
      </NavItem>
      {/* TODO any: uncomment when companies landing page is ready */}
      {/* <NavItem className="list-inline-item a-navItem">
        <a href="/">{props.session_translation.nav.i_offer_job}</a>
      </NavItem> */}
      <NavItem className="list-inline-item a-navItem">
        <button
          type="button"
          className="default a-navOpenLogin"
          onClick={() => handleOpenModal('sign_in')}
        >
          {props.session_translation.nav.sign_in}
        </button>
      </NavItem>
      <NavItem className="list-inline-item a-navItem">
        <button
          type="button"
          className="default a-navOpenSignUp"
          onClick={() => handleOpenModal('sign_up')}
        >
          {props.session_translation.nav.sign_up}
        </button>
      </NavItem>
    </>
  )

  return (
    <>
      <Navbar
        position="static"
        className={`navbar-wrapper navbar-expand-lg ${
          !isNavTransparent ? 'bg-header' : ''
        }`}
        style={{
          backgroundColor: isNavTransparent ? 'transparent' : 'white'
        }}
      >
        <div className="navbar-row mt-10 mui-fixed">
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
              </Form>
            )}
            <ul className="navbar-nav align-items-center m-navItems navbar-item-wrapper">
              {user_signed_in || company_signed_in ? (
                <LoggedInNav />
              ) : (
                <LoggedOutNav />
              )}
            </ul>
          </Collapse>
        </div>
        <Login
          {...props}
          currentModal={currentModal}
          setCurrentModal={setCurrentModal}
          isOpen={openState.login}
          toggleOpenState={toggleOpenState}
        />
      </Navbar>
      <div className="pt-60" />
    </>
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
