import React from 'react'
import { connect } from 'react-redux'
import { Row, Col } from 'reactstrap'
import CandidateController from '../../components/FormGenerator/controllers/CandidateController'
import OffersController from '../../components/FormGenerator/controllers/OffersController'

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
