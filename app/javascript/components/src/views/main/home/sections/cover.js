import React from 'react'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import PropTypes from 'prop-types'
import FilterFormSection from './filterForm'

const WelcomeText = ({ welcome_Text, subtitle, common, filterForm }) => {
  return (
    <Row className="align-items-center justify-content-center bg-home mb-60">
      <Col className="align-items-center justify-content-center" xs={12}>
        {/* <div> */}
        <h1 className="welcomeText d-none d-sm-inline">
          {welcome_Text}
        </h1>
        <h2
          className="welcomeText mb-20 mt-10 d-none d-sm-inline"
        >
          {subtitle}
        </h2>
        {/* </div> */}
        <FilterFormSection {...{ common, ...filterForm }} />
      </Col>
    </Row>
  )
}

export default WelcomeText

WelcomeText.propTypes = {
  welcome_Text: PropTypes.string.isRequired,
  subtitle: PropTypes.string.isRequired,
  common: PropTypes.object.isRequired,
  filterForm: PropTypes.object.isRequired
}
