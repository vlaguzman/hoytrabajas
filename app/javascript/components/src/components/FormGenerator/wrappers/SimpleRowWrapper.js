import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import { connect } from 'react-redux'
import { makeGetField } from 'Src/selectors/forms'
import Paper from '@material-ui/core/Paper'
import { updateField, updateErrors } from 'Actions'
import { useDebouncedCallback } from 'use-debounce'
import Checkbox from 'Components/FormGenerator/fields/Checkbox'
import SelectChip from 'Components/FormGenerator/fields/SelectChip'

const ownFieldOptions = {
  selectChip: props => {
    const { name, pro, extra } = props
    return (
      <Col key={name} style={pro.style}>
        {extra && extra.beforeLabel}
        <SelectChip {...props} />
        {extra && extra.afterLabel}
      </Col>
    )
  },
  checkbox: props => {
    const { name, pro, extra } = props
    return (
      <Col key={name} style={pro.style}>
        {extra && extra.beforeLabel}
        <Checkbox {...props} />
        {extra && extra.afterLabel}
      </Col>
    )
  }
}

const SimpleRow = props => {
  const {
    pro: { className, style, fields },
    name,
    formSection,
    formName,
    dispatch,
    currentField = null
  } = props

  const [rowValues, setRowValues] = useState(currentField || {})

  const handleChange = (e, fieldName) => {
    e.persist()
    if (e.target)
      setRowValues(prevState => ({
        ...prevState,
        [fieldName]: e.target.value
      }))
  }

  const handleBoolean = e => {
    e.persist()
    if (e.target)
      setRowValues(prevState => ({
        ...prevState,
        [e.target.name]: e.target.checked
      }))
  }

  const handleDeleteChip = (value, fieldName) => {
    if (Array.isArray(rowValues[fieldName])) {
      const newChips = [...rowValues[fieldName]]
      newChips.splice(newChips.indexOf(value), 1)
      setRowValues(prevState => ({
        ...prevState,
        [fieldName]: newChips
      }))
    } else {
      setRowValues(prevState => ({
        ...prevState,
        [fieldName]: ''
      }))
    }
  }

  const [debouncedUpdateField] = useDebouncedCallback(() => {
    dispatch(
      updateField({
        formSection,
        formName,
        value: {
          [name]: {
            ...rowValues
          }
        }
      })
    )
  }, 500)

  useEffect(() => {
    setRowValues(currentField || {})
  }, [formSection])

  useEffect(() => {
    debouncedUpdateField()
  }, [rowValues])

  return (
    <Paper className="SimpleRowWrapper">
      <Row {...{ className, style }}>
        {fields.map(item => {
          const { kind, pro, extra = null, aux } = item
          const { name: itemName } = pro
          return ownFieldOptions[kind]({
            formSection,
            formName,
            dispatch,
            inputValue: rowValues,
            handleChange,
            handleBoolean,
            handleDeleteChip,
            pro,
            name: itemName,
            aux,
            extra
          })
        })}
      </Row>
    </Paper>
  )
}

const makeMapStateToProps = () => {
  const getField = makeGetField()
  const mapStateToProps = (state, props) => ({
    currentField: getField(state, props)
  })
  return mapStateToProps
}
export default connect(makeMapStateToProps)(SimpleRow)
