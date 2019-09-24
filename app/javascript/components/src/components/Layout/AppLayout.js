import React, { useState, useRef } from 'react'
import { Scrollbars } from 'react-custom-scrollbars'
import { MuiPickersUtilsProvider } from '@material-ui/pickers'
import {
  ThemeProvider as MuiThemeProvider,
  StylesProvider
} from '@material-ui/styles'
import DateFnsUtils from '@date-io/date-fns'
import CssBaseline from '@material-ui/core/CssBaseline'
import { ThemeProvider } from 'styled-components'
import { library } from '@fortawesome/fontawesome-svg-core'
import { fab } from '@fortawesome/free-brands-svg-icons'
import { fas, faSearch } from '@fortawesome/free-solid-svg-icons'
import { es, enUS as en } from 'date-fns/locale'

import Header from '../../components/Layout/Header'
import Footer from '../../components/Layout/Footer'
import theme from '../../components/Layout/Theme/theme'

library.add(fab, fas, faSearch)

const localeMap = { en, es }
const locale = 'es'

const AppLayout = ({ children }) => {
  const [isTop, setIsTop] = useState(false)
  const myRef = useRef(null)
  const onScrollFrame = e => {
    const currentTop = e.scrollTop > 200
    if (currentTop !== isTop) setIsTop(currentTop)
  }
  const scrollToBottom = () => {
    myRef.current.scrollToBottom()
  }
  return (
    <MuiPickersUtilsProvider
      utils={DateFnsUtils}
      locale={localeMap[locale]}
    >
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
                          <div className="app-header">
                            <Header scrollState={isTop} />
                          </div>
                          <div className="rct-page-content">
                            <CssBaseline />
                            {children}
                            <Footer {...{scrollToBottom} }/>
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
