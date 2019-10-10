import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import Paper from '@material-ui/core/Paper'
import { Row, Col } from 'reactstrap'
import fieldOptions from '../fields/fieldOptions'

const DefaultContainer = props => {
  const {
    formSection,
    formName,
    name,
    scrollAction,
    item: { kind, pro, extra = null, aux = null }
  } = props

  const isArray = pro && pro.multiple
  let defaultValue = isArray ? [] : ''
  if ((extra && extra.ignoreState) || (extra && extra.hasFields))
    defaultValue = null
  if (kind.toLowerCase() === 'datepicker') defaultValue = new Date()
  if (kind.toLowerCase() === 'slider') {
    defaultValue = extra.minValue
    if (extra.maxValue) defaultValue = [extra.minValue, extra.maxValue]
  }

  const [inputValue, setValue] = useState({
    [name]: defaultValue
  })

  const handleChange = e => {
    if (!isArray) {
      setValue({
        [name]: e.target.value
      })
    } else {
      const arrayHasItem = inputValue[name].includes(e.target.value)
      if (!arrayHasItem) {
        const merged = [...inputValue[name], e.target.value]
        setValue({
          [name]: merged
        })
      }
    }
  }

  const handleDate = value => {
    setValue(prevState => ({
      ...prevState,
      [name]: value
    }))
  }

  const handleDeleteChip = value => {
    if (isArray) {
      const newChips = [...inputValue[name]]
      newChips.splice(newChips.indexOf(value), 1)
      setValue({
        [name]: newChips
      })
    } else {
      setValue({
        [name]: defaultValue
      })
    }
  }

  const handleBoolean = e => {
    setValue({
      [name]: e.target.checked
    })
  }

  const handleSlider = (event, newValue) => {
    setValue({
      [name]: newValue
    })
  }

  useEffect(() => {
    setValue({
      [name]: defaultValue
    })
  }, [formSection, name])

  const fieldsProps = {
    formSection,
    formName,
    inputValue,
    setValue,
    handleChange,
    handleDate,
    handleBoolean,
    handleDeleteChip,
    handleSlider,
    scrollAction,
    isArray,
    pro,
    name,
    aux,
    // validation,
    // onFieldValidation,
    // errors: (validation && validation[name].errorMessage) || false,
    // validateErrors: null,
    extra
  }

  if (extra && extra.hasPaper) {
    const { style = null } = pro
    return (
      <Paper className="SimpleRowWrapper" style={{ padding: '20px' }}>
        <Row {...{ style }}>
          <Col key={name} style={style}>
            {extra && extra.beforeLabel}
            {fieldOptions[kind](fieldsProps)}
            {extra && extra.afterLabel}
          </Col>
        </Row>
      </Paper>
    )
  }

  return fieldOptions[kind](fieldsProps)
}

export default DefaultContainer

DefaultContainer.propTypes = {
  formName: PropTypes.string.isRequired,
  formSection: PropTypes.string.isRequired,
  scrollAction: PropTypes.func.isRequired,
  name: PropTypes.string,
  item: PropTypes.shape({
    kind: PropTypes.string.isRequired,
    pro: PropTypes.object,
    aux: PropTypes.any
  })
}
