import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import SelectChip from '../../../../../components/FormsLayout/Fields/SelectChip'
import Select from '../../../../../components/FormsLayout/Fields/Select'
import StandardInput from '../../../../../components/FormsLayout/Fields/StandardInput'
import {
  handleDeleteChip,
  handleChange
} from '../../../../../components/FormsLayout/handleFunctions'

const FormFields = props => {

  console.log(props)

  const { formFields } = props
  const {
    job_category_id = null,
    language_id = null,
    level_id = null,
    soft_skill_ids = null,
    technical_skill_id = null
  } = formFields

/*   const [formValues, setFormValues] = useState({
    [range_type.name]: 1,
    [from.name]: '',
    [to.name]: '',
    [currency_id.name]: '',
    [salary_period_id.name]: '',
    [available_work_day_ids.name]: '',
    [working_day_ids.name]: ''
  }) */

  const inputClassname = 'my-30 animated fadeIn'


  const controlledInputsClassname =
  'animated fadeIn controlledInputs inputField mt-20'

  //old
  /*
  const availableWorkDayIDsField = useMemo(
    () => (
      <Col
        key={available_work_day_ids.name}
        className={inputClassname}
        xs={12}
        lg={12}
      >
        <SelectChip
          inputValue={formValues[available_work_day_ids.name]}
          inputName={available_work_day_ids.name}
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

  const workingDayIDsField = useMemo(
    () => (
      <Col
        key={working_day_ids.name}
        className={inputClassname}
        xs={12}
        lg={12}
      >
        <SelectChip
          inputValue={formValues[working_day_ids.name]}
          inputName={working_day_ids.name}
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

  const rangeTypeField = useMemo(
    () => (
      <Col className={controlledInputsClassname} xs={12} lg={3}>
        <Select
          inputValue={formValues[range_type.name]}
          handleChange={handleChange(formValues, setFormValues)}
          name={range_type.name}
          label={range_type.label}
          selectOptions={range_type.values}
          isRequired={range_type.isRequired || false}
        />
      </Col>
    ),
    [formValues[range_type.name]]
  )

  const CurrencyIDField = useMemo(
    () => (
      <Col className={controlledInputsClassname} xs={12} lg={2}>
        <Select
          inputValue={formValues[currency_id.name]}
          handleChange={handleChange(formValues, setFormValues)}
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
          handleChange={handleChange(formValues, setFormValues)}
          name={from.name}
          placeholder={from.placeholder || 'ejem: 750.000'}
          style={{ width: '100%' }}
        />
      </Col>
    ),
    [formValues[from.name]]
  )

  const offerSalaryMaxField = useMemo(
    () =>
      formValues[range_type.name] === 1 ? (
        <Col className={`pr-0 ${controlledInputsClassname}`} xs={12} lg={2}>
          <StandardInput
            inputValue={formValues[to.name]}
            handleChange={handleChange(formValues, setFormValues)}
            name={to.name}
            placeholder={to.placeholder || 'ejem: 750.000'}
            beforeLabel={to.beforeLabel || 'ejem: 750.000'}
            style={{ width: '100%' }}
          />
        </Col>
      ) : null,
    [formValues[to.name], formValues[range_type.name]]
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
          isRequired={salary_period_id.isRequired || false}
        />
      </Col>
    ),
    [formValues[salary_period_id.name]]
  ) */

  return (
    <Row className="HT__FormGenerator">
      {}
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  formFields: PropTypes.shape({
    range_type: PropTypes.object,
    from: PropTypes.object,
    to: PropTypes.object,
    currency_id: PropTypes.object,
    salary_period_id: PropTypes.object,
    available_work_day_ids: PropTypes.object,
    working_day_ids: PropTypes.object
  }).isRequired
}
