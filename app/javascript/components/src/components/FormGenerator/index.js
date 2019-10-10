import React from 'react'
import { Row, Col } from 'reactstrap'
import CandidateController from './controllers/CandidateController'
import OffersController from './controllers/OffersController'

const FormGenerator = props => {
  const { scrollAction, formName, formSection, fields, formObj } = props
  return (
    <Row className="HT__FormGenerator">
      {formName === 'candidate' && (
        <CandidateController
          {...{
            formObj,
            formSection,
            formName,
            fields,
            scrollAction
          }}
        />
      )}
      {formName === 'company' ||
        (formName === 'offers' && (
          <OffersController
            {...{
              formObj,
              formSection,
              formName,
              fields,
              scrollAction
            }}
          />
        ))}
    </Row>
  )
}

export default FormGenerator
