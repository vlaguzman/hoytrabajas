import React, { useState, useRef } from 'react'
import PropTypes from 'prop-types'
import { Scrollbars } from 'react-custom-scrollbars'
import { MuiPickersUtilsProvider } from '@material-ui/pickers'
import {
  ThemeProvider as MuiThemeProvider,
  StylesProvider
} from '@material-ui/styles'
import DateFnsUtils from '@date-io/date-fns'
import CssBaseline from '@material-ui/core/CssBaseline'
import { ThemeProvider } from 'styled-components'

import es from 'date-fns/locale/es'

import Header from './Header'
import Footer from './Footer'
import theme from './Theme/theme'

const AppLayout = ({
  children,
  csrf_param,
  csrf_token,
  user_signed_in,
  companies_registration_path,
  users_registration_path,
  companies_sessions_path,
  users_sessions_path,
  company_signed_in,
  log_out_user,
  log_out_companies,
  session_translation,
  user_facebook_omniauth_authorize_path,
  shouldChangeColorOfNav = false
}) => {
  const [isTop, setIsTop] = useState(true)
  const myRef = useRef(null)

  const onScrollFrame = e => {
    const currentTop = e.scrollTop < 200
    if (currentTop !== isTop) setIsTop(currentTop)
  }

  const scrollToBottom = () => {
    myRef.current.scrollToBottom()
  }

  return (
    <MuiPickersUtilsProvider utils={DateFnsUtils} locale={es}>
      <StylesProvider injectFirst>
        <MuiThemeProvider theme={theme}>
          <ThemeProvider theme={theme}>
            <div className="app-layout">
              <div className="app">
                <div className="app-main-container">
                  <div className="app-container">
                    <div className="rct-app-content">
                      <div className="rct-page" style={{ background: 'white' }}>
                        <Scrollbars
                          className="rct-scroll"
                          onScrollFrame={onScrollFrame}
                          universal
                          autoHide
                          autoHideDuration={100}
                          style={{ height: '100vh' }}
                          ref={myRef}
                        >
                          <div
                            style={{ marginRight: '0px', marginBottom: '0px' }}
                            className="app-header"
                          >
                            <Header
                              isScrollTop={isTop}
                              csrf_param={csrf_param}
                              csrf_token={csrf_token}
                              user_signed_in={user_signed_in}
                              company_signed_in={company_signed_in}
                              companies_registration_path={
                                companies_registration_path
                              }
                              users_registration_path={users_registration_path}
                              companies_sessions_path={companies_sessions_path}
                              users_sessions_path={users_sessions_path}
                              log_out_user={log_out_user}
                              log_out_companies={log_out_companies}
                              session_translation={session_translation}
                              user_facebook_omniauth_authorize_path={
                                user_facebook_omniauth_authorize_path
                              }
                              shouldChangeColorOfNav={shouldChangeColorOfNav}
                            />
                          </div>
                          <div className="rct-page-content">
                            <CssBaseline />
                            {children}
                            <Footer {...{ scrollToBottom }} />
                          </div>
                        </Scrollbars>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </ThemeProvider>
        </MuiThemeProvider>
      </StylesProvider>
    </MuiPickersUtilsProvider>
  )
}

export default AppLayout

AppLayout.propTypes = {
  children: PropTypes.any,
  user_facebook_omniauth_authorize_path: PropTypes.string.isRequired,
  log_out_companies: PropTypes.string.isRequired,
  company_signed_in: PropTypes.bool.isRequired,
  user_signed_in: PropTypes.bool.isRequired,
  companies_registration_path: PropTypes.string.isRequired,
  users_registration_path: PropTypes.string.isRequired,
  companies_sessions_path: PropTypes.string.isRequired,
  users_sessions_path: PropTypes.string.isRequired,
  log_out_user: PropTypes.string.isRequired,
  csrf_param: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired,
  session_translation: PropTypes.object.isRequired,
  shouldChangeColorOfNav: PropTypes.bool
}
