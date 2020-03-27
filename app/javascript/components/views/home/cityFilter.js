import React, { useState } from 'react'
import { Col } from 'reactstrap'
import PropTypes from 'prop-types'
import Autocomplete from '../../src/components/FormsLayout/Fields/FieldAutocomplete'

const CityFilter = (cities) => {
  const [value, setValue] = useState('')
  const [idCityQuery, setIdCity] = useState('')

  const filterCity = val => {
    const idCity = cities['cities']
      .filter(city => city.label === val)
      .map(city => city.value)
      .join('')
    setIdCity(idCity)
  }

  return (
    <>
      <div className="p-0 pb-20 mx-5" style={{ flex: 1 }}>
        <Autocomplete
          value={value}
          cities={cities}
          filterCity={filterCity}
          setValue={setValue}
        />
        <input type="hidden" name="search[city]" value={idCityQuery} />
      </div>
    </>
  )
}

CityFilter.propTypes = {
  cities: PropTypes.object.isRequired
}

export default CityFilter
