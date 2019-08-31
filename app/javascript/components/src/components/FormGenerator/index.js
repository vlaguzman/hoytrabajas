import React from 'react'
import { connect } from 'react-redux'
import { Row, Col } from 'reactstrap'
import CandidateController from 'Components/FormGenerator/controllers/CandidateController'
import OffersController from 'Components/FormGenerator/controllers/OffersController'

const FormGenerator = ({
  scrollAction,
  dispatch,
  formObj,
  formSection,
  formName
}) => (
  <Row className="HT__FormGenerator">
    {formName === 'candidate' && (
      <CandidateController
        {...{
          formObj,
          formSection,
          formName,
          dispatch,
          scrollAction
        }}
      />
    )}
    {formName === 'offers' && (
      <OffersController
        {...{
          formObj,
          formSection,
          formName,
          dispatch,
          scrollAction
        }}
      />
    )}
  </Row>
)

export default connect()(FormGenerator)
