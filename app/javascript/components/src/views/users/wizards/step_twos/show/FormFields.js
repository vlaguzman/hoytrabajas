import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import StandardInput from '../../../../../components/FormsLayout/Fields/StandardInput'
import SelectChip from '../../../../../components/FormsLayout/Fields/SelectChip'
import DatePicker from '../../../../../components/FormsLayout/Fields/DatePicker'

const FormFields = props => {
  const { formFields, type } = props
  const {
    about_me               = null,
    sex_id                 = null,
    birthday               = null,
    limitation_ids         = null,
    educational_degree_id  = null
  } = formFields

  const [formValues, setFormValues] = useState({
    [about_me.name]:'',
    [sex_id.name]:'',
    [birthday.name]:'',
    [limitation_ids.name]:'',
    [educational_degree_id.name]:''
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

  const inputClassname = 'my-30 animated fadeIn'


  /** New */

  const aboutMeField = useMemo(
    () => (
      <Col key={about_me.name} className={inputClassname} xs={12} lg={12}>
        <StandardInput
          isTextArea={true}
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
      <Col
        key={sex_id.name}
        className={inputClassname}
        xs={12}
        lg={6}
      >
        <SelectChip
          inputValue={formValues[sex_id.name]}
          inputName={sex_id.name}
          handleChange={handleChange}
          handleDeleteChip={handleDeleteChip}
          name={sex_id.name}
          label={sex_id.label}
          selectOptions={sex_id.values}
          isMultiple={true}
        />
      </Col>
    ),
    [formValues[sex_id.name]]
  )

  const birthdayField = useMemo(
    () => (
      <Col key={birthday.name} className={inputClassname} xs={12} lg={6}>
        <DatePicker
          inputName={birthday.name}
          label={birthday.label}
        />
      </Col>
    ),
    [formValues[birthday.name]]
  )

  const limitationIDsField = useMemo(
    () => (
      <Col
        key={limitation_ids.name}
        className={inputClassname}
        xs={12}
        lg={6}
      >
        <SelectChip
          inputValue={formValues[limitation_ids.name]}
          inputName={limitation_ids.name}
          handleChange={handleChange}
          handleDeleteChip={handleDeleteChip}
          name={limitation_ids.name}
          label={limitation_ids.label}
          selectOptions={limitation_ids.values}
          isMultiple={true}
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
          isMultiple={true}
        />
      </Col>
    ),
    [formValues[educational_degree_id.name]]
  )


/** Old fields */

/*  const lastNameField = useMemo(
    () => (
      <Col key={last_name.name} className={inputClassname} xs={12} lg={6}>
        <StandardInput
          inputValue={formValues[last_name.name]}
          inputName={last_name.name}
          handleChange={handleChange}
          name={last_name.name}
          label={last_name.label}
        />
      </Col>
    ),
    [formValues[last_name.name]]
  )

  const nationalityIDsField = useMemo(
    () => (
      <Col
        key={nationality_ids.name}
        className={inputClassname}
        xs={12}
        lg={6}
      >
        <SelectChip
          inputValue={formValues[nationality_ids.name]}
          inputName={nationality_ids.name}
          handleChange={handleChange}
          handleDeleteChip={handleDeleteChip}
          name={nationality_ids.name}
          label={nationality_ids.label}
          selectOptions={nationality_ids.values}
          isMultiple={true}
        />
      </Col>
    ),
    [formValues[nationality_ids.name]]
  )

  const documentTypeIDField = useMemo(
    () => (
      <Col
        key={document_type_id.name}
        className={inputClassname}
        xs={12}
        lg={6}
      >
        <SelectChip
          inputValue={formValues[document_type_id.name]}
          inputName={document_type_id.name}
          handleChange={handleChange}
          handleDeleteChip={handleDeleteChip}
          name={document_type_id.name}
          label={document_type_id.label}
          selectOptions={document_type_id.values}
          isMultiple={false}
        />
      </Col>
    ),
    [formValues[document_type_id.name]]
  )

  const identificationNumberField = useMemo(
    () => (
      <Col key={identification_number.name} className={inputClassname} xs={12} lg={6}>
        <StandardInput
          inputValue={formValues[identification_number.name]}
          inputName={identification_number.name}
          handleChange={handleChange}
          name={identification_number.name}
          label={identification_number.label}
        />
      </Col>
    ),
    [formValues[identification_number.name]]
  )

  const contactNumberField = useMemo(
    () => (
      <Col key={contact_number.name} className={inputClassname} xs={12} lg={6}>
        <StandardInput
          inputValue={formValues[contact_number.name]}
          inputName={contact_number.name}
          handleChange={handleChange}
          name={contact_number.name}
          label={contact_number.label}
        />
      </Col>
    ),
    [formValues[contact_number.name]]
  ) */

  return (
    <Row className="HT__FormGenerator">
      { aboutMeField }
      { sexIDField }
      { birthdayField }
      { limitationIDsField }
      { educationalDegreeIDField }
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  type: PropTypes.oneOf(['user', 'company']),
  formFields: PropTypes.shape({
    name: PropTypes.object,
    last_name: PropTypes.object,
    nationality_ids: PropTypes.object,
    document_type_id: PropTypes.object,
    identification_number: PropTypes.object,
    contact_number: PropTypes.object
  }).isRequired
}
