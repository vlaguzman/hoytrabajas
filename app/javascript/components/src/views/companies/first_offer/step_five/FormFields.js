import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import Select from '../../../../components/FormsLayout/Fields/Select'
import SelectChip from '../../../../components/FormsLayout/Fields/SelectChip'
import StandardInput from '../../../../components/FormsLayout/Fields/StandardInput'

const FormFields = props => {
  const { formFields, type } = props
  const {
    offer_salary_id = null,
    offer_salary_currency_id = null,
    offer_salary_min = null,
    offer_salary_max = null,
    offer_salary_interval_id = null,
    offer_working_days = null,
    offer_working_hours = null,
    offer_benefits = null
  } = formFields

  const [formValues, setFormValues] = useState({
    [offer_salary_id.name]: offer_salary_id.current_value || '',
    [offer_salary_currency_id.name]:
      offer_salary_currency_id.current_value || '',
    [offer_salary_min.name]: offer_salary_min.current_value || '',
    [offer_salary_max.name]: offer_salary_max.current_value || '',
    [offer_salary_interval_id.name]:
      offer_salary_interval_id.current_value || '',
    [offer_working_days.name]: offer_working_days.current_value || '',
    [offer_working_hours.name]: offer_working_hours.current_value || '',
    [offer_benefits.name]: offer_benefits.current_value || ''
  })

  const handleChange = (e, inputName, isMultiple = false) => {
    if (e.persist) e.persist()
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

  const handleBoolean = (e, inputName) => {
    if (e.persist) e.persist()
    setFormValues(prevFormValues => ({
      ...prevFormValues,
      [inputName]: e.target.checked
    }))
  }

  const inputClassname = 'my-30 animated fadeIn inputField'

  const controlledInputsClassname =
    'animated fadeIn controlledInputs inputField mt-20'

  const offerSalaryField = useMemo(
    () => (
      <Col className={controlledInputsClassname} xs={12} lg={3}>
        <Select
          inputValue={formValues[offer_salary_id.name]}
          handleChange={handleChange}
          name={offer_salary_id.name}
          label={offer_salary_id.label}
          selectOptions={offer_salary_id.values}
          isRequired={offer_salary_id.isRequired || false}
        />
      </Col>
    ),
    [formValues[offer_salary_id.name]]
  )

  const offerSalaryCurrencyField = useMemo(
    () => (
      <Col className={controlledInputsClassname} xs={12} lg={2}>
        <Select
          inputValue={formValues[offer_salary_currency_id.name]}
          handleChange={handleChange}
          name={offer_salary_currency_id.name}
          selectOptions={offer_salary_currency_id.values}
          isRequired={offer_salary_currency_id.isRequired || false}
        />
      </Col>
    ),
    [formValues[offer_salary_currency_id.name]]
  )

  const offerSalaryMinField = useMemo(
    () => (
      <Col className={controlledInputsClassname} style={{ flex: 1 }}>
        <StandardInput
          inputValue={formValues[offer_salary_min.name]}
          handleChange={handleChange}
          name={offer_salary_min.name}
          placeholder={offer_salary_min.placeholder || ''}
          style={{ width: '100%' }}
        />
      </Col>
    ),
    [formValues[offer_salary_min.name]]
  )

  const offerSalaryMaxField = useMemo(
    () =>
      formValues[offer_salary_id.name] === 1 ? (
        <Col className={`pr-0 ${controlledInputsClassname}`} xs={12} lg={2}>
          <StandardInput
            inputValue={formValues[offer_salary_max.name]}
            handleChange={handleChange}
            name={offer_salary_max.name}
            placeholder={offer_salary_max.placeholder || ''}
            beforeLabel={offer_salary_max.beforeLabel || ''}
            style={{ width: '100%' }}
          />
        </Col>
      ) : null,
    [formValues[offer_salary_max.name], formValues[offer_salary_id.name]]
  )

  const offerSalaryIntervalField = useMemo(
    () => (
      <Col className={controlledInputsClassname} xs={12} lg={3}>
        <Select
          inputValue={formValues[offer_salary_interval_id.name]}
          handleChange={handleChange}
          name={offer_salary_interval_id.name}
          label={offer_salary_interval_id.label}
          selectOptions={offer_salary_interval_id.values}
          isRequired={offer_salary_interval_id.isRequired || false}
        />
      </Col>
    ),
    [formValues[offer_salary_interval_id.name]]
  )

  const offerWorkingDaysField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[offer_working_days.name]}
          handleChange={handleChange}
          handleDeleteChip={handleDeleteChip}
          name={offer_working_days.name}
          label={offer_working_days.label}
          selectOptions={offer_working_days.values}
          isRequired={offer_working_days.isRequired || false}
          isMultiple={offer_working_days.isMultiple || false}
        />
      </Col>
    ),
    [formValues[offer_working_days.name]]
  )

  const offerWorkingHoursField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[offer_working_hours.name]}
          handleChange={handleChange}
          handleDeleteChip={handleDeleteChip}
          name={offer_working_hours.name}
          label={offer_working_hours.label}
          selectOptions={offer_working_hours.values}
          isRequired={offer_working_hours.isRequired || false}
          isMultiple={offer_working_hours.isMultiple || false}
        />
      </Col>
    ),
    [formValues[offer_working_hours.name]]
  )

  const offerBenefitsField = useMemo(
    () => (
      <Col className={inputClassname} xs={12}>
        <SelectChip
          inputValue={formValues[offer_benefits.name]}
          handleChange={handleChange}
          handleDeleteChip={handleDeleteChip}
          name={offer_benefits.name}
          label={offer_benefits.label}
          selectOptions={offer_benefits.values}
          isRequired={offer_benefits.isRequired || false}
          isMultiple={offer_benefits.isMultiple || false}
        />
      </Col>
    ),
    [formValues[offer_benefits.name]]
  )

  return (
    <Row className="HT__FormGenerator StepFive">
      {offerSalaryField}
      {offerSalaryCurrencyField}
      {offerSalaryMinField}
      {offerSalaryMaxField}
      {offerSalaryIntervalField}
      {offerWorkingDaysField}
      {offerWorkingHoursField}
      {offerBenefitsField}
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  type: PropTypes.oneOf(['user', 'company']),
  formFields: PropTypes.shape({
    offer_salary_id: PropTypes.object,
    offer_salary_currency_id: PropTypes.object,
    offer_salary_min: PropTypes.object,
    offer_salary_max: PropTypes.object,
    offer_salary_interval_id: PropTypes.object,
    offer_working_days: PropTypes.object,
    offer_working_hours: PropTypes.object,
    offer_benefits: PropTypes.object
  }).isRequired
}
