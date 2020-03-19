import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import uuidv4 from 'uuid/v4'
import { Col } from 'reactstrap'
import MultiFormWrapper from '../wrappers/MultiFormWrapper'

const MultiFormContainer = props => {
  const {
    formSection,
    formName,
    dispatch,
    pro: { fields }
  } = props

  const [singleFormID, setSingleFormID] = useState(uuidv4())

  const addSingleForm = () => {
    const newId = uuidv4()
    setSingleFormID(newId)
  }
  // useEffect(() => {
  //   dispatch(
  //     updateFieldArray({
  //       formSection,
  //       formID: singleFormID,
  //       formName,
  //       value: {
  //         id: singleFormID
  //       }
  //     })
  //   )
  // }, [])

  useEffect(() => {
    if (currentFormID !== singleFormID) {
      setSingleFormID(currentFormID)
    }
  }, [currentFormID])

  return fields.map(item => {
    const {
      pro: { name, sizes },
      className
    } = item

    return (
      <Col key={name} className={className} {...sizes}>
        <MultiFormWrapper
          {...{
            formSection,
            formName,
            singleFormID,
            setSingleFormID,
            addSingleForm,
            item
          }}
        />
      </Col>
    )
  })
}

export default MultiFormContainer

MultiFormContainer.propTypes = {
  formSection: PropTypes.string.isRequired,
  pro: PropTypes.object
}
