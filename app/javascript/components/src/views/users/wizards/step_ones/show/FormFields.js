import React, { useState, useEffect, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import StandardInput from '../../../../../components/FormsLayout/Fields/StandardInput'
import SelectChip from '../../../../../components/FormsLayout/Fields/SelectChip'
import {
  handleChange,
  handleDeleteChip
} from '../../../../../components/FormsLayout/handleFunctions'
import LocationPicker from '../../../../../components/FormsLayout/LocationPicker'

const FormFields = props => {
  const { formFields } = props
  const {
    name = null,
    last_name = null,
    born_country_id = null,
    born_state_id = null,
    born_city_id = null,
    residence_country_id = null,
    residence_state_id = null,
    residence_city_id = null,
    nationality_ids = null,
    document_type_id = null,
    identification_number = null,
    contact_number = null
  } = formFields

  const [formValues, setFormValues] = useState({
    [name.name]: name.current_value || '',
    [last_name.name]: last_name.current_value || '',
    [born_country_id.name]: born_country_id.current_value || '',
    [born_state_id.name]: born_state_id.current_value || '',
    [born_city_id.name]: born_city_id.current_value || '',
    [residence_country_id.name]: residence_country_id.current_value || '',
    [residence_state_id.name]: residence_state_id.current_value || '',
    [residence_city_id.name]: residence_city_id.current_value || '',
    [nationality_ids.name]: nationality_ids.current_value || '',
    [document_type_id.name]: document_type_id.current_value || '',
    [identification_number.name]: identification_number.current_value || '',
    [contact_number.name]: contact_number.current_value || ''
  })

  const {
    CountrySelect: BornCountrySelect,
    StateSelect: BornStateSelect,
    CitySelect: BornCitySelect,
    numberOfColumsToLocationPicker: BornNumberOfColumsToLocationPicker
  } = LocationPicker({
    countriesProperties: born_country_id,
    statesProperties: born_state_id,
    citiesProperties: born_city_id
  })

  const {
    CountrySelect: ResidenceCountrySelect,
    StateSelect: ResidenceStateSelect,
    CitySelect: ResidenceCitySelect,
    numberOfColumsToLocationPicker: ResidenceNumberOfColumsToLocationPicker
  } = LocationPicker({
    countriesProperties: residence_country_id,
    statesProperties: residence_state_id,
    citiesProperties: residence_city_id
  })

  const inputClassname = 'mt-30 animated fadeIn inputField'

  const nameField = useMemo(
    () => (
      <Col key={name.name} className={inputClassname} xs={12} lg={6}>
        <StandardInput
          inputValue={formValues[name.name]}
          handleChange={handleChange(formValues, setFormValues)}
          name={name.name}
          label={name.label}
        />
      </Col>
    ),
    [formValues[name.name]]
  )

  const lastNameField = useMemo(
    () => (
      <Col key={last_name.name} className={inputClassname} xs={12} lg={6}>
        <StandardInput
          inputValue={formValues[last_name.name]}
          handleChange={handleChange(formValues, setFormValues)}
          name={last_name.name}
          label={last_name.label}
        />
      </Col>
    ),
    [formValues[last_name.name]]
  )


  const bornCountryIDsField = () => {
    return (
      BornCountrySelect && (
        <Col
          key={born_country_id.name}
          className={inputClassname}
          xs={12}
          lg={BornNumberOfColumsToLocationPicker}
        >
          {BornCountrySelect}
        </Col>
      )
    )
  }

  const bornStateIDsField = () => {
    return (
      BornStateSelect && (
        <Col
          key={born_state_id.name}
          className={inputClassname}
          xs={12}
          lg={BornNumberOfColumsToLocationPicker}
        >
          {BornStateSelect}
        </Col>
      )
    )
  }

  const bornCityIDsField = ()  => {
    return (
      BornCitySelect && (
        <Col
          key={born_city_id.name}
          className={inputClassname}
          xs={12}
          lg={BornNumberOfColumsToLocationPicker}
        >
          {BornCitySelect}
        </Col>
      )
    )
  }

  const residenceCountryIDsField = () => {
    return (
      ResidenceCountrySelect && (
        <Col
          key={residence_country_id.name}
          className={inputClassname}
          xs={12}
          lg={ResidenceNumberOfColumsToLocationPicker}
        >
          {ResidenceCountrySelect}
        </Col>
      )
    )
  }

  const residenceStateIDField = () => {
    return (
      ResidenceStateSelect && (
        <Col
          key={residence_state_id.name}
          className={inputClassname}
          xs={12}
          lg={ResidenceNumberOfColumsToLocationPicker}
        >
          {ResidenceStateSelect}
        </Col>
      )
    )
  }

  const residenceCityIDField = () => {
    return (
      ResidenceCitySelect && (
        <Col
          key={residence_city_id.name}
          className={inputClassname}
          xs={12}
          lg={ResidenceNumberOfColumsToLocationPicker}
        >
          {ResidenceCitySelect}
        </Col>
      )
    )
  }

  const nationalityIDsField = useMemo(
    () => (
      <Col key={nationality_ids.name} className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[nationality_ids.name]}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={nationality_ids.name}
          label={nationality_ids.label}
          selectOptions={nationality_ids.values}
          isMultiple
        />
      </Col>
    ),
    [formValues[nationality_ids.name]]
  )

  const documentTypeIDField = useMemo(
    () => (
      <Col
        key={document_type_id.name}
        className={inputClassname}
        xs={12}
        lg={6}
      >
        <SelectChip
          inputValue={formValues[document_type_id.name]}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={document_type_id.name}
          label={document_type_id.label}
          selectOptions={document_type_id.values}
        />
      </Col>
    ),
    [formValues[document_type_id.name]]
  )

  const identificationNumberField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <StandardInput
          inputValue={formValues[identification_number.name]}
          handleChange={handleChange(formValues, setFormValues)}
          name={identification_number.name}
          label={identification_number.label}
        />
      </Col>
    ),
    [formValues[identification_number.name]]
  )

  const contactNumberField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <StandardInput
          inputValue={formValues[contact_number.name]}
          handleChange={handleChange(formValues, setFormValues)}
          name={contact_number.name}
          label={contact_number.label}
        />
      </Col>
    ),
    [formValues[contact_number.name]]
  )

  return (
    <Row className="HT__FormGenerator">
      {nameField}
      {lastNameField}
      {bornCountryIDsField()}
      {bornStateIDsField()}
      {bornCityIDsField()}
      {residenceCountryIDsField()}
      {residenceStateIDField()}
      {residenceCityIDField()}
      {nationalityIDsField}
      {documentTypeIDField}
      {identificationNumberField}
      {contactNumberField}
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  formFields: PropTypes.shape({
    name: PropTypes.object,
    last_name: PropTypes.object,
    born_country_id: PropTypes.object,
    born_state_id: PropTypes.object,
    born_city_id: PropTypes.object,
    nationality_ids: PropTypes.object,
    residence_country_id: PropTypes.object,
    residence_state_id: PropTypes.object,
    residence_city_id: PropTypes.object,
    document_type_id: PropTypes.object,
    identification_number: PropTypes.object,
    contact_number: PropTypes.object
  }).isRequired
}
