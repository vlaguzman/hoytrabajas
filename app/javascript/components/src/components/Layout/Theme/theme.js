import { createMuiTheme } from '@material-ui/core/styles'
import breakpoint from './breakpoints'
import primaryTheme from './primaryTheme'
// const colors = {}

const theme = createMuiTheme({
  ...primaryTheme,
  breakpoint
})

export default theme
