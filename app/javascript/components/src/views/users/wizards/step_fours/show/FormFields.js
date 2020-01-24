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
import LocationPicker from '../../../../../components/FormsLayout/LocationPicker'

const FormFields = props => {
  const { formFields } = props
  const {
    country_id = null,
    state_id = null,
    travel_disponibility = null,
    city_id = null,
    driving_licence_ids = null,
    vehicle_ids = null
  } = formFields

  const [formValues, setFormValues] = useState({
    [country_id.name]: country_id.current_value || '',
    [state_id.name]: state_id.current_value || '',
    [travel_disponibility.name]: travel_disponibility.current_value || false,
    [city_id.name]: city_id.current_value || '',
    [driving_licence_ids.name]: driving_licence_ids.current_value || '',
    [vehicle_ids.name]: vehicle_ids.current_value || ''
  })

  const handleSelectedCity = selectedCity => {
    setFormValues({ ...formValues, [city_id.name]: selectedCity })
  }

  const {
    CountrySelect,
    StateSelect,
    CitySelect,
    numberOfColumsToLocationPicker
  } = LocationPicker({
    countriesProperties: country_id,
    statesProperties: state_id,
    citiesProperties: city_id,
    handleSelectedCity
  })

  const inputClassname = 'my-30 animated fadeIn inputField'

  const CountryIDsField = () => {
    return (
      CountrySelect && (
        <Col
          key={country_id.name}
          className={inputClassname}
          xs={12}
          lg={numberOfColumsToLocationPicker}
        >
          {CountrySelect}
        </Col>
      )
    )
  }

  const stateIDField = () => {
    return (
      StateSelect && (
        <Col
          key={state_id.name}
          className={inputClassname}
          xs={12}
          lg={numberOfColumsToLocationPicker}
        >
          {StateSelect}
        </Col>
      )
    )
  }

  const cityIDField = () => {
    return (
      CitySelect && (
        <Col
          key={city_id.name}
          className={inputClassname}
          xs={12}
          lg={numberOfColumsToLocationPicker}
        >
          {CitySelect}
        </Col>
      )
    )
  }

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
      {CountryIDsField()}
      {stateIDField()}
      {cityIDField()}
      {travelDisponibilityField}
      {vehicleIDsField}
      {drivingLicenceIDsField}
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  formFields: PropTypes.shape({
    country_id: PropTypes.object,
    state_id: PropTypes.object,
    travel_disponibility: PropTypes.object,
    city_id: PropTypes.object,
    driving_licence_ids: PropTypes.object,
    vehicle_ids: PropTypes.object
  }).isRequired
}
