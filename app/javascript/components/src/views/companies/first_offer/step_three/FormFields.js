import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import StandardInput from '../../../../components/FormsLayout/Fields/StandardInput'
import SelectChip from '../../../../components/FormsLayout/Fields/SelectChip'
import Select from '../../../../components/FormsLayout/Fields/Select'

const FormFields = props => {
  const { formFields, type } = props
  const {
    title = null,
    job_category_id = null,
    work_position_id = null,
    offer_type_id = null,
    work_mode_id = null
  } = formFields

  const [formValues, setFormValues] = useState({
    [title.name]: title.current_value || '',
    [job_category_id.name]: job_category_id.current_value || '',
    [work_position_id.name]: work_position_id.current_value || '',
    [offer_type_id.name]: offer_type_id.current_value || '',
    [work_mode_id.name]: work_mode_id.current_value || ''
  })

  const handleChange = (e, inputName, isMultiple = false) => {
    e.persist()
    if (isMultiple) {
      const isArray = Array.isArray(formValues[inputName])
      if (isArray) {
        const arrayHasItem = formValues[inputName].includes(e.target.value)
        if (!arrayHasItem) {
          const merged = [...formValues[inputName], e.target.value]
          setFormValues(prevFormValues => ({
            ...prevFormValues,
            [inputName]: merged
          }))
        }
      } else {
        setFormValues(prevFormValues => ({
          ...prevFormValues,
          [inputName]: [e.target.value]
        }))
      }
    } else {
      setFormValues(prevFormValues => ({
        ...prevFormValues,
        [inputName]: e.target.value
      }))
    }
  }

  const handleDeleteChip = (id, inputName, isMultiple) => {
    if (isMultiple) {
      const newChips = [...formValues[inputName]]
      newChips.splice(newChips.indexOf(id), 1)
      setFormValues(prevFormValues => ({
        ...prevFormValues,
        [inputName]: newChips
      }))
    } else {
      setFormValues(prevFormValues => ({
        ...prevFormValues,
        [inputName]: ''
      }))
    }
  }

  const inputClassname = 'my-30 animated fadeIn inputField'

  const titleField = useMemo(
    () => (
      <Col className={inputClassname} xs={12}>
        <StandardInput
          inputValue={formValues[title.name]}
          handleChange={handleChange}
          name={title.name}
          label={title.label}
          isRequired={title.isRequired || false}
          isTextArea
          maxLength={256}
        />
      </Col>
    ),
    [formValues[title.name]]
  )

  const jobCategoryField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[job_category_id.name]}
          handleChange={handleChange}
          handleDeleteChip={handleDeleteChip}
          name={job_category_id.name}
          label={job_category_id.label}
          selectOptions={job_category_id.values}
          isRequired={job_category_id.isRequired || false}
        />
      </Col>
    ),
    [formValues[job_category_id.name]]
  )

  const workPositionField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <StandardInput
          inputValue={formValues[work_position_id.name]}
          handleChange={handleChange}
          name={work_position_id.name}
          label={work_position_id.label}
          isRequired={work_position_id.isRequired || false}
        />
      </Col>
    ),
    [formValues[work_position_id.name]]
  )

  const offerTypeField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <Select
          inputValue={formValues[offer_type_id.name]}
          handleChange={handleChange}
          name={offer_type_id.name}
          label={offer_type_id.label}
          selectOptions={offer_type_id.values}
          isRequired={offer_type_id.isRequired || false}
        />
      </Col>
    ),
    [formValues[offer_type_id.name]]
  )

  const workModeField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[work_mode_id.name]}
          handleChange={handleChange}
          handleDeleteChip={handleDeleteChip}
          name={work_mode_id.name}
          label={work_mode_id.label}
          selectOptions={work_mode_id.values}
          isRequired={work_mode_id.isRequired || false}
        />
      </Col>
    ),
    [formValues[work_mode_id.name]]
  )

  return (
    <Row className="HT__FormGenerator">
      {titleField}
      {jobCategoryField}
      {workPositionField}
      {offerTypeField}
      {workModeField}
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  type: PropTypes.oneOf(['user', 'company']),
  formFields: PropTypes.shape({
    title: PropTypes.object.isRequired,
    job_category_id: PropTypes.object.isRequired,
    work_position_id: PropTypes.object.isRequired,
    offer_type_id: PropTypes.object.isRequired,
    work_mode_id: PropTypes.object.isRequired
  }).isRequired
}
