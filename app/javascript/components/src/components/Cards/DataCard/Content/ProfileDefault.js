import React from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'

const ProfileDefault = ({ fields }) => (
  <>
    {Object.keys(fields).map(key => {
      if (!fields[key].current_value) return null
      if (key === 'user_history') {
        return (
          <Typography
            variant="body1"
            component="p"
            className="text-muted pt-20 pb-10"
            key={key}
          >
            {fields[key].current_value}
          </Typography>
        )
      }

      if (!fields[key].label) return null

      return (
        <Row className="justify-content-between" key={key}>
          <Col xs={12} sm={6} className="my-10">
            <Typography variant="body2" className="text-muted text-left">
              {fields[key].label}
            </Typography>
          </Col>
          <Col xs={12} sm={6} className="my-10">
            <Typography variant="body2" className="text-right">
              {fields[key].current_value}
            </Typography>
          </Col>
        </Row>
      )
    })}
  </>
)

export default ProfileDefault

ProfileDefault.propTypes = {
  fields: PropTypes.object.isRequired
}
