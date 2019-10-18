import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import StandardInput from '../../../../../components/FormsLayout/Fields/StandardInput'
import SelectChip from '../../../../../components/FormsLayout/Fields/SelectChip'
import DatePicker from '../../../../../components/FormsLayout/Fields/DatePicker'

const FormFields = props => {
  const { formFields, type } = props
  const {
    about_me = null,
    sex_id = null,
    birthday = null,
    limitation_ids = null,
    educational_degree_id = null
  } = formFields

  const [formValues, setFormValues] = useState({
    [about_me.name]: about_me.current_value || '',
    [sex_id.name]: sex_id.current_value || '',
    [birthday.name]: birthday.current_value || new Date(),
    [limitation_ids.name]: limitation_ids.current_value || '',
    [educational_degree_id.name]: educational_degree_id.current_value || ''
  })

  const handleChange = (e, inputName, isMultiple = false) => {
    e.persist()
    if (isMultiple) {
      const isArray = Array.isArray(formValues[inputName])
      if (isArray) {
        const arrayHasItem = formValues[inputName].includes(e.target.value)
        if (!arrayHasItem) {
          const merged = [...formValues[inputName], e.target.value]
          setFormValues(prevFormValues => ({
            ...prevFormValues,
            [inputName]: merged
          }))
        }
      } else {
        setFormValues(prevFormValues => ({
          ...prevFormValues,
          [inputName]: [e.target.value]
        }))
      }
    } else {
      setFormValues(prevFormValues => ({
        ...prevFormValues,
        [inputName]: e.target.value
      }))
    }
  }

  const handleSimpleChange = (newValue, inputName) => {
    setFormValues(prevFormValues => ({
      ...prevFormValues,
      [inputName]: newValue
    }))
  }

  const handleDeleteChip = (id, inputName, isMultiple) => {
    if (isMultiple) {
      const newChips = [...formValues[inputName]]
      newChips.splice(newChips.indexOf(id), 1)
      setFormValues(prevFormValues => ({
        ...prevFormValues,
        [inputName]: newChips
      }))
    } else {
      setFormValues(prevFormValues => ({
        ...prevFormValues,
        [inputName]: ''
      }))
    }
  }

  const inputClassname = 'my-30 animated fadeIn inputField'

  const aboutMeField = useMemo(
    () => (
      <Col key={about_me.name} className={inputClassname} xs={12} lg={12}>
        <StandardInput
          isTextArea
          inputValue={formValues[about_me.name]}
          inputName={about_me.name}
          handleChange={handleChange}
          name={about_me.name}
          label={about_me.label}
        />
      </Col>
    ),
    [formValues[about_me.name]]
  )

  const sexIDField = useMemo(
    () => (
      <Col key={sex_id.name} className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[sex_id.name]}
          inputName={sex_id.name}
          handleChange={handleChange}
          handleDeleteChip={handleDeleteChip}
          name={sex_id.name}
          label={sex_id.label}
          selectOptions={sex_id.values}
          isMultiple
        />
      </Col>
    ),
    [formValues[sex_id.name]]
  )

  const dateOptions = {
    format: 'dd MMMM yyyy',
    disableFuture: false,
    emptyLabel: '...'
  }

  const birthdayField = useMemo(
    () => (
      <Col key={birthday.name} className={inputClassname} xs={12} lg={6}>
        <DatePicker
          name={birthday.name}
          inputValue={formValues[birthday.name]}
          handleSimpleChange={handleSimpleChange}
          label={birthday.label}
          dateOptions={dateOptions}
        />
      </Col>
    ),
    [formValues[birthday.name]]
  )

  const limitationIDsField = useMemo(
    () => (
      <Col key={limitation_ids.name} className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[limitation_ids.name]}
          inputName={limitation_ids.name}
          handleChange={handleChange}
          handleDeleteChip={handleDeleteChip}
          name={limitation_ids.name}
          label={limitation_ids.label}
          selectOptions={limitation_ids.values}
          isMultiple
        />
      </Col>
    ),
    [formValues[limitation_ids.name]]
  )

  const educationalDegreeIDField = useMemo(
    () => (
      <Col
        key={educational_degree_id.name}
        className={inputClassname}
        xs={12}
        lg={6}
      >
        <SelectChip
          inputValue={formValues[educational_degree_id.name]}
          inputName={educational_degree_id.name}
          handleChange={handleChange}
          handleDeleteChip={handleDeleteChip}
          name={educational_degree_id.name}
          label={educational_degree_id.label}
          selectOptions={educational_degree_id.values}
          isMultiple
        />
      </Col>
    ),
    [formValues[educational_degree_id.name]]
  )

  return (
    <Row className="HT__FormGenerator">
      {aboutMeField}
      {sexIDField}
      {birthdayField}
      {limitationIDsField}
      {educationalDegreeIDField}
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  type: PropTypes.oneOf(['user', 'company']),
  formFields: PropTypes.shape({
    about_me: PropTypes.object.isRequired,
    sex_id: PropTypes.object.isRequired,
    birthday: PropTypes.object.isRequired,
    limitation_ids: PropTypes.object.isRequired,
    educational_degree_id: PropTypes.object.isRequired
  }).isRequired
}
