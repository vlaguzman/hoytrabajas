import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import StandardInput from '../../../../../src/components/FormsLayout/Fields/StandardInput'
import DatePicker from '../../../../../src/components/FormsLayout/Fields/DatePicker'

import {
  handleChange,
  handleSimpleChange
} from '../../../../../src/components/FormsLayout/handleFunctions'
import LocationPicker from '../../../../../src/components/FormsLayout/LocationPicker'

const inputClassname = 'my-30 animated fadeIn inputField'

const dateOptions = {
  format: 'dd/MM/yyyy',
  disableFuture: false,
  emptyLabel: '...'
}

const FormFields = props => {
  const { formFields } = props
  const {
    country_id = null,
    city_id = null,
    state_id = null,
    diploma = null,
    entity_name = null,
    start_date = null,
    title = null
  } = formFields

  const [formValues, setFormValues] = useState({
    [city_id.name]: '',
    [state_id.name]: '',
    [title.name]: '',
    [entity_name.name]: '',
    [diploma.name]: '',
    [start_date.name]: Date.now()
  })

  const {
    CountrySelect,
    StateSelect,
    CitySelect,
    numberOfColumsToLocationPicker
  } = LocationPicker({
    countriesProperties: country_id,
    statesProperties: state_id,
    citiesProperties: city_id
  })

  const titleField = useMemo(
    () => (
      <Col key={title.name} className={inputClassname} xs={12} lg={12}>
        <StandardInput
          inputValue={formValues[title.name]}
          handleChange={handleChange(formValues, setFormValues)}
          name={title.name}
          label={title.label}
        />
      </Col>
    ),
    [formValues[title.name]]
  )

  const startDateField = useMemo(
    () => (
      <Col key={start_date.name} className={inputClassname} xs={12} lg={6}>
        <DatePicker
          name={start_date.name}
          inputValue={formValues[start_date.name]}
          handleSimpleChange={handleSimpleChange(formValues, setFormValues)}
          label={start_date.label}
          dateOptions={dateOptions}
        />
      </Col>
    ),
    [formValues[start_date.name]]
  )

  const entityNameField = useMemo(
    () => (
      <Col key={entity_name.name} className={inputClassname} xs={12} lg={6}>
        <StandardInput
          inputValue={formValues[entity_name.name]}
          handleChange={handleChange(formValues, setFormValues)}
          name={entity_name.name}
          label={entity_name.label}
        />
      </Col>
    ),
    [formValues[entity_name.name]]
  )

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

  const diplomaField = useMemo(
    () => (
      <Col key={diploma.name} className={inputClassname} xs={12} lg={12}>
        <label htmlFor="diplomaName">{diploma.label}</label>
        <input
          name={diploma.name}
          id="diplomaName"
          type="file"
          accept="image/*, .pdf"
        />
      </Col>
    ),
    [formValues[diploma.name]]
  )

  return (
    <Row className="HT__FormGenerator">
      {titleField}
      {startDateField}
      {entityNameField}
      {CountryIDsField()}
      {stateIDField()}
      {cityIDField()}
      {diplomaField}
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  formFields: PropTypes.shape({
    city_id: PropTypes.object,
    state_id: PropTypes.object,
    diploma: PropTypes.object,
    entity_name: PropTypes.object,
    start_date: PropTypes.object,
    title: PropTypes.object
  }).isRequired
}
