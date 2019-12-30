import React from 'react'
import PropTypes from 'prop-types'
import Tooltip from '@material-ui/core/Tooltip'

const affinity_percentage_info = ({ description }) => {
  return (
    <Tooltip title={description} placement="top-start">
      <i className="material-icons">info</i>
    </Tooltip>
  )
}

affinity_percentage_info.propTypes = {
  description: PropTypes.string
}

export default affinity_percentage_info
