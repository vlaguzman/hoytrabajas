import React from 'react'
import Close from '@material-ui/icons/Close'

const CloseIcon = props => (
  <div className="modalCloseIcon">
    <Close
      {...props}
      style={{ cursor: 'pointer' }}
      className="modalCloseIcon__button"
      focusable
    />
  </div>
)

export default CloseIcon
