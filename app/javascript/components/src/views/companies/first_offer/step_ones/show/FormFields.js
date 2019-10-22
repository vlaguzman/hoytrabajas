import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import StandardInput from '../../../../../components/FormsLayout/Fields/StandardInput'
import SelectChip from '../../../../../components/FormsLayout/Fields/SelectChip'
import {
  handleDeleteChip,
  handleChange
} from '../../../../../components/FormsLayout/handleFunctions'

const FormFields = props => {
  const { formFields } = props
  const {
    name = null,
    industry_id = null,
    contact_name = null,
    contact_work_position = null,
    contact_cellphone = null,
    employees_range_id = null
  } = formFields

  const [formValues, setFormValues] = useState({
    [name.name]: '',
    [industry_id.name]: '',
    [contact_name.name]: '',
    [contact_work_position.name]: '',
    [contact_cellphone.name]: '',
    [employees_range_id.name]: ''
  })

  const inputClassname = 'my-30 animated fadeIn inputField'

  const nameField = useMemo(
    () => (
      <Col key={name.name} className={inputClassname} xs={12} lg={6}>
        <StandardInput
          inputValue={formValues[name.name]}
          inputName={name.name}
          handleChange={handleChange(formValues, setFormValues)}
          name={name.name}
          label={name.label}
        />
      </Col>
    ),
    [formValues[name.name]]
  )

  const industryField = useMemo(
    () => (
      <Col key={industry_id.name} className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[industry_id.name]}
          inputName={industry_id.name}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={industry_id.name}
          label={industry_id.label}
          selectOptions={industry_id.values}
          isMultiple={false}
        />
      </Col>
    ),
    [formValues[industry_id.name]]
  )

  const contactNameField = useMemo(
    () => (
      <Col key={contact_name.name} className={inputClassname} xs={12} lg={6}>
        <StandardInput
          inputValue={formValues[contact_name.name]}
          inputName={contact_name.name}
          handleChange={handleChange(formValues, setFormValues)}
          name={contact_name.name}
          label={contact_name.label}
        />
      </Col>
    ),
    [formValues[contact_name.name]]
  )

  const contactWorkPositionField = useMemo(
    () => (
      <Col
        key={contact_work_position.name}
        className={inputClassname}
        xs={12}
        lg={6}
      >
        <StandardInput
          inputValue={formValues[contact_work_position.name]}
          inputName={contact_work_position.name}
          handleChange={handleChange(formValues, setFormValues)}
          name={contact_work_position.name}
          label={contact_work_position.label}
        />
      </Col>
    ),
    [formValues[contact_work_position.name]]
  )

  const contactCellphoneField = useMemo(
    () => (
      <Col
        key={contact_cellphone.contact_work_position}
        className={inputClassname}
        xs={12}
        lg={6}
      >
        <StandardInput
          inputValue={formValues[contact_cellphone.name]}
          inputName={contact_cellphone.name}
          handleChange={handleChange(formValues, setFormValues)}
          name={contact_cellphone.name}
          label={contact_cellphone.label}
        />
      </Col>
    ),
    [formValues[contact_cellphone.name]]
  )

  const employeeRangeField = useMemo(
    () => (
      <Col
        key={employees_range_id.contact_work_position}
        className={inputClassname}
        xs={12}
        lg={6}
      >
        <SelectChip
          inputValue={formValues[employees_range_id.name]}
          inputName={employees_range_id.name}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={employees_range_id.name}
          label={employees_range_id.label}
          selectOptions={employees_range_id.values}
          isMultiple={false}
        />
      </Col>
    ),
    [formValues[employees_range_id.name]]
  )

  return (
    <Row className="HT__FormGenerator">
      {nameField}
      {industryField}
      {contactNameField}
      {contactWorkPositionField}
      {contactCellphoneField}
      {employeeRangeField}
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  formFields: PropTypes.shape({
    name: PropTypes.object,
    industry_id: PropTypes.object,
    contact_name: PropTypes.object,
    contact_work_position: PropTypes.object,
    contact_cellphone: PropTypes.object,
    employees_range_id: PropTypes.object
  }).isRequired
}
