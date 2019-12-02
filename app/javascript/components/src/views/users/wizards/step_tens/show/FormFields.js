import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import StandardInput from '../../../../../components/FormsLayout/Fields/StandardInput'
import DatePicker from '../../../../../components/FormsLayout/Fields/DatePicker'

import {
  handleChange,
  handleSimpleChange
} from '../../../../../components/FormsLayout/handleFunctions'

const inputClassname = 'my-30 animated fadeIn inputField'

const dateOptions = {
  format: 'dd/MM/yyyy',
  disableFuture: false,
  emptyLabel: '...'
}

const FormFields = props => {
  const { formFields } = props
  const {
    diploma = null,
    entity_name = null,
    start_date = null,
    title = null
  } = formFields

  const [formValues, setFormValues] = useState({
    [title.name]: '',
    [entity_name.name]: '',
    [diploma.name]: '',
    [start_date.name]: Date.now()
  })

  const titleField = useMemo(
    () => (
      <Col key={title.name} className={inputClassname} xs={12} lg={12}>
        <StandardInput
          inputValue={formValues[title.name]}
          handleChange={handleChange(formValues, setFormValues)}
          name={title.name}
          label={title.label}
        />
      </Col>
    ),
    [formValues[title.name]]
  )

  const startDateField = useMemo(
    () => (
      <Col key={start_date.name} className={inputClassname} xs={12} lg={6}>
        <DatePicker
          name={start_date.name}
          inputValue={formValues[start_date.name]}
          handleSimpleChange={handleSimpleChange(formValues, setFormValues)}
          label={start_date.label}
          dateOptions={dateOptions}
        />
      </Col>
    ),
    [formValues[start_date.name]]
  )

  const entityNameField = useMemo(
    () => (
      <Col key={entity_name.name} className={inputClassname} xs={12} lg={6}>
        <StandardInput
          inputValue={formValues[entity_name.name]}
          handleChange={handleChange(formValues, setFormValues)}
          name={entity_name.name}
          label={entity_name.label}
        />
      </Col>
    ),
    [formValues[entity_name.name]]
  )

  const diplomaField = useMemo(
    () => (
      <Col key={diploma.name} className={inputClassname} xs={12} lg={12}>
        <label>{diploma.label}</label>
        <input name={diploma.name} type="file" accept="image/*, .pdf" />
      </Col>
    ),
    [formValues[diploma.name]]
  )

  return (
    <Row className="HT__FormGenerator">
      {titleField}
      {startDateField}
      {entityNameField}
      {diplomaField}
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  formFields: PropTypes.shape({
    diploma: PropTypes.object,
    entity_name: PropTypes.object,
    start_date: PropTypes.object,
    title: PropTypes.object
  }).isRequired
}
