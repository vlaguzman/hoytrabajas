import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import Select from '../../../../../components/FormsLayout/Fields/Select'
import SelectChip from '../../../../../components/FormsLayout/Fields/SelectChip'
import StandardInput from '../../../../../components/FormsLayout/Fields/StandardInput'
import {
  handleDeleteChip,
  handleChange
} from '../../../../../components/FormsLayout/handleFunctions'

const FormFields = props => {
  const { formFields } = props

  const {
    is_range = null,
    currency_id = null,
    from = null,
    to = null,
    salary_period_id = null,
    working_day_ids = null,
    available_work_day_ids = null,
    job_aid_ids = null
  } = formFields

  const [formValues, setFormValues] = useState({
    [is_range.name]: is_range.current_value || 'false',
    [currency_id.name]: currency_id.current_value || '',
    [from.name]: from.current_value || '',
    [to.name]: to.current_value || '',
    [salary_period_id.name]: salary_period_id.current_value || '',
    [working_day_ids.name]: working_day_ids.current_value || '',
    [available_work_day_ids.name]: available_work_day_ids.current_value || '',
    [job_aid_ids.name]: job_aid_ids.current_value || ''
  })

  const inputClassname = 'my-30 animated fadeIn inputField'

  const controlledInputsClassname =
    'animated fadeIn controlledInputs inputField mt-20'

  const offerSalaryField = useMemo(
    () => (
      <Col className={controlledInputsClassname} xs={12} lg={3}>
        <Select
          inputValue={formValues[is_range.name]}
          handleChange={handleChange(formValues, setFormValues)}
          name={is_range.name}
          label={is_range.label}
          selectOptions={is_range.values}
        />
      </Col>
    ),
    [formValues[is_range.name]]
  )

  const offerSalaryCurrencyField = useMemo(
    () => (
      <Col className={controlledInputsClassname} xs={12} lg={2}>
        <Select
          inputValue={formValues[currency_id.name]}
          handleChange={handleChange(formValues, setFormValues)}
          name={currency_id.name}
          selectOptions={currency_id.values}
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
          handleChange={handleChange(formValues, setFormValues)}
          name={from.name}
          placeholder={from.placeholder || 'Ejem. 750.000'}
          style={{ width: '100%' }}
        />
      </Col>
    ),
    [formValues[from.name]]
  )

  const offerSalaryMaxField = useMemo(
    () =>
      formValues[is_range.name] === 'true' ? (
        <Col className={`pr-0 ${controlledInputsClassname}`} xs={12} lg={2}>
          <StandardInput
            inputValue={formValues[to.name]}
            handleChange={handleChange(formValues, setFormValues)}
            name={to.name}
            placeholder={to.placeholder || 'Ejem. 750.000'}
            style={{ width: '100%' }}
          />
        </Col>
      ) : null,
    [formValues[to.name], formValues[is_range.name]]
  )

  const offerSalaryIntervalField = useMemo(
    () => (
      <Col className={controlledInputsClassname} xs={12} lg={3}>
        <Select
          inputValue={formValues[salary_period_id.name]}
          handleChange={handleChange(formValues, setFormValues)}
          name={salary_period_id.name}
          label={salary_period_id.label}
          selectOptions={salary_period_id.values}
        />
      </Col>
    ),
    [formValues[salary_period_id.name]]
  )

  const offerWorkingDaysField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[available_work_day_ids.name]}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={available_work_day_ids.name}
          label={available_work_day_ids.label}
          selectOptions={available_work_day_ids.values}
          isMultiple
        />
      </Col>
    ),
    [formValues[available_work_day_ids.name]]
  )

  const offerWorkingHoursField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[working_day_ids.name]}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={working_day_ids.name}
          label={working_day_ids.label}
          selectOptions={working_day_ids.values}
          isMultiple
        />
      </Col>
    ),
    [formValues[working_day_ids.name]]
  )

  const offerBenefitsField = useMemo(
    () => (
      <Col className={inputClassname} xs={12}>
        <SelectChip
          inputValue={formValues[job_aid_ids.name]}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={job_aid_ids.name}
          label={job_aid_ids.label}
          selectOptions={job_aid_ids.values}
          isMultiple
        />
      </Col>
    ),
    [formValues[job_aid_ids.name]]
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
  formFields: PropTypes.shape({
    is_range: PropTypes.object,
    currency_id: PropTypes.object,
    from: PropTypes.object,
    to: PropTypes.object,
    salary_period_id: PropTypes.object,
    working_day_ids: PropTypes.object,
    available_work_day_ids: PropTypes.object,
    job_aid_ids: PropTypes.object
  }).isRequired
}
