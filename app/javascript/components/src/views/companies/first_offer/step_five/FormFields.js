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
    currency_id = null,
    from = null,
    to = null,
    salary_type_id_id = null,
    available_work_day_id = null,
    working_day_id = null,
    job_aid_id = null
  } = formFields

  const [formValues, setFormValues] = useState({
    [offer_salary_id.name]: offer_salary_id.current_value || '',
    [currency_id.name]: currency_id.current_value || '',
    [from.name]: from.current_value || '',
    [to.name]: to.current_value || '',
    [salary_type_id_id.name]: salary_type_id_id.current_value || '',
    [available_work_day_id.name]: available_work_day_id.current_value || '',
    [working_day_id.name]: working_day_id.current_value || '',
    [job_aid_id.name]: job_aid_id.current_value || ''
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
          inputValue={formValues[currency_id.name]}
          handleChange={handleChange}
          name={currency_id.name}
          selectOptions={currency_id.values}
          isRequired={currency_id.isRequired || false}
        />
      </Col>
    ),
    [formValues[currency_id.name]]
  )

  const offerSalaryMinField = useMemo(
    () => (
      <Col className={controlledInputsClassname} style={{ flex: 1 }}>
        <StandardInput
          inputValue={formValues[from.name]}
          handleChange={handleChange}
          name={from.name}
          placeholder={from.placeholder || ''}
          style={{ width: '100%' }}
        />
      </Col>
    ),
    [formValues[from.name]]
  )

  const offerSalaryMaxField = useMemo(
    () =>
      formValues[offer_salary_id.name] === 1 ? (
        <Col className={`pr-0 ${controlledInputsClassname}`} xs={12} lg={2}>
          <StandardInput
            inputValue={formValues[to.name]}
            handleChange={handleChange}
            name={to.name}
            placeholder={to.placeholder || ''}
            beforeLabel={to.beforeLabel || ''}
            style={{ width: '100%' }}
          />
        </Col>
      ) : null,
    [formValues[to.name], formValues[offer_salary_id.name]]
  )

  const offerSalaryIntervalField = useMemo(
    () => (
      <Col className={controlledInputsClassname} xs={12} lg={3}>
        <Select
          inputValue={formValues[salary_type_id_id.name]}
          handleChange={handleChange}
          name={salary_type_id_id.name}
          label={salary_type_id_id.label}
          selectOptions={salary_type_id_id.values}
          isRequired={salary_type_id_id.isRequired || false}
        />
      </Col>
    ),
    [formValues[salary_type_id_id.name]]
  )

  const offerWorkingDaysField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[available_work_day_id.name]}
          handleChange={handleChange}
          handleDeleteChip={handleDeleteChip}
          name={available_work_day_id.name}
          label={available_work_day_id.label}
          selectOptions={available_work_day_id.values}
          isRequired={available_work_day_id.isRequired || false}
          isMultiple={available_work_day_id.isMultiple || false}
        />
      </Col>
    ),
    [formValues[available_work_day_id.name]]
  )

  const offerWorkingHoursField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[working_day_id.name]}
          handleChange={handleChange}
          handleDeleteChip={handleDeleteChip}
          name={working_day_id.name}
          label={working_day_id.label}
          selectOptions={working_day_id.values}
          isRequired={working_day_id.isRequired || false}
          isMultiple={working_day_id.isMultiple || false}
        />
      </Col>
    ),
    [formValues[working_day_id.name]]
  )

  const offerBenefitsField = useMemo(
    () => (
      <Col className={inputClassname} xs={12}>
        <SelectChip
          inputValue={formValues[job_aid_id.name]}
          handleChange={handleChange}
          handleDeleteChip={handleDeleteChip}
          name={job_aid_id.name}
          label={job_aid_id.label}
          selectOptions={job_aid_id.values}
          isRequired={job_aid_id.isRequired || false}
          isMultiple={job_aid_id.isMultiple || false}
        />
      </Col>
    ),
    [formValues[job_aid_id.name]]
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
    currency_id: PropTypes.object,
    from: PropTypes.object,
    to: PropTypes.object,
    salary_type_id_id: PropTypes.object,
    available_work_day_id: PropTypes.object,
    working_day_id: PropTypes.object,
    job_aid_id: PropTypes.object
  }).isRequired
}
