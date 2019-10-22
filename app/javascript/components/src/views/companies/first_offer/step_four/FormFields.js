import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import SelectChip from '../../../../components/FormsLayout/Fields/SelectChip'
import Slider from '../../../../components/FormsLayout/Fields/Slider'
import DatePicker from '../../../../components/FormsLayout/Fields/DatePicker'
import Checkbox from '../../../../components/FormsLayout/Fields/Checkbox'
import {
  handleDeleteChip,
  handleChange,
  handleSimpleChange,
  handleBoolean
} from '../../../../components/FormsLayout/handleFunctions'

const FormFields = props => {
  const { formFields } = props
  const {
    contract_type_id = null,
    vacancies_quantity = null,
    sex_id = null,
    offer_candidate_age = null,
    close_date = null,
    immediate_start = null
  } = formFields

  const [formValues, setFormValues] = useState({
    [contract_type_id.name]: contract_type_id.current_value || '',
    [vacancies_quantity.name]: vacancies_quantity.current_value || '',
    [sex_id.name]: sex_id.current_value || '',
    [offer_candidate_age.name]: offer_candidate_age.current_value || '',
    [close_date.name]: close_date.current_value || new Date(),
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
          isRequired={contract_type_id.isRequired || false}
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
          isRequired={vacancies_quantity.isRequired || false}
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
          isRequired={sex_id.isRequired || false}
        />
      </Col>
    ),
    [formValues[sex_id.name]]
  )

  const offerCandidateAgeField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <Slider
          inputValue={formValues[offer_candidate_age.name]}
          handleSimpleChange={handleSimpleChange(formValues, setFormValues)}
          currentValue={offer_candidate_age.currentValue}
          name={offer_candidate_age.name}
          label={offer_candidate_age.label}
          beforeLabel={offer_candidate_age.beforeLabel}
          afterLabel={offer_candidate_age.afterLabel}
          values={offer_candidate_age.values}
          step={offer_candidate_age.step}
          isMultiple
          isRequired={offer_candidate_age.isRequired || false}
        />
      </Col>
    ),
    [formValues[offer_candidate_age.name]]
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
          isRequired={close_date.isRequired || false}
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
          handleBoolean={handleBoolean(formValues, setFormValues)}
          name={immediate_start.name}
          label={immediate_start.label}
          description={immediate_start.description}
          isRequired={immediate_start.isRequired || false}
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
      {offerCandidateAgeField}
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
    offer_candidate_age: PropTypes.object,
    close_date: PropTypes.object,
    immediate_start: PropTypes.object
  }).isRequired
}
