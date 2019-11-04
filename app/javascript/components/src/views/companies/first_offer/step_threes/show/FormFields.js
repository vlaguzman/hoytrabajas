import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import StandardInput from '../../../../../components/FormsLayout/Fields/StandardInput'
import SelectChip from '../../../../../components/FormsLayout/Fields/SelectChip'
import {
  handleChange,
  handleDeleteChip
} from '../../../../../components/FormsLayout/handleFunctions'

const FormFields = props => {
  const { formFields } = props

  const {
    title = null,
    job_category_id = null,
    offers_work_positions = null,
    offer_type_id = null,
    work_mode_id = null
  } = formFields

  const [formValues, setFormValues] = useState({
    [title.name]: title.current_value || '',
    [job_category_id.name]: job_category_id.current_value || '',
    [offers_work_positions.name]: offers_work_positions.current_value || '',
    [offer_type_id.name]: offer_type_id.current_value || '',
    [work_mode_id.name]: work_mode_id.current_value || ''
  })

  const inputClassname = 'my-30 animated fadeIn inputField'

  const titleField = useMemo(
    () => (
      <Col key={title.name} className={inputClassname} xs={12} lg={12}>
        <StandardInput
          isTextArea
          inputValue={formValues[title.name]}
          inputName={title.name}
          handleChange={handleChange(formValues, setFormValues)}
          name={title.name}
          label={title.label}
        />
      </Col>
    ),
    [formValues[title.name]]
  )

  const jobCategoryField = useMemo(
    () => (
      <Col key={job_category_id.name} className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[job_category_id.name]}
          inputName={job_category_id.name}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={job_category_id.name}
          label={job_category_id.label}
          selectOptions={job_category_id.values}
          isMultiple={false}
        />
      </Col>
    ),
    [formValues[job_category_id.name]]
  )

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

  const offersWorkPositionsField = useMemo(
    () => (
      <Col
        key={offers_work_positions.name}
        className={inputClassname}
        xs={12}
        lg={6}
      >
        <SelectChip
          inputValue={formValues[offers_work_positions.name]}
          inputName={offers_work_positions.name}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={offers_work_positions.name}
          label={offers_work_positions.label}
          selectOptions={offers_work_positions.values}
          isMultiple={false}
        />
      </Col>
    ),
    [formValues[offers_work_positions.name]]
  )

  return (
    <Row className="HT__FormGenerator">
      {titleField}
      {jobCategoryField}
      {offerTypeField}
      {workModeField}
      {offersWorkPositionsField}
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  formFields: PropTypes.shape({
    title: PropTypes.object,
    job_category_id: PropTypes.object,
    offer_type_id: PropTypes.object,
    work_mode_id: PropTypes.object,
    offers_work_positions: PropTypes.object
  }).isRequired
}
