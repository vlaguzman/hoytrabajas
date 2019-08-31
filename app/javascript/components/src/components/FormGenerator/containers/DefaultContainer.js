import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import { connect } from 'react-redux'
import { Row, Col } from 'reactstrap'
import { useDebouncedCallback } from 'use-debounce'
import { updateField, updateErrors } from 'Actions'
import { makeGetField, makeGetValidationField } from 'Src/selectors/forms'
import fieldOptions from 'Components/FormGenerator/fields/fieldOptions'
import { useValidation } from 'Hooks/formValidation'
import useWhyDidYouUpdate from 'Hooks/useWhyDidYouUpdate'
import Paper from '@material-ui/core/Paper'

const DefaultContainer = props => {
  const {
    formSection,
    formName,
    name,
    dispatch,
    scrollAction,
    currentField = null,
    currentValidation = null,
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
    [name]: currentField || defaultValue
  })

  const { validation, validateField } = useValidation(
    extra && extra.ignoreState
      ? null
      : {
          [name]: currentValidation
        }
  )

  const onFieldValidation = () =>
    validateField({ value: inputValue[name], extra, name })

  console.log('props DEFAULT CONTAINER')
  console.log(props)
  console.log('validation DEFAULT CONTAINER')
  console.log(validation)

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

  const [debouncedUpdateField] = useDebouncedCallback(() => {
    dispatch(
      updateField({
        formSection,
        formName,
        value: {
          ...inputValue
        }
      })
    )
  }, 750)

  useEffect(() => {
    if (
      !extra ||
      (!extra.ignoreState &&
        !extra.hasFields &&
        (!validation || !validation[name].errorMessage))
    ) {
      debouncedUpdateField()
    }
  }, [inputValue])

  useEffect(() => {
    setValue({
      [name]: currentField || defaultValue
    })
  }, [formSection, name])

  useEffect(() => {
    if ((!extra || !extra.ignoreState) && validation && validation[name]) {
      dispatch(
        updateErrors({
          formSection,
          formName,
          fieldName: name,
          value: {
            errorMessage: validation[name].errorMessage
          }
        })
      )
    }
  }, [validation])

  const fieldsProps = {
    formSection,
    formName,
    dispatch,
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
    validation,
    onFieldValidation,
    errors: (validation && validation[name].errorMessage) || false,
    validateErrors: null,
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

const makeMapStateToProps = () => {
  const getField = makeGetField()
  const getValidationField = makeGetValidationField()
  const mapStateToProps = (state, props) => ({
    currentField: getField(state, props),
    currentValidation: getValidationField(state, props)
  })
  return mapStateToProps
}
export default connect(makeMapStateToProps)(DefaultContainer)

DefaultContainer.propTypes = {
  formName: PropTypes.string.isRequired,
  formSection: PropTypes.string.isRequired,
  scrollAction: PropTypes.func.isRequired,
  dispatch: PropTypes.func.isRequired,
  name: PropTypes.string,
  item: PropTypes.shape({
    kind: PropTypes.string.isRequired,
    pro: PropTypes.object,
    aux: PropTypes.any
  })
}
