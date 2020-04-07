import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import SelectChip from '../../../../../src/components/FormsLayout/Fields/SelectChip'
import Slider from '../../../../../src/components/FormsLayout/Fields/Slider'
import DatePicker from '../../../../../src/components/FormsLayout/Fields/DatePicker'
import Checkbox from '../../../../../src/components/FormsLayout/Fields/Checkbox'
import { maxDate } from '../../../../../utils/date_functions'
import {
  handleDeleteChip,
  handleChange,
  handleSimpleChange,
  handleBoolean
} from '../../../../../src/components/FormsLayout/handleFunctions'

const FormFields = props => {
  const { formFields } = props
  const {
    offer_type_id = null,
    work_mode_id = null,
    contract_type_id = null,
    vacancies_quantity = null,
    sex_ids = null,
    age_range_list_ids = null,
    close_date = null,
    immediate_start = null
  } = formFields

  const [formValues, setFormValues] = useState({
    [offer_type_id.name]: offer_type_id.current_value || '',
    [work_mode_id.name]: work_mode_id.current_value || '',
    [contract_type_id.name]: contract_type_id.current_value || '',
    [vacancies_quantity.name]: vacancies_quantity.current_value || '',
    [sex_ids.name]: sex_ids.current_value || '',
    [age_range_list_ids.name]: age_range_list_ids.current_value || '',
    [close_date.name]: close_date.current_value
      ? new Date(close_date.current_value)
      : null,
    [immediate_start.name]: immediate_start.current_value || false
  })

  const inputClassname = 'my-30 animated fadeIn inputField'

  const dateOptions = {
    format: 'dd/MM/yyyy',
    disablePast: true,
    maxDate: maxDate(),
    emptyLabel: '...'
  }

  const offerTypeField = useMemo(
    () => (
      <Col key={offer_type_id.name} className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[offer_type_id.name]}
          inputName={offer_type_id.name}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={offer_type_id.name}
          label={offer_type_id.label}
          selectOptions={offer_type_id.values}
          isMultiple={false}
        />
      </Col>
    ),
    [formValues[offer_type_id.name]]
  )

  const workModeField = useMemo(
    () => (
      <Col key={work_mode_id.name} className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[work_mode_id.name]}
          inputName={work_mode_id.name}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={work_mode_id.name}
          label={work_mode_id.label}
          selectOptions={work_mode_id.values}
          isMultiple={false}
        />
      </Col>
    ),
    [formValues[work_mode_id.name]]
  )

  const contractTypeField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[contract_type_id.name]}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={contract_type_id.name}
          label={contract_type_id.label}
          selectOptions={contract_type_id.values}
        />
      </Col>
    ),
    [formValues[contract_type_id.name]]
  )

  const vacanciesQuantityField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <Slider
          inputValue={formValues[vacancies_quantity.name]}
          handleSimpleChange={handleSimpleChange(formValues, setFormValues)}
          currentValue={vacancies_quantity.currentValue}
          name={vacancies_quantity.name}
          label={vacancies_quantity.label}
          values={vacancies_quantity.values}
          step={vacancies_quantity.step}
          isMultiple={false}
          isRequired={false}
        />
      </Col>
    ),
    [formValues[vacancies_quantity.name]]
  )

  const sexField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[sex_ids.name]}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={sex_ids.name}
          label={sex_ids.label}
          selectOptions={sex_ids.values}
          isMultiple
        />
      </Col>
    ),
    [formValues[sex_ids.name]]
  )

  const AgeRangeListField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[age_range_list_ids.name]}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={age_range_list_ids.name}
          label={age_range_list_ids.label}
          selectOptions={age_range_list_ids.values}
          isMultiple
        />
      </Col>
    ),
    [formValues[age_range_list_ids.name]]
  )

  const closeDateField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <DatePicker
          inputValue={formValues[close_date.name]}
          handleSimpleChange={handleSimpleChange(formValues, setFormValues)}
          name={close_date.name}
          label={close_date.label}
          dateOptions={dateOptions}
          isRequired={false}
        />
      </Col>
    ),
    [formValues[close_date.name]]
  )

  const immediateStartField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <Checkbox
          inputValue={formValues[immediate_start.name]}
          handleBoolean={handleBoolean(setFormValues)}
          name={immediate_start.name}
          label={immediate_start.label}
          description={immediate_start.description}
          isRequired={false}
        />
      </Col>
    ),
    [formValues[immediate_start.name]]
  )

  return (
    <Row className="HT__FormGenerator">
      {offerTypeField}
      {workModeField}
      {contractTypeField}
      {vacanciesQuantityField}
      {sexField}
      {AgeRangeListField}
      {closeDateField}
      {immediateStartField}
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  formFields: PropTypes.shape({
    offer_type_id: PropTypes.object,
    work_mode_id: PropTypes.object,
    contract_type_id: PropTypes.object,
    vacancies_quantity: PropTypes.object,
    sex_ids: PropTypes.object,
    age_range_list_ids: PropTypes.object,
    close_date: PropTypes.object,
    immediate_start: PropTypes.object
  }).isRequired
}
