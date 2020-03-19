import React from 'react'
import PropTypes from 'prop-types'
import Button from '@material-ui/core/Button'
import { Row, Col } from 'reactstrap'

const AuxiliaryButtons = ({ showDegrees, setShowDegrees }) => {
  return (
    <Row className="w-40 justify-content-center">
      <Col xs={12} md={6} className="p-5">
        <Button
          variant={showDegrees ? 'contained' : 'outlined'}
          className={showDegrees ? 'text-white' : ''}
          style={{ borderRadius: '20px' }}
          color="primary"
          onClick={() => setShowDegrees(true)}
        >
          Estudios
        </Button>
      </Col>
      <Col xs={12} md={6} className="p-5">
        <Button
          variant={!showDegrees ? 'contained' : 'outlined'}
          className={!showDegrees ? 'text-white' : ''}
          style={{ borderRadius: '20px' }}
          color="primary"
          onClick={() => setShowDegrees(false)}
        >
          Reconocimientos
        </Button>
      </Col>
    </Row>
  )
}

export default AuxiliaryButtons

AuxiliaryButtons.propTypes = {
  showDegrees: PropTypes.bool.isRequired,
  setShowDegrees: PropTypes.func.isRequired
}
