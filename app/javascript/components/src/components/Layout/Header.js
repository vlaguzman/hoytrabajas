import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import MenuIcon from '@material-ui/icons/Menu'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import InputBase from '@material-ui/core/InputBase'
import InputAdornment from '@material-ui/core/InputAdornment'
import IconButton from '@material-ui/core/IconButton'
import AddCircleIcon from '@material-ui/icons/AddCircle'
import StarsIcon from '@material-ui/icons/Stars'
import CloseIcon from '@material-ui/icons/Close'
import {
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
import useWindowSize from '../../hooks/useWindowSize'
import AdvancedSearch from '../AdvancedSearch'

const Header = props => {
  const {
    should_change_nav_color = false,
    user_signed_in,
    company_signed_in,
    log_out_user,
    log_out_companies,
    profile_path
  } = props

  const windowSize = useWindowSize()

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

  const toggleOpenState = (name, bool = null) => {
    const newValue = bool !== null ? bool : !openState[name]
    setOpenState(prevState => ({
      ...prevState,
      [name]: newValue
    }))
  }

  const [currentModal, setCurrentModal] = useState('')

  const handleOpenModal = name => {
    setCurrentModal(name)
    toggleOpenState('login')
  }

  const handleOpenNav = () => {
    toggleOpenState('advancedSearch', false)
    toggleOpenState('navbar')
  }

  const isNavTransparent = !openState.navbar && should_change_nav_color && isTop

  const [searchValue, setSearchValue] = useState('')

  const handleSearchChange = event => setSearchValue(event.target.value)
  const handleSearchReset = () => setSearchValue('')

  const handleNavFocus = e => {
    if (windowSize.width <= 992) {
      toggleOpenState('navbar', false)
      toggleOpenState('advancedSearch', true)
    }
  }

  const LoggedInNav = () => (
    <>
      <NavItem className="list-inline-item a-navItem">
        <a href="/">{props.session_translation.nav.home}</a>
      </NavItem>
      <NavItem className="list-inline-item a-navItem">
        <a href={pathToDashboard}>{props.session_translation.nav.dashboard}</a>
      </NavItem>
      {user_signed_in && (
        <NavItem className="list-inline-item a-navItem">
          <a href={profile_path}>{props.session_translation.nav.profile}</a>
        </NavItem>
      )}
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
            className="a-button --primary d-flex align-items-center"
          >
            <AddCircleIcon className="text-white mr-5" />
            {props.session_translation.nav.create_offer}
          </a>
        </NavItem>
      )}
      {/* TODO any: uncomment when premium page is ready */}
      {/* {user_signed_in ? (
        <NavItem className="list-inline-item a-navItem__button">
          <a className="a-button --primary d-flex align-items-center">
            <StarsIcon className="text-white mr-5" />
            {props.session_translation.nav.premium}
          </a>
        </NavItem>
      ) : (
        <NavItem className="list-inline-item a-navItem__button">
          <a
            href={pathToCreateOffer}
            className="a-button --primary d-flex align-items-center"
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
          openState.advancedSearch ? 'navbar-advancedSearch-opened' : ''
        }`}
      >
        <div className="navbar-row mui-fixed">
          <div className="d-flex align-items-center">
            <div className="site-logo">
              <NavbarBrand href="/" className="logo-mini mr-auto">
                <img
                  src={`/assets/static/img/${
                    windowSize.width > 992
                      ? 'hoytrabajas-logo-color.svg'
                      : 'icon-hoytrabajas-logo.svg'
                  }`}
                  className="mr-15 logo animated fadeIn"
                  alt="site logo"
                  height="100%"
                />
              </NavbarBrand>
            </div>
          </div>
          <Form
            className="d-flex search-bar-wrapper navbar-search-form"
            action="/offers/"
            method="get"
            inline
          >
            <FormGroup className="search-bar">
              <Label for="title_cont" hidden>
                {
                  props.session_translation.nav.advanced_search
                    .search_offer_input
                }
              </Label>
              <InputBase
                name="q[title_cont]"
                id="q[title_cont]"
                type="text"
                className="searchBar__input"
                value={searchValue}
                placeholder="Palabra clave"
                onChange={handleSearchChange}
                onFocus={handleNavFocus}
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
          <NavbarToggler
            onClick={handleOpenNav}
            className="mt-5"
            id="navbar-toggler"
          >
            <MenuIcon />
          </NavbarToggler>
          <Collapse isOpen={openState.navbar} navbar id="navbarNav">
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
        {/* TODO: uncomment to activate the advanced search */}
        {/* {windowSize.width <= 992 && (
          <AdvancedSearch
            translations={props.session_translation.nav.advanced_search}
            open={openState.advancedSearch}
            onClose={() => toggleOpenState('advancedSearch', false)}
            responsive
          />
        )} */}
      </Navbar>
      <div className="a-paddingNavbar" />
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
