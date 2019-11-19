import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import SelectChip from '../../../../../components/FormsLayout/Fields/SelectChip'
import {
  handleDeleteChip,
  handleChange
} from '../../../../../components/FormsLayout/handleFunctions'

const FormFields = props => {
  const { formFields } = props

  const {
    responsibility_ids = null,
    requirement_ids = null,
    vehicle_ids = null,
    driving_licence_ids = null
  } = formFields

  const [formValues, setFormValues] = useState({
    [responsibility_ids.name]: responsibility_ids.current_value || '',
    [requirement_ids.name]: requirement_ids.current_value || '',
    [vehicle_ids.name]: vehicle_ids.current_value || '',
    [driving_licence_ids.name]: driving_licence_ids.current_value || ''
  })

  const inputClassname = 'my-30 animated fadeIn inputField'

  const responsabilityField = useMemo(
    () => (
      <Col className={inputClassname} xs={12}>
        <SelectChip
          inputValue={formValues[responsibility_ids.name]}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={responsibility_ids.name}
          label={responsibility_ids.label}
          selectOptions={responsibility_ids.values}
          isRequired={responsibility_ids.isRequired || false}
          isMultiple
        />
      </Col>
    ),
    [formValues[responsibility_ids.name]]
  )

  const requirementField = useMemo(
    () => (
      <Col className={inputClassname} xs={12}>
        <SelectChip
          inputValue={formValues[requirement_ids.name]}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={requirement_ids.name}
          label={requirement_ids.label}
          selectOptions={requirement_ids.values}
          isMultiple
        />
      </Col>
    ),
    [formValues[requirement_ids.name]]
  )

  const vehicleField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[vehicle_ids.name]}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={vehicle_ids.name}
          label={vehicle_ids.label}
          selectOptions={vehicle_ids.values}
          isMultiple
        />
      </Col>
    ),
    [formValues[vehicle_ids.name]]
  )

  const drivingLicenseField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[driving_licence_ids.name]}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={driving_licence_ids.name}
          label={driving_licence_ids.label}
          selectOptions={driving_licence_ids.values}
          isMultiple
        />
      </Col>
    ),
    [formValues[driving_licence_ids.name]]
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
  formFields: PropTypes.shape({
    responsibility_ids: PropTypes.object.isRequired,
    requirement_ids: PropTypes.object.isRequired,
    vehicle_ids: PropTypes.object.isRequired,
    driving_licence_ids: PropTypes.object.isRequired
  }).isRequired
}
