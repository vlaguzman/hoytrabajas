import React, { useState, useEffect } from 'react'
import { Col } from 'reactstrap'
import { connect } from 'react-redux'
import { useTheme } from '@material-ui/styles'
import { useDebouncedCallback } from 'use-debounce'
import TextField from '@material-ui/core/TextField'
import FormControl from '@material-ui/core/FormControl'
import FormHelperText from '@material-ui/core/FormHelperText'
import { updateField, updateErrors } from '../../../actions'
import Label from '../styles/Label'
import { getControlledInput } from '../../../selectors/forms'
import { useValidation } from '../../../hooks/formValidation'
import Select from './Select'

const ownFieldOptions = {
  stInput: ({ inputValue, pro, name, handleChange, errors = null }) => (
    <Col key={name} className={pro.className} style={{ flex: 1 }}>
      <FormControl error={!!errors}>
        <TextField
          {...pro}
          value={inputValue[name] || ``}
          onChange={e => handleChange(e)}
        />
        {!!errors && <FormHelperText>{errors}</FormHelperText>}
      </FormControl>
    </Col>
  ),
  select: ({ inputValue, pro, handleChange, aux, errors = null }) => (
    <Col key={pro.name} className={pro.className} {...pro.sizes}>
      <Select {...{ inputValue, pro, aux, handleChange }} />
    </Col>
  )
}

const ControlledInputs = props => {
  const { pro, currentControlledInput, formSection, formName, dispatch } = props
  const { formTitle, mainField, fields } = pro

  const theme = useTheme()
  const [inputValue, setValues] = useState(currentControlledInput || {})
  // const { errors, validateErrors } = useValidation({
  //   value: inputValue,
  //   extra
  // })

  const handleChange = e => {
    e.persist()
    if (e.target)
      setValues(prevState => ({
        ...prevState,
        [e.target.name]: e.target.value
      }))
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
    setValues(currentControlledInput || {})
  }, [formSection])

  useEffect(() => {
    debouncedUpdateField()
  }, [inputValue])

  return (
    <>
      {formTitle && (
        <Col
          className="justify-content-start align-items-center col-12 position-absolute"
          style={{ top: 0, marginTop: '-8px' }}
        >
          <Label>{formTitle}</Label>
        </Col>
      )}
      {mainField &&
        ownFieldOptions[mainField.kind]({
          inputValue,
          handleChange,
          pro: mainField.pro,
          aux: mainField.aux,
          name: mainField.pro.name
        })}
      {fields.map(item => {
        const { pro: itemPro, aux: itemAux, extra = null } = item

        if (extra && extra.showWithRange && inputValue['type_range'] !== 1)
          return null

        return ownFieldOptions[item.kind]({
          inputValue,
          handleChange,
          pro: itemPro,
          aux: itemAux,
          name: itemPro.name
        })
      })}
    </>
  )
}

// add errors in ownField parameters

const mapStateToProps = (state, props) => ({
  currentControlledInput: getControlledInput(state, props)
})

export default connect(mapStateToProps)(ControlledInputs)
