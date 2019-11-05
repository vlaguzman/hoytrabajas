import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import SelectChip from '../../../../../components/FormsLayout/Fields/SelectChip'
import Slider from '../../../../../components/FormsLayout/Fields/Slider'
import DatePicker from '../../../../../components/FormsLayout/Fields/DatePicker'
import Checkbox from '../../../../../components/FormsLayout/Fields/Checkbox'
import {
  handleDeleteChip,
  handleChange,
  handleSimpleChange,
  handleBoolean
} from '../../../../../components/FormsLayout/handleFunctions'

const FormFields = props => {
  const { formFields } = props
  const {
    contract_type_id = null,
    vacancies_quantity = null,
    sex_ids = null,
    offer_age_range = null,
    close_date = null,
    immediate_start = null
  } = formFields

  function closeDateCurrentValue() {
    return (close_date.current_value === '') ? Date.now() : new Date(close_date.current_value)
  }

  const [formValues, setFormValues] = useState({
    [contract_type_id.name]: contract_type_id.current_value || '',
    [vacancies_quantity.name]: vacancies_quantity.current_value || '',
    [sex_ids.name]: sex_ids.current_value || '',
    [offer_age_range.name]: offer_age_range.current_value || '',
    [close_date.name]: closeDateCurrentValue(),
    [immediate_start.name]: immediate_start.current_value || false
  })

  const inputClassname = 'my-30 animated fadeIn inputField'

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
          isRequired
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
          isRequired
        />
      </Col>
    ),
    [formValues[sex_ids.name]]
  )

  const offerAgeRangeField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <Slider
          inputValue={formValues[offer_age_range.name]}
          handleSimpleChange={handleSimpleChange(formValues, setFormValues)}
          currentValue={offer_age_range.currentValue}
          name={offer_age_range.name}
          label={offer_age_range.label}
          beforeLabel={offer_age_range.beforeLabel}
          afterLabel={offer_age_range.afterLabel}
          values={offer_age_range.values}
          step={offer_age_range.step}
          isMultiple
          isRequired={false}
        />
      </Col>
    ),
    [formValues[offer_age_range.name]]
  )

  const closeDateField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <DatePicker
          inputValue={formValues[close_date.name]}
          handleSimpleChange={handleSimpleChange(formValues, setFormValues)}
          name={close_date.name}
          label={close_date.label}
          dateOptions={close_date.dateOptions}
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
      {contractTypeField}
      {vacanciesQuantityField}
      {sexField}
      {offerAgeRangeField}
      {closeDateField}
      {immediateStartField}
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  formFields: PropTypes.shape({
    contract_type_id: PropTypes.object,
    vacancies_quantity: PropTypes.object,
    sex_ids: PropTypes.object,
    offer_age_range: PropTypes.object,
    close_date: PropTypes.object,
    immediate_start: PropTypes.object
  }).isRequired
}
