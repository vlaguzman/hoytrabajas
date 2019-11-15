import React from 'react'
import PropTypes from 'prop-types'
import CheckCircleIcon from '@material-ui/icons/CheckCircle'
import { green } from '@material-ui/core/colors'
import ErrorIcon from '@material-ui/icons/Error'
import Snackbar from '@material-ui/core/Snackbar'
import SnackbarContent from '@material-ui/core/SnackbarContent'
import { makeStyles } from '@material-ui/core/styles'
import CloseIcon from '@material-ui/icons/Close'
import IconButton from '@material-ui/core/IconButton'

const variantIcon = {
  success: CheckCircleIcon,
  error: ErrorIcon
}

const useStyles = makeStyles(theme => ({
  success: {
    backgroundColor: green[600]
  },
  error: {
    backgroundColor: theme.palette.error.dark
  },
  icon: {
    fontSize: 20
  },
  iconVariant: {
    opacity: 0.9,
    marginRight: theme.spacing(1)
  },
  message: {
    display: 'flex',
    alignItems: 'center'
  }
}))

const NotificationContent = props => {
  const classes = useStyles()
  const {
    className,
    message,
    isNotificationOpen,
    setNotificationOpen,
    variant,
    ...other
  } = props
  const Icon = variantIcon[variant]

  const handleClose = (event, reason) => {
    if (reason === 'clickaway') {
      return
    }

    setNotificationOpen(false)
  }

  return (
    <Snackbar
      anchorOrigin={{
        vertical: 'bottom',
        horizontal: 'left'
      }}
      open={isNotificationOpen}
      autoHideDuration={6000}
      onClose={handleClose}
    >
      <SnackbarContent
        className={`${classes[variant]} ${className}`}
        aria-describedby="client-snackbar"
        message={
          <span id="client-snackbar" className={classes.message}>
            <Icon className={`${classes.icon} ${classes.iconVariant}`} />
            {message}
          </span>
        }
        action={[
          <IconButton
            key="close"
            aria-label="close"
            color="inherit"
            onClick={handleClose}
          >
            <CloseIcon className={classes.icon} />
          </IconButton>
        ]}
        {...other}
      />
    </Snackbar>
  )
}

export default NotificationContent

NotificationContent.propTypes = {
  className: PropTypes.string,
  isNotificationOpen: PropTypes.bool.isRequired,
  setNotificationOpen: PropTypes.func.isRequired,
  message: PropTypes.string,
  variant: PropTypes.oneOf(['error', 'success']).isRequired
}
