import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import SelectChip from '../../../../../components/FormsLayout/Fields/SelectChip'
import {
  handleChange,
  handleDeleteChip
} from '../../../../../components/FormsLayout/handleFunctions'

const FormFields = props => {
  const { formFields } = props
  const {
    job_category_ids = null,
    offer_type_ids = null,
    contract_type_id = null,
    work_mode_ids = null,
    labor_disponibility_id = null
  } = formFields

  const [formValues, setFormValues] = useState({
    [job_category_ids.name]: '',
    [offer_type_ids.name]: '',
    [contract_type_id.name]: '',
    [work_mode_ids.name]: '',
    [labor_disponibility_id.name]: ''
  })

  const inputClassname = 'my-30 animated fadeIn'

  const jobCategoryIDsField = useMemo(
    () => (
      <Col
        key={job_category_ids.name}
        className={inputClassname}
        xs={12}
        lg={12}
      >
        <SelectChip
          inputValue={formValues[job_category_ids.name]}
          inputName={job_category_ids.name}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={job_category_ids.name}
          label={job_category_ids.label}
          selectOptions={job_category_ids.values}
          isMultiple
        />
      </Col>
    ),
    [formValues[job_category_ids.name]]
  )

  const offerTypeIDsField = useMemo(
    () => (
      <Col key={offer_type_ids.name} className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[offer_type_ids.name]}
          inputName={offer_type_ids.name}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={offer_type_ids.name}
          label={offer_type_ids.label}
          selectOptions={offer_type_ids.values}
          isMultiple={false}
        />
      </Col>
    ),
    [formValues[offer_type_ids.name]]
  )

  const contractTypeIDField = useMemo(
    () => (
      <Col
        key={contract_type_id.name}
        className={inputClassname}
        xs={12}
        lg={6}
      >
        <SelectChip
          inputValue={formValues[contract_type_id.name]}
          inputName={contract_type_id.name}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={contract_type_id.name}
          label={contract_type_id.label}
          selectOptions={contract_type_id.values}
          isMultiple
        />
      </Col>
    ),
    [formValues[contract_type_id.name]]
  )

  const workModeIDsField = useMemo(
    () => (
      <Col key={work_mode_ids.name} className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[work_mode_ids.name]}
          inputName={work_mode_ids.name}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={work_mode_ids.name}
          label={work_mode_ids.label}
          selectOptions={work_mode_ids.values}
          isMultiple
        />
      </Col>
    ),
    [formValues[work_mode_ids.name]]
  )

  const laborDisponibilityIDField = useMemo(
    () => (
      <Col
        key={labor_disponibility_id.name}
        className={inputClassname}
        xs={12}
        lg={6}
      >
        <SelectChip
          inputValue={formValues[labor_disponibility_id.name]}
          inputName={labor_disponibility_id.name}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={labor_disponibility_id.name}
          label={labor_disponibility_id.label}
          selectOptions={labor_disponibility_id.values}
          isMultiple={false}
        />
      </Col>
    ),
    [formValues[labor_disponibility_id.name]]
  )

  return (
    <Row className="HT__FormGenerator">
      {jobCategoryIDsField}
      {offerTypeIDsField}
      {contractTypeIDField}
      {workModeIDsField}
      {laborDisponibilityIDField}
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  formFields: PropTypes.shape({
    job_category_ids: PropTypes.object,
    offer_type_ids: PropTypes.object,
    contract_type_id: PropTypes.object,
    work_mode_ids: PropTypes.object,
    labor_disponibility_id: PropTypes.object
  }).isRequired
}
