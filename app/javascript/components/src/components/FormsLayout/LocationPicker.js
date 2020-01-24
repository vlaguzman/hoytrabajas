import React, { useState } from 'react'
import PropTypes from 'prop-types'

import BaseSelectChip from './Fields/BaseSelectChip'

Array.prototype.any = function() {
  return this.length >= 1
}

// Auxiliar functions
const listFilter = (filterKey, list, locationParentID) =>
  list.filter(place => place[filterKey] === locationParentID)

const handleChangeInList = (
  settableStateFunction,
  filterKey,
  newParentValue,
  completeList
) => {
  settableStateFunction(listFilter(filterKey, completeList, newParentValue))
}

// Child Components
const SelectBuilder = ({
  placeID,
  placesList = [],
  selectLabel,
  selectName,
  handleGetSelectedPlace
}) => {
  return (
    <BaseSelectChip
      inputValue={placeID}
      name={selectName}
      label={selectLabel}
      handleGetSelectValue={handleGetSelectedPlace}
      selectOptions={placesList}
    />
  )
}

const LocationPicker = ({
  countriesProperties,
  statesProperties,
  citiesProperties,
  handleSelectedCity
}) => {
  const [selectedCountry, setSelectedCountry] = useState(
    countriesProperties.current_value
  )

  const [selectedState, setSelectedState] = useState(
    statesProperties.current_value
  )

  const [selectedCity, setSelectedCity] = useState(
    citiesProperties.current_value
  )

  const [coutriesList] = useState(countriesProperties.values)

  const [statesList, setStatesList] = useState(
    listFilter('country_id', statesProperties.values, selectedCountry)
  )

  const [citiesList, setCitiesList] = useState(
    listFilter('state_id', citiesProperties.values, selectedState)
  )

  const handleGetSelectedCountry = value => {
    setSelectedState('')
    handleChangeInList(
      setStatesList,
      'country_id',
      value,
      statesProperties.values
    )

    setSelectedCity('')
    setCitiesList([])

    setSelectedCountry(value)
  }

  const handleGetSelectedState = value => {
    setSelectedCity('')
    setCitiesList([])

    handleChangeInList(
      setCitiesList,
      'state_id',
      value,
      citiesProperties.values
    )
  }

  const CountrySelectComponent = () => (
    <SelectBuilder
      placeID={selectedCountry}
      placesList={coutriesList}
      selectLabel={countriesProperties.label}
      selectName={countriesProperties.name}
      handleGetSelectedPlace={handleGetSelectedCountry}
    />
  )

  const StateSelectComponent = () => {
    return (
      statesList.any() && (
        <SelectBuilder
          placeID={selectedState}
          placesList={statesList}
          selectLabel={statesProperties.label}
          selectName={statesProperties.name}
          handleGetSelectedPlace={handleGetSelectedState}
        />
      )
    )
  }

  const CitySelectComponent = () => {
    return (
      statesList.any() &&
      citiesList.any() && (
        <SelectBuilder
          placeID={selectedCity}
          placesList={citiesList}
          selectLabel={citiesProperties.label}
          selectName={citiesProperties.name}
          handleGetSelectedPlace={handleSelectedCity}
        />
      )
    )
  }

  const numberOfColumsToLocationPicker = () => {
    const quantity = [
      CountrySelectComponent(),
      StateSelectComponent(),
      CitySelectComponent()
    ].filter(x => x).length
    return 12 / quantity
  }

  return {
    CountrySelect: CountrySelectComponent(),
    StateSelect: StateSelectComponent(),
    CitySelect: CitySelectComponent(),
    numberOfColumsToLocationPicker: numberOfColumsToLocationPicker()
  }
}

export default LocationPicker

// Proptypes
LocationPicker.propTypes = {
  countriesProperties: PropTypes.shape({
    current_value: PropTypes.oneOfType([PropTypes.string, PropTypes.number]),
    values: PropTypes.array,
    name: PropTypes.string,
    label: PropTypes.string
  }),
  statesProperties: PropTypes.shape({
    current_value: PropTypes.oneOfType([PropTypes.string, PropTypes.number]),
    values: PropTypes.array,
    name: PropTypes.string,
    label: PropTypes.string
  }),
  citiesProperties: PropTypes.shape({
    current_value: PropTypes.oneOfType([PropTypes.string, PropTypes.number]),
    values: PropTypes.array,
    name: PropTypes.string,
    label: PropTypes.string
  }),
  handleSelectedCity: PropTypes.func
}

SelectBuilder.propTypes = {
  placeID: PropTypes.oneOfType([PropTypes.string, PropTypes.number]),
  placesList: PropTypes.array,
  selectLabel: PropTypes.string,
  selectName: PropTypes.string,
  handleGetSelectedPlace: PropTypes.func
}
