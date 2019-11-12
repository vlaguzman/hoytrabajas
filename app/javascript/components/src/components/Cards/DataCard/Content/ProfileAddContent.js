import React from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import EditInfoButton from '../EditInfoButton'

const ProfileAddContent = ({ text, content, afterContent }) => (
  <Row className="w-100 justify-content-center" noGutters>
    <Col
      xs={9}
      className="p-10"
      style={{ border: '.01rem dashed rgba(211,211,211, .9)' }}
    >
      <Typography variant="body1" className="text-center d-inline">
        {content && (
          <>
            {content}
            {afterContent && (
              <span className="fw-bold">{` ${afterContent}`}</span>
            )}
          </>
        )}
        <EditInfoButton text={text} />
      </Typography>
    </Col>
  </Row>
)

export default ProfileAddContent

ProfileAddContent.propTypes = {
  text: PropTypes.string.isRequired,
  content: PropTypes.string,
  afterContent: PropTypes.string
}
