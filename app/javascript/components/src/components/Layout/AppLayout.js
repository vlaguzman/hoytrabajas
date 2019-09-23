import React, { useState, useRef } from 'react'
import HomePage from '../../views/main/home/index'
import { Scrollbars } from 'react-custom-scrollbars'
import {
  ThemeProvider as MuiThemeProvider,
  StylesProvider
} from '@material-ui/styles'
import { ThemeProvider } from 'styled-components'

import Header from '../../components/Layout/Header'
import Footer from '../../components/Layout/Footer'
import theme from '../../components/Layout/Theme/theme'

const AppLayout = ({ children }) => {
  const [isTop, setIsTop] = useState(false)
  const myRef = useRef(null)
  const onScrollFrame = e => {
    const currentTop = e.scrollTop > 200
    if (currentTop !== isTop) setIsTop(currentTop)
  }
  const scrollToBottom = () => {
    console.log('las barras',myRef)
    myRef.current.scrollToBottom()
  }
  return ( 
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
                          <HomePage />
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
  )
}

const mapStateToProps = ({ settings }) => {
  return { settings }
}

export default AppLayout
