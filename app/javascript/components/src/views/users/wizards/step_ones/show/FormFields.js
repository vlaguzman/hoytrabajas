import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import StandardInput from '../../../../../components/FormsLayout/Fields/StandardInput'
import SelectChip from '../../../../../components/FormsLayout/Fields/SelectChip'

const FormFields = props => {
  const { formFields, type } = props
  const {
    name = null,
    last_name = null,
    nationality_ids = null,
    document_type_id = null,
    identification_number = null,
    contact_number = null
  } = formFields

  const [formValues, setFormValues] = useState({
    [name.name]: name.current_value || '',
    [last_name.name]: last_name.current_value || '',
    [nationality_ids.name]: nationality_ids.current_value || '',
    [document_type_id.name]: document_type_id.current_value || '',
    [identification_number.name]: identification_number.current_value || '',
    [contact_number.name]: contact_number.current_value || ''
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

  const inputClassname = 'mt-30 animated fadeIn inputField'

  const nameField = useMemo(
    () => (
      <Col key={name.name} className={inputClassname} xs={12} lg={6}>
        <StandardInput
          inputValue={formValues[name.name]}
          inputName={name.name}
          handleChange={handleChange}
          name={name.name}
          label={name.label}
        />
      </Col>
    ),
    [formValues[name.name]]
  )

  const lastNameField = useMemo(
    () => (
      <Col key={last_name.name} className={inputClassname} xs={12} lg={6}>
        <StandardInput
          inputValue={formValues[last_name.name]}
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
      <Col key={nationality_ids.name} className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[nationality_ids.name]}
          handleChange={handleChange}
          handleDeleteChip={handleDeleteChip}
          name={nationality_ids.name}
          label={nationality_ids.label}
          selectOptions={nationality_ids.values}
          isMultiple
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
          handleChange={handleChange}
          handleDeleteChip={handleDeleteChip}
          name={document_type_id.name}
          label={document_type_id.label}
          selectOptions={document_type_id.values}
        />
      </Col>
    ),
    [formValues[document_type_id.name]]
  )

  const identificationNumberField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <StandardInput
          inputValue={formValues[identification_number.name]}
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
      <Col className={inputClassname} xs={12} lg={6}>
        <StandardInput
          inputValue={formValues[contact_number.name]}
          handleChange={handleChange}
          name={contact_number.name}
          label={contact_number.label}
        />
      </Col>
    ),
    [formValues[contact_number.name]]
  )

  return (
    <Row className="HT__FormGenerator">
      {nameField}
      {lastNameField}
      {nationalityIDsField}
      {documentTypeIDField}
      {identificationNumberField}
      {contactNumberField}
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  type: PropTypes.oneOf(['user', 'company', 'candidate']),
  formFields: PropTypes.shape({
    name: PropTypes.object,
    last_name: PropTypes.object,
    nationality_ids: PropTypes.object,
    document_type_id: PropTypes.object,
    identification_number: PropTypes.object,
    contact_number: PropTypes.object
  }).isRequired
}
