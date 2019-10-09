import React from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import LinearProgress from '@material-ui/core/LinearProgress'
import Typography from '@material-ui/core/Typography'

const FormProgress = ({ value }) => {
  return (
    <Row className="mx-0 mt-70 mb-0 w-100 justify-content-center d-md-none">
      <Col>
        <LinearProgress
          color="primary"
          variant="determinate"
          value={value}
          className="w-75 mx-auto"
        />
        <Typography variant="h6" className="text-center">
          {`${value}%`}
        </Typography>
      </Col>
    </Row>
  )
}

FormProgress.propTypes = {
  value: PropTypes.number.isRequired
}

export default FormProgress
