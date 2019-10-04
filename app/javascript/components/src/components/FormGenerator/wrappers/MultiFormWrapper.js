import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import { connect } from 'react-redux'
import { useDebouncedCallback } from 'use-debounce'
import { updateFieldArray } from '../../../actions'
import { makeGetMultiFormField } from '../../../selectors/forms'
import fieldOptions from '../fields/fieldOptions'

const MultiFormWrapper = props => {
  const {
    formSection,
    formName,
    dispatch,
    item: { pro, kind, aux = null, extra = null },
    singleFormID,
    addSingleForm,
    currentField = null
  } = props
  const { name } = pro
  const isArray = pro && pro.multiple
  let defaultValue = isArray ? [] : ''
  if (kind.toLowerCase() === 'datepicker') defaultValue = new Date()
  if (extra && extra.ignoreState) defaultValue = null

  const [inputValue, setValue] = useState({
    [name]: currentField || defaultValue
  })

  const handleChange = e => {
    const { value } = e.target
    if (!isArray) {
      setValue(prevState => ({
        ...prevState,
        [name]: value
      }))
    } else {
      const arrayHasItem = inputValue[name] && inputValue[name].includes(value)
      if (!arrayHasItem) {
        let merged = [value]
        if (inputValue[name]) merged = [...inputValue[name], value]
        setValue(prevState => ({
          ...prevState,
          [name]: merged
        }))
      }
    }
  }

  const handleDeleteChip = value => {
    const newChips = [...inputValue[name]]
    if (isArray) {
      newChips.splice(newChips.indexOf(value), 1)
      setValue(prevState => ({
        ...prevState,
        [name]: newChips
      }))
    } else {
      setValue(prevState => ({
        ...prevState,
        [name]: defaultValue || ''
      }))
    }
  }

  const handleDate = value => {
    let date = value
    // eslint-disable-next-line
    if (value._isAMomentObject) date = value.toDate()
    setValue(prevState => ({
      ...prevState,
      [name]: date
    }))
  }

  const handleBoolean = e => {
    setValue(prevState => ({
      ...prevState,
      [name]: e.target.checked
    }))
  }

  const [debouncedUpdateField] = useDebouncedCallback(() => {
    dispatch(
      updateFieldArray({
        formSection,
        formID: singleFormID,
        formName,
        value: {
          ...inputValue
        }
      })
    )
  }, 1250)

  useEffect(() => {
    if (!extra || !extra.ignoreState) debouncedUpdateField()
  }, [inputValue])

  useEffect(() => {
    if (currentField !== null && currentField !== inputValue[name]) {
      setValue({ [name]: currentField })
    }
  }, [currentField])

  return fieldOptions[kind]({
    formSection,
    formName,
    inputValue,
    handleChange,
    handleBoolean,
    handleDate,
    handleDeleteChip,
    addSingleForm,
    singleFormID,
    name,
    pro,
    aux,
    dispatch
  })
}

const makeMapStateToProps = () => {
  const getMultiFormField = makeGetMultiFormField()
  const mapStateToProps = (state, props) => ({
    currentField: getMultiFormField(state, props)
  })
  return mapStateToProps
}

export default connect(makeMapStateToProps)(MultiFormWrapper)
// export default MultiFormWrapper

MultiFormWrapper.propTypes = {
  formSection: PropTypes.string.isRequired,
  formName: PropTypes.string.isRequired,
  dispatch: PropTypes.func.isRequired,
  item: PropTypes.shape({
    pro: PropTypes.object.isRequired,
    aux: PropTypes.any,
    kind: PropTypes.string.isRequired
  }).isRequired
}
