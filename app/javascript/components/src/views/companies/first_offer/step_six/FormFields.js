import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import SelectChip from '../../../../components/FormsLayout/Fields/SelectChip'

const FormFields = props => {
  const { formFields, type } = props
  const {
    responsability_id = null,
    requirement_id = null,
    vehicle_id = null,
    driving_license_id = null
  } = formFields

  const [formValues, setFormValues] = useState({
    [responsability_id.name]: responsability_id.current_value || '',
    [requirement_id.name]: requirement_id.current_value || '',
    [vehicle_id.name]: vehicle_id.current_value || '',
    [driving_license_id.name]: driving_license_id.current_value || ''
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

  const responsabilityField = useMemo(
    () => (
      <Col className={inputClassname} xs={12}>
        <SelectChip
          inputValue={formValues[responsability_id.name]}
          handleChange={handleChange}
          handleDeleteChip={handleDeleteChip}
          name={responsability_id.name}
          label={responsability_id.label}
          selectOptions={responsability_id.values}
          isRequired={responsability_id.isRequired || false}
          isMultiple
        />
      </Col>
    ),
    [formValues[responsability_id.name]]
  )

  const requirementField = useMemo(
    () => (
      <Col className={inputClassname} xs={12}>
        <SelectChip
          inputValue={formValues[requirement_id.name]}
          handleChange={handleChange}
          handleDeleteChip={handleDeleteChip}
          name={requirement_id.name}
          label={requirement_id.label}
          selectOptions={requirement_id.values}
          isRequired={requirement_id.isRequired || false}
          isMultiple
        />
      </Col>
    ),
    [formValues[requirement_id.name]]
  )

  const vehicleField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[vehicle_id.name]}
          handleChange={handleChange}
          handleDeleteChip={handleDeleteChip}
          name={vehicle_id.name}
          label={vehicle_id.label}
          selectOptions={vehicle_id.values}
          isRequired={vehicle_id.isRequired || false}
          isMultiple
        />
      </Col>
    ),
    [formValues[vehicle_id.name]]
  )

  const drivingLicenseField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[driving_license_id.name]}
          handleChange={handleChange}
          handleDeleteChip={handleDeleteChip}
          name={driving_license_id.name}
          label={driving_license_id.label}
          selectOptions={driving_license_id.values}
          isRequired={driving_license_id.isRequired || false}
          isMultiple
        />
      </Col>
    ),
    [formValues[driving_license_id.name]]
  )

  return (
    <Row className="HT__FormGenerator">
      {responsabilityField}
      {requirementField}
      {vehicleField}
      {drivingLicenseField}
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  type: PropTypes.oneOf(['user', 'company']),
  formFields: PropTypes.shape({
    responsability_id: PropTypes.object.isRequired,
    requirement_id: PropTypes.object.isRequired,
    vehicle_id: PropTypes.object.isRequired,
    driving_license_id: PropTypes.object.isRequired
  }).isRequired
}
