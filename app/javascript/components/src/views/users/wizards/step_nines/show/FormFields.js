import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import SelectChip from '../../../../../components/FormsLayout/Fields/SelectChip'
import StandardInput from '../../../../../components/FormsLayout/Fields/StandardInput'
import DatePicker from '../../../../../components/FormsLayout/Fields/DatePicker'
import Checkbox from '../../../../../components/FormsLayout/Fields/Checkbox'
import FormLabel from '../../../../../components/FormsLayout/FormLabel'


import {
  handleDeleteChip,
  handleChange,
  handleSimpleChange,
  handleBoolean
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
    city_id = null,
    degree = null,
    diploma = null,
    finish_date = null,
    institution_name = null,
    ongoing_study = null,
    start_date = null
  } = formFields

  const [formValues, setFormValues] = useState({
    [city_id.name]: '',
    [degree.name]: '',
    [diploma.name]: '',
    [finish_date.name]: Date.now(),
    [institution_name.name]: '',
    [ongoing_study.name]: false,
    [start_date.name]: Date.now()
  })

  const degreeField = useMemo(
    () => (
      <Col key={degree.name} className={inputClassname} xs={12} lg={6}>
        <StandardInput
          inputValue={formValues[degree.name]}
          handleChange={handleChange(formValues, setFormValues)}
          name={degree.name}
          label={degree.label}
        />
      </Col>
    ),
    [formValues[degree.name]]
  )

  const institutionNameField = useMemo(
    () => (
      <Col
        key={institution_name.name}
        className={inputClassname}
        xs={12}
        lg={6}
      >
        <StandardInput
          inputValue={formValues[institution_name.name]}
          handleChange={handleChange(formValues, setFormValues)}
          name={institution_name.name}
          label={institution_name.label}
        />
      </Col>
    ),
    [formValues[institution_name.name]]
  )

  const startDateField = useMemo(
    () => (
      <Col
        key={start_date.name}
        className={inputClassname}
        xs={12}
        lg={formValues[ongoing_study.name] ? 6 : 3}
      >
        <DatePicker
          name={start_date.name}
          inputValue={formValues[start_date.name]}
          handleSimpleChange={handleSimpleChange(formValues, setFormValues)}
          label={start_date.label}
          dateOptions={dateOptions}
        />
      </Col>
    ),
    [formValues[start_date.name], formValues[ongoing_study.name]]
  )

  const finishDateField = useMemo(
    () => (
      <Col key={finish_date.name} className={inputClassname} xs={12} lg={3}>
        <DatePicker
          name={finish_date.name}
          inputValue={
            formValues[ongoing_study.name] ? null : formValues[finish_date.name]
          }
          handleSimpleChange={handleSimpleChange(formValues, setFormValues)}
          label={finish_date.label || ""}
          dateOptions={dateOptions}
        />
      </Col>
    ),
    [formValues[finish_date.name]]
  )

  const onGoingStudyField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <Checkbox
          inputValue={formValues[ongoing_study.name]}
          handleBoolean={handleBoolean(setFormValues)}
          name={ongoing_study.name}
          label=""
          description={ongoing_study.label}
          isRequired={false}
        />
      </Col>
    ),
    [formValues[ongoing_study.name]]
  )

  const cityIDField = useMemo(
    () => (
      <Col key={city_id.name} className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[city_id.name]}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={city_id.name}
          label={city_id.label}
          selectOptions={city_id.values}
          isMultiple={false}
        />
      </Col>
    ),
    [formValues[city_id.name]]
  )

  const diplomaField = useMemo(
    () => (
      <Col key={diploma.name} className={inputClassname} xs={12} lg={6} style={{display: "flex", flexDirection: "column"}} >
        <FormLabel style={{alignSelf: "flex-start"}}>{diploma.label}</FormLabel>
        <input name={diploma.name} type="file" accept="image/*, .pdf" />
      </Col>
    ),
    [formValues[diploma.name]]
  )

  return (
    <Row className="HT__FormGenerator StepFive">
      {degreeField}
      {institutionNameField}
      {startDateField}
      {!formValues[ongoing_study.name] && finishDateField}
      {onGoingStudyField}
      {cityIDField}
      {diplomaField}
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  formFields: PropTypes.shape({
    degree: PropTypes.object,
    institution_name: PropTypes.object,
    start_date: PropTypes.object,
    finish_date: PropTypes.object,
    ongoing_study: PropTypes.object,
    city_id: PropTypes.object,
    diploma: PropTypes.object
  }).isRequired
}
