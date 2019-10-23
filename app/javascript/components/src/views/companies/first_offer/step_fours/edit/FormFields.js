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
    sex_id = null,
    offer_age_range = null,
    close_date = null,
    immediate_start = null
  } = formFields

  const [formValues, setFormValues] = useState({
    [contract_type_id.name]: '',
    [vacancies_quantity.name]: '',
    [sex_id.name]: '',
    [offer_age_range.name]: '',
    [close_date.name]: new Date(),
    [immediate_start.name]: false
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
          isRequired={true}
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
          inputValue={formValues[sex_id.name]}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={sex_id.name}
          label={sex_id.label}
          selectOptions={sex_id.values}
          isMultiple
          isRequired={false}
        />
      </Col>
    ),
    [formValues[sex_id.name]]
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
          isRequired={true}
          dateOptions={close_date.dateOptions}
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
          isRequired={true}
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
    sex_id: PropTypes.object,
    offer_age_range: PropTypes.object,
    close_date: PropTypes.object,
    immediate_start: PropTypes.object
  }).isRequired
}
