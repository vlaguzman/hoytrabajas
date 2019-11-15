import React, { useState } from 'react'
import PropTypes from 'prop-types'
import NotificationContent from './NotificationContent'

const NotificationWrapper = ({ alert_message, notice_message }) => {
  const [showAlert, setShowAlert] = useState(true)
  const [showNotice, setShowNotice] = useState(true)

  // useEffect(() => (
  //   if (alert_message) setShowAlert(true)
  //   if (notice_message) setShowNotice(true)
  // ), [])

  return (
    <>
      {alert_message ? (
        <NotificationContent
          message={alert_message}
          variant="error"
          isNotificationOpen={showAlert}
          setNotificationOpen={setShowAlert}
        />
      ) : (
        notice_message && (
          <NotificationContent
            message={notice_message}
            variant="success"
            isNotificationOpen={showNotice}
            setNotificationOpen={setShowNotice}
          />
        )
      )}
    </>
  )
}

export default NotificationWrapper

NotificationWrapper.propTypes = {
  alert_message: PropTypes.string,
  notice_message: PropTypes.string
}
