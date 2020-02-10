import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import StandardInput from '../../../../../components/FormsLayout/Fields/StandardInput'
import SelectChip from '../../../../../components/FormsLayout/Fields/SelectChip'
import SelectFindOrCreate from '../../../../../components/FormsLayout/Fields/SelectFindOrCreate'
import Checkbox from '../../../../../components/FormsLayout/Fields/Checkbox'
import {
  handleChange,
  handleDeleteChip,
  handleBoolean
} from '../../../../../components/FormsLayout/handleFunctions'

const FormFields = props => {
  const { formFields, tooltip_description } = props

  const {
    title = null,
    confidential = null,
    description = null,
    job_category_ids = null,
    offers_work_positions = null,
    offer_type_id = null,
    work_mode_id = null
  } = formFields

  const [formValues, setFormValues] = useState({
    [title.name]: title.current_value || '',
    [confidential.name]: confidential.current_value || 'false',
    [description.name]: description.current_value || '',
    [job_category_ids.name]: job_category_ids.current_value || '',
    [offers_work_positions.name]: offers_work_positions.current_value || '',
    [offer_type_id.name]: offer_type_id.current_value || '',
    [work_mode_id.name]: work_mode_id.current_value || ''
  })

  const inputClassname = 'my-30 animated fadeIn inputField'

  const titleField = useMemo(
    () => (
      <Col key={title.name} className={inputClassname} xs={12} lg={6}>
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

  const offerConfidentialField = useMemo(
    () => (
      <Col key={confidential.name} className={inputClassname} xs={12} lg={6}>
        <Checkbox
          inputValue={formValues[confidential.name]}
          handleBoolean={handleBoolean(setFormValues)}
          name={confidential.name}
          description={confidential.label}
          tooltip_description={confidential.tooltip}
          isRequired={false}
        />
      </Col>
    ),
    [formValues[confidential.name]]
  )

  const descriptionField = useMemo(
    () => (
      <Col key={description.name} className={inputClassname} xs={12} lg={12}>
        <StandardInput
          isTextArea
          inputValue={formValues[description.name]}
          inputName={description.name}
          handleChange={handleChange(formValues, setFormValues)}
          name={description.name}
          label={description.label}
        />
      </Col>
    ),
    [formValues[description.name]]
  )

  const jobCategoryField = useMemo(
    () => (
      <Col
        key={job_category_ids.name}
        className={inputClassname}
        xs={12}
        lg={6}
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
        <SelectFindOrCreate
          id={offers_work_positions.name}
          label={offers_work_positions.label}
          name={offers_work_positions.name}
          input_value={offers_work_positions.current_value}
          options={offers_work_positions.values}
          tooltip_description={tooltip_description['press_enter']}
        />
      </Col>
    ),
    [formValues[offers_work_positions.name]]
  )

  return (
    <Row className="HT__FormGenerator">
      {titleField}
      {offerConfidentialField}
      {descriptionField}
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
    confidential: PropTypes.object,
    job_category_ids: PropTypes.object,
    offer_type_id: PropTypes.object,
    work_mode_id: PropTypes.object,
    offers_work_positions: PropTypes.object
  }).isRequired,
  tooltip_description: PropTypes.shape({
    press_enter: PropTypes.string.isRequired
  }).isRequired
}
