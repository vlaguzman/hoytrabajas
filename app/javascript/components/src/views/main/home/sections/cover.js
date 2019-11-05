import React from 'react'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import FilterFormSection from './filterForm'

const WelcomeText = ({ welcome_Text, subtitle, common, filterForm }) => {
  return (
    <Row
      className="align-items-center justify-content-center bg-home mb-60"
    >
      <Col className="align-items-center justify-content-center" xs={12}>
        {/* <div> */}
        <Typography variant="h4" className="welcomeText d-none d-sm-inline">
          {welcome_Text}
        </Typography>
        <Typography variant="subtitle2" className="welcomeText mb-20 mt-10 d-none d-sm-inline">
          {subtitle}
        </Typography>
        {/* </div> */}
        <FilterFormSection {...{ common, ...filterForm }} />
      </Col>
    </Row>
  )
}

export default WelcomeText
