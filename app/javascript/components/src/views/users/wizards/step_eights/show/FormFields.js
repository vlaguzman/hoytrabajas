import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import SelectChip from '../../../../../components/FormsLayout/Fields/SelectChip'
import Select from '../../../../../components/FormsLayout/Fields/Select'
import StandardInput from '../../../../../components/FormsLayout/Fields/StandardInput'
import DatePicker from '../../../../../components/FormsLayout/Fields/DatePicker'
import Checkbox from '../../../../../components/FormsLayout/Fields/Checkbox'

import {
  handleDeleteChip,
  handleChange,
  handleSimpleChange,
  handleBoolean
} from '../../../../../components/FormsLayout/handleFunctions'


const inputClassname = 'my-30 animated fadeIn inputField'

const controlledInputsClassname =
'animated fadeIn controlledInputs inputField mt-20'

const dateOptions = {
  format: 'dd MMMM yyyy',
  disableFuture: false,
  emptyLabel: '...'
}

const FormFields = props => {
  const { formFields } = props
  const {
    job_category_id = null,
    company_name = null,
    work_position_id = null,
    work_methodology_id = null,
    city_id = null,
    finished_at = null,
    started_at = null,
    technical_skill_ids = null,
    still_in_progress = null,
  } = formFields

  const [formValues, setFormValues] = useState({
    [job_category_id.name]: '',
    [company_name.name]: '',
    [work_position_id.name]: '',
    [work_methodology_id.name]: '',
    [city_id.name]: '',
    [technical_skill_ids.name]: '',
    [started_at.name]: new Date(),
    [finished_at.name]: new Date(),
    [still_in_progress.name]: false
  })

  const jobCategoryIDField = useMemo(
    () => (
      <Col
        key={job_category_id.name}
        className={inputClassname}
        xs={12}
        lg={6}
      >
        <SelectChip
          inputValue={formValues[job_category_id.name]}
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

  const companyNameField = useMemo(
    () => (
      <Col key={company_name.name} className={inputClassname} xs={12} lg={12}>
        <StandardInput
          inputValue={formValues[company_name.name]}
          handleChange={handleChange(formValues, setFormValues)}
          name={company_name.name}
          label={company_name.label}
        />
      </Col>
    ),
    [formValues[company_name.name]]
  )

  const workPositionIDField = useMemo(
    () => (
      <Col
        key={work_position_id.name}
        className={inputClassname}
        xs={12}
        lg={6}
      >
        <SelectChip
          inputValue={formValues[work_position_id.name]}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={work_position_id.name}
          label={work_position_id.label}
          selectOptions={work_position_id.values}
          isMultiple={false}
        />
      </Col>
    ),
    [formValues[work_position_id.name]]
  )

  const workMethodologyIDField = useMemo(
    () => (
      <Col
        key={work_methodology_id.name}
        className={inputClassname}
        xs={12}
        lg={6}
      >
        <SelectChip
          inputValue={formValues[work_methodology_id.name]}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={work_methodology_id.name}
          label={work_methodology_id.label}
          selectOptions={work_methodology_id.values}
          isMultiple={false}
        />
      </Col>
    ),
    [formValues[work_methodology_id.name]]
  )

  const cityIDField = useMemo(
    () => (
      <Col
        key={city_id.name}
        className={inputClassname}
        xs={12}
        lg={6}
      >
        <SelectChip
          inputValue={formValues[city_id.name]}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={city_id.name}
          label={city_id.label}
          selectOptions={city_id.values}
          isMultiple={false}
        />
      </Col>
    ),
    [formValues[city_id.name]]
  )

  const technicalSkillIDsField = useMemo(
    () => (
      <Col
        key={technical_skill_ids.name}
        className={inputClassname}
        xs={12}
        lg={12}
      >
        <SelectChip
          inputValue={formValues[technical_skill_ids.name]}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={technical_skill_ids.name}
          label={technical_skill_ids.label}
          selectOptions={technical_skill_ids.values}
          isMultiple
        />
      </Col>
    ),
    [formValues[technical_skill_ids.name]]
  )

  const startedAtField = useMemo(
    () => (
      <Col key={started_at.name} className={inputClassname} xs={12} lg={ (formValues[still_in_progress.name]) ? 6 :3 }>
        <DatePicker
          name={started_at.name}
          inputValue={formValues[started_at.name]}
          handleSimpleChange={handleSimpleChange(formValues, setFormValues)}
          label={started_at.label}
          dateOptions={dateOptions}
        />
      </Col>
    ),
    [formValues[started_at.name], formValues[still_in_progress.name]]
  )

  const finishedAtField = useMemo(
    () => (
      <Col key={finished_at.name} className={inputClassname} xs={12} lg={3}>
        <DatePicker
          name={finished_at.name}
          inputValue={(formValues[still_in_progress.name]) ? null : formValues[finished_at.name]}
          handleSimpleChange={handleSimpleChange(formValues, setFormValues)}
          label={finished_at.label}
          dateOptions={dateOptions}
        />
      </Col>
    ),
    [formValues[finished_at.name]]
  )

  const inProgressField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <Checkbox
          inputValue={formValues[still_in_progress.name]}
          handleBoolean={handleBoolean(setFormValues)}
          name={still_in_progress.name}
          label=""
          description={still_in_progress.label}
          isRequired={false}
        />
      </Col>
    ),
    [formValues[still_in_progress.name]]
  )

  return (
    <Row className="HT__FormGenerator">
      {companyNameField}
      {jobCategoryIDField}
      {workPositionIDField}
      {workMethodologyIDField}
      {cityIDField}
      {technicalSkillIDsField}
      {startedAtField}
      { !formValues[still_in_progress.name] && finishedAtField }
      {inProgressField}
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  formFields: PropTypes.shape({
    job_category_id: PropTypes.object,
    company_name: PropTypes.object,
    work_position_id: PropTypes.object,
    work_methodology_id: PropTypes.object,
    city_id: PropTypes.object,
    finished_at: PropTypes.object,
    started_at: PropTypes.object,
    technical_skill_ids: PropTypes.object,
    still_in_progress: PropTypes.object
  }).isRequired
}
