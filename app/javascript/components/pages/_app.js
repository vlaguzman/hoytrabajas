import React from 'react'
import App, { Container } from 'next/app'
import Head from 'next/head'
import { Provider } from 'react-redux'
import { MuiPickersUtilsProvider } from '@material-ui/pickers'
import { Auth0Provider } from 'Auth/authContext'
import DateFnsUtils from '@date-io/date-fns'
import { es, enUS as en } from 'date-fns/locale'
import store from '../src/store'
import CssBaseline from '@material-ui/core/CssBaseline'
import AppLayout from '../src/components/Layout/AppLayout'
import 'slick-carousel/slick/slick.css'
import 'slick-carousel/slick/slick-theme.css'
import 'Root/static/themify-icons/themify-icons.css'
import 'Root/static/scss/_style.scss'
import { library } from '@fortawesome/fontawesome-svg-core'
import { fab } from '@fortawesome/free-brands-svg-icons'
import { fas, faSearch } from '@fortawesome/free-solid-svg-icons'

library.add(fab, fas, faSearch)

const localeMap = { en, es }
const locale = 'es'

class MyApp extends App {
  componentDidMount() {
    // Remove the server-side injected CSS.
    const jssStyles = document.querySelector('#jss-server-side')
    if (jssStyles) {
      jssStyles.parentNode.removeChild(jssStyles)
    }
  }

  render() {
    const { Component, pageProps } = this.props

    return (
      <Container>
        <Head>
          <title>HoyTrabajas App</title>
        </Head>
        <Provider store={store}>
          <MuiPickersUtilsProvider
            utils={DateFnsUtils}
            locale={localeMap[locale]}
          >
            <Auth0Provider>
              <AppLayout>
                <CssBaseline />
                <Component {...pageProps} />
              </AppLayout>
            </Auth0Provider>
          </MuiPickersUtilsProvider>
        </Provider>
      </Container>
    )
  }
}

export default MyApp
