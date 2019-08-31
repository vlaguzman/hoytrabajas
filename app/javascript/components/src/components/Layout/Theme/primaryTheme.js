import { createMuiTheme } from '@material-ui/core/styles'
import AppConfig from '../constants/AppConfig'

const theme = createMuiTheme({
  palette: {
    primary: {
      main: AppConfig.themeColors.primary
    },
    secondary: {
      main: AppConfig.themeColors.secondary
    }
  },
  overrides: {
    MuiPickersModal: {
      dialog: {
        width: '100%'
      }
    },
    MuiFormControl: {
      root: {
        justifyContent: 'flex-end',
        marginTop: 'auto'
      }
    },
    MuiFocused: {
      root: {
        color: '#64CBD3'
      },
      focused: {}
    },
    MuiFormLabel: {
      root: {
        fontFamily: 'Rubik, sans-serif',
        whiteSpace: 'pre',
        fontSize: '0.935rem',
        // lineHeight: '0rem',
        '&$focused': {
          color: '#64CBD3',
          fontSize: '1rem'
        }
      },
      focused: {}
    },
    MuiInput: {
      root: {
        width: '100%'
      },
      underline: {
        '&:after': {
          borderBottom: '2px solid #64CBD3'
        }
      },
      focused: {}
    },
    MuiTypography: {
      subtitle1: {
        lineHeight: '1em',
        fontFamily: 'inherit'
      },
      body1: {
        // fontSize: '.875rem',
        fontFamily: 'inherit'
      },
      body2: {
        // fontSize: '1rem',
        fontFamily: 'inherit'
      },
      h5: {
        fontFamily: 'inherit'
      },
      h6: {
        fontFamily: 'inherit',
        textTransform: 'none'
      },
      h4: {
        fontFamily: 'inherit',
        textTransform: 'none'
      },
      h3: {
        fontFamily: 'inherit',
        textTransform: 'none'
      },
      h2: {
        fontFamily: 'inherit',
        textTransform: 'none'
      },
      h1: {
        fontFamily: 'inherit',
        textTransform: 'none'
      },
      subtitle2: {
        fontFamily: 'inherit'
      }
    },
    MuiChip: {
      deleteIcon: {
        width: '.8rem'
      },
      label: {
        fontSize: 'x-small',
        whiteSpace: 'pre-line'
      },
      root: {
        height: '100%'
      }
    },
    MuiDialog: {
      paperWidthXs:{
        maxWidth: '400px'
      }
    }
  }
})

export default theme
