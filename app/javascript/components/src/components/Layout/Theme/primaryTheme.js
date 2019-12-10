import { createMuiTheme } from '@material-ui/core/styles'
import AppConfig from '../../../constants/AppConfig'

const theme = createMuiTheme({
  palette: {
    primary: {
      main: AppConfig.themeColors.primary
    },
    secondary: {
      main: AppConfig.themeColors.secondary
    }
  },
  typography: {
    fontFamily: 'Nunito Sans',
    body1: {
      fontFamily: 'Nunito Sans'
    },
    body2: {
      fontFamily: 'Nunito Sans',
      fontSize: '1rem'
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
        fontFamily: 'Nunito Sans, sans-serif',
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
        fontFamily: 'Nunito Sans'
      },
      body1: {
        // fontSize: '.875rem',
        fontFamily: 'Nunito Sans'
      },
      body2: {
        // fontSize: '1rem',
        fontFamily: 'Nunito Sans'
      },
      h5: {
        fontFamily: 'Nunito Sans'
      },
      h6: {
        fontFamily: 'Nunito Sans',
        textTransform: 'none'
      },
      h4: {
        fontFamily: 'Nunito Sans',
        textTransform: 'none'
      },
      h3: {
        fontFamily: 'Nunito Sans',
        textTransform: 'none'
      },
      h2: {
        fontFamily: 'Nunito Sans',
        textTransform: 'none'
      },
      h1: {
        fontFamily: 'Nunito Sans',
        textTransform: 'none'
      },
      subtitle2: {
        fontFamily: 'Nunito Sans'
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
      paperWidthXs: {
        maxWidth: '400px'
      }
    },
    MuiPaper: {
      elevation1: {
        boxShadow: `0 4px 33px 4px rgba(0, 0, 0, 0.2)`
      }
    }
  }
})

export default theme
