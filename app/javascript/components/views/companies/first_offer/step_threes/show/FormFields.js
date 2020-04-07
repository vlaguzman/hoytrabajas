import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import StandardInput from '../../../../../src/components/FormsLayout/Fields/StandardInput'
import SelectChip from '../../../../../src/components/FormsLayout/Fields/SelectChip'
import SelectFindOrCreate from '../../../../../src/components/FormsLayout/Fields/SelectFindOrCreate'
import Checkbox from '../../../../../src/components/FormsLayout/Fields/Checkbox'
import { cleanJobCategoryDescription } from '../../../../../utils/string_functions'
import {
  handleChange,
  handleDeleteChip,
  handleBoolean
} from '../../../../../src/components/FormsLayout/handleFunctions'

const FormFields = props => {
  const { formFields, tooltip_description } = props

  const {
    title = null,
    confidential = null,
    description = null,
    job_category_ids = null,
    offers_work_positions = null,
    job_category_image = null
  } = formFields

  const [formValues, setFormValues] = useState({
    [title.name]: title.current_value || '',
    [confidential.name]: confidential.current_value || false,
    [description.name]: description.current_value || '',
    [job_category_ids.name]: job_category_ids.current_value || '',
    [offers_work_positions.name]: offers_work_positions.current_value || '',
    [job_category_image.name]: job_category_image.current_value || ''
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

  const jobCategoryIdsField = useMemo(
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

  const JobCategoryImageField = () => {
    const imageClick = route => {
      setFormValues({ ...formValues, [job_category_image.name]: route })
    }

    const renderImages = description => {
      const imagesBlock = [1, 2, 3].map(index => {
        const route = `https://img-categorias-ht.s3.amazonaws.com/card-${description}-${index}.jpg`
        const imgSelected =
          formValues[job_category_image.name] === route ? 'imgSelected' : ''

        return (
          <img
            className={`imgJobCategory ${imgSelected}`}
            src={route}
            alt={`${description}-${index}`}
            onClick={() => imageClick(route)}
          />
        )
      })

      return imagesBlock
    }

    const jobCategoryId = formValues[job_category_ids.name][0]
    const jobCategoryObject = job_category_ids.values.find(
      jobCategory => jobCategory.id === jobCategoryId
    )

    return jobCategoryId ? (
      <>
        <div className="my-30 animated fadeIn inputField col-12 col-lg-12">
          <div className="MuiFormControl-root">
            <div className="MuiFormControl-root MuiTextField-root">
              <label className="MuiFormLabel-root MuiInputLabel-root MuiInputLabel-formControl MuiInputLabel-animated">
                {' '}
                {job_category_image.label}{' '}
              </label>
              <input
                type="hidden"
                name={job_category_image.name}
                value={formValues[job_category_image.name]}
              />
            </div>
          </div>
        </div>

        <div className="my-30 animated fadeIn inputField col-12 col-lg-12 jobCategoryImages">
          {renderImages(
            cleanJobCategoryDescription(jobCategoryObject.description)
          )}
        </div>
      </>
    ) : null
  }

  return (
    <Row className="HT__FormGenerator">
      {titleField}
      {offerConfidentialField}
      {descriptionField}
      {jobCategoryIdsField}
      {offersWorkPositionsField}
      <JobCategoryImageField />
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  formFields: PropTypes.shape({
    title: PropTypes.object,
    confidential: PropTypes.object,
    description: PropTypes.object,
    job_category_ids: PropTypes.object,
    offers_work_positions: PropTypes.object,
    job_category_image: PropTypes.object
  }).isRequired,
  tooltip_description: PropTypes.shape({
    press_enter: PropTypes.string.isRequired
  }).isRequired
}
