/**
 * App Header
 */
import React from 'react'
import Button from '@material-ui/core/Button'
import AppBar from '@material-ui/core/AppBar'
import Toolbar from '@material-ui/core/Toolbar'
import Link from 'next/router'

const FooterBar = () => (
  <AppBar
    position="static"
    className="bnBr"
    style={{ borderBottom: '1px solid rgba(107, 105, 105, 0.4)' }}
  >
    <Toolbar
      disableGutters
      className="d-flex justify-content-between w-100 "
      color="primary"
    >
      <div className="d-flex align-items-center">
        <div className="site-logo">
          {/* <Link href="/" className="logo-mini">
            <img
              src="/assets/static/img/appLogo.png"
              className="mr-15"
              alt="site logo"
              width="35"
              height="35"
            />
          </Link> */}
          <Link href="/" className="logo-normal">
            <img
              src="/img/appLogoText.png"
              className="img-fluid"
              alt="site-logo"
              width="67"
              height="17"
            />
          </Link>
        </div>
        Condiciones
      </div>
      <ul className="navbar-right list-inline mb-0">
        <li className="list-inline-item">
          <Button className="text-white">FAQ&apos;s</Button>
        </li>
        <li className="list-inline-item">
          <Button className="text-white">Contacto</Button>
        </li>
        <li className="list-inline-item">
          <Button className="text-white">Términos y Condiciones</Button>
        </li>
      </ul>
    </Toolbar>
  </AppBar>
)

export default FooterBar
