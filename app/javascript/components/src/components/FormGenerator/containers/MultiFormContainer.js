import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import uuidv4 from 'uuid/v4'
import { connect } from 'react-redux'
import { Col } from 'reactstrap'
import { updateFieldArray, pushFieldArray } from '../../../actions'
import { makeGetMultiFormID } from '../../../selectors/forms'
import MultiFormWrapper from '../../../components/FormGenerator/wrappers/MultiFormWrapper'

const MultiFormContainer = props => {
  const {
    formSection,
    formName,
    dispatch,
    pro: { fields },
    currentFormID = null
  } = props

  const [singleFormID, setSingleFormID] = useState(currentFormID)

  const addSingleForm = () => {
    const newId = uuidv4()
    dispatch(
      pushFieldArray({
        formID: newId,
        formSection,
        formName
      })
    )
    setSingleFormID(newId)
  }
  useEffect(() => {
    dispatch(
      updateFieldArray({
        formSection,
        formID: singleFormID,
        formName,
        value: {
          id: singleFormID
        }
      })
    )
  }, [])

  useEffect(() => {
    if (currentFormID !== singleFormID) {
      setSingleFormID(currentFormID)
      dispatch(
        updateFieldArray({
          formSection,
          formID: currentFormID,
          formName,
          value: {
            id: currentFormID
          }
        })
      )
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
            item,
            dispatch
          }}
        />
      </Col>
    )
  })
}

const makeMapStateToProps = () => {
  const getMultiFormID = makeGetMultiFormID()
  const mapStateToProps = (state, props) => ({
    currentFormID: getMultiFormID(state, props)
  })
  return mapStateToProps
}

export default connect(makeMapStateToProps)(MultiFormContainer)

MultiFormContainer.propTypes = {
  formSection: PropTypes.string.isRequired,
  pro: PropTypes.object
}
