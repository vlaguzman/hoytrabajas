import React, { useState, useEffect, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import SelectChip from '../../../../../components/FormsLayout/Fields/SelectChip'
import Checkbox from '../../../../../components/FormsLayout/Fields/Checkbox'
import {
  handleBoolean,
  handleChange,
  handleDeleteChip
} from '../../../../../components/FormsLayout/handleFunctions'

const FormFields = props => {
  const { formFields } = props
  const {
    state_id = null,
    travel_disponibility = null,
    city_id = null,
    driving_licence_ids = null,
    vehicle_ids = null
  } = formFields

  const [formValues, setFormValues] = useState({
    [state_id.name]: state_id.current_value || '',
    [travel_disponibility.name]: travel_disponibility.current_value || false,
    [city_id.name]: city_id.current_value || '',
    [driving_licence_ids.name]: driving_licence_ids.current_value || '',
    [vehicle_ids.name]: vehicle_ids.current_value || ''
  })

  const [citiesOfCurrentState, setCitiesOfCurrentState] = useState(
    city_id.values.filter(
      city => city['state_id'] === formValues[state_id.name]
    )
  )

  useEffect(() => {
    setFormValues({ ...formValues, [city_id.name]: formValues[city_id.name] || '' })
    setCitiesOfCurrentState(
      city_id.values.filter(
        city => city['state_id'] === formValues[state_id.name]
      )
    )
  }, [formValues[state_id.name]])

  const inputClassname = 'my-30 animated fadeIn inputField'

  const stateIDField = useMemo(
    () => (
      <Col key={state_id.name} className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[state_id.name]}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={state_id.name}
          label={state_id.label}
          selectOptions={state_id.values}
        />
      </Col>
    ),
    [formValues[state_id.name]]
  )

  const travelDisponibilityField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <Checkbox
          inputValue={formValues[travel_disponibility.name]}
          handleBoolean={handleBoolean(setFormValues)}
          name={travel_disponibility.name}
          label=""
          description={travel_disponibility.label}
          isRequired={false}
        />
      </Col>
    ),
    [formValues[travel_disponibility.name]]
  )

  const cityIDField = useMemo(
    () => (
      <Col key={city_id.name} className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={
            (formValues[state_id.name] && formValues[city_id.name]) || ''
          }
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={city_id.name}
          label={city_id.label}
          selectOptions={
            (formValues[state_id.name] && citiesOfCurrentState) || []
          }
        />
      </Col>
    ),
    [formValues[city_id.name], formValues[state_id.name], citiesOfCurrentState]
  )

  const vehicleIDsField = useMemo(
    () => (
      <Col key={vehicle_ids.name} className={inputClassname} xs={12} lg={6}>
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

  const drivingLicenceIDsField = useMemo(
    () => (
      <Col
        key={driving_licence_ids.name}
        className={inputClassname}
        xs={12}
        lg={12}
      >
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
      {stateIDField}
      {travelDisponibilityField}
      {cityIDField}
      {vehicleIDsField}
      {drivingLicenceIDsField}
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  formFields: PropTypes.shape({
    state_id: PropTypes.object,
    travel_disponibility: PropTypes.object,
    city_id: PropTypes.object,
    driving_licence_ids: PropTypes.object,
    vehicle_ids: PropTypes.object
  }).isRequired
}
