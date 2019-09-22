import React from 'react'

import { MuiPickersUtilsProvider } from '@material-ui/pickers'
import DateFnsUtils from '@date-io/date-fns'
import { es, enUS as en } from 'date-fns/locale'
import store from './src/store'
import CssBaseline from '@material-ui/core/CssBaseline'
import AppLayout from './src/components/Layout/AppLayout'
import 'slick-carousel/slick/slick.css'
import 'slick-carousel/slick/slick-theme.css'
import './assets/static/themify-icons/themify-icons.css'
import './assets/static/scss/_style.scss'
import { library } from '@fortawesome/fontawesome-svg-core'
import { fab } from '@fortawesome/free-brands-svg-icons'
import { fas, faSearch } from '@fortawesome/free-solid-svg-icons'

library.add(fab, fas, faSearch)

const localeMap = { en, es }
const locale = 'es'

export default class Micomponente extends React.Component {
  componentDidMount() {
    // Remove the server-side injected CSS.
    const jssStyles = document.querySelector('#jss-server-side')
    if (jssStyles) {
      jssStyles.parentNode.removeChild(jssStyles)
    }
  }
  render() {
    return (
          <MuiPickersUtilsProvider
            utils={DateFnsUtils}
            locale={localeMap[locale]}
          >
              <AppLayout>
                <CssBaseline />
              </AppLayout>
          </MuiPickersUtilsProvider>
    )

  }
}

