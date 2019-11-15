import React from 'react'
import PropTypes from 'prop-types'
import { Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'

const ProfileBasicInfo = ({ fields }) => {
  const { name, last_name, ...otherFields } = fields
  return (
    <Col className="py-25 px-0 pb-30">
      <Typography variant="h6" component="p" className="fw-bold">
        {name && name.current_value && (
          <span className="text-primary">{name.current_value}</span>
        )}
        {last_name && last_name.current_value && ` ${last_name.current_value}`}
      </Typography>
      {Object.keys(otherFields).map(key => (
        <Typography
          key={key}
          variant="body1"
          component="p"
          className="text-muted"
        >
          {otherFields[key].current_value}
        </Typography>
      ))}
    </Col>
  )
}

export default ProfileBasicInfo

ProfileBasicInfo.propTypes = {
  fields: PropTypes.shape({
    name: PropTypes.object.isRequired,
    last_name: PropTypes.object.isRequired
  }).isRequired
}
