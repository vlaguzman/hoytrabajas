import React from 'react'
import PropTypes from 'prop-types'
import { MuiPickersUtilsProvider } from '@material-ui/pickers'
import {
  ThemeProvider as MuiThemeProvider,
  StylesProvider
} from '@material-ui/styles'
import DateFnsUtils from '@date-io/date-fns'
import CssBaseline from '@material-ui/core/CssBaseline'
import { ThemeProvider } from 'styled-components'
import es from 'date-fns/locale/es'
import theme from './Theme'

const AppLayout = ({ children }) => {
  return (
    <MuiPickersUtilsProvider utils={DateFnsUtils} locale={es}>
      <StylesProvider injectFirst>
        <MuiThemeProvider theme={theme}>
          <ThemeProvider theme={theme}>
            <div className="rct-app-content">
              <div className="rct-page" style={{ background: 'white' }}>
                {/* <CssBaseline /> */}
                <div className="rct-page-content">{children}</div>
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
  children: PropTypes.oneOfType([
    PropTypes.arrayOf(PropTypes.node),
    PropTypes.node
  ]).isRequired
}
