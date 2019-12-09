import React, {useState} from 'react';
import TextField from '@material-ui/core/TextField';
import Autocomplete from '../../../src/components/FormsLayout/Fields/FieldAutocomplete'
import { Col } from 'reactstrap'

export default function cityFilter(cities) {
  const [value, setValue] = useState("")
  const [idCityQuery, setIdCity] = useState("")

  const filterCity = (value) => {
    let idCity = cities["cities"].filter(city => city.label === value)
      .map(city => city.value)
      .join("")
    setIdCity(idCity)
  }

  return (
    <>
      <Col ds={12} md={5} className=" p-0 pb-20 mx-5">
        <Autocomplete
          value={value}
          cities={cities}
          filterCity={filterCity}
          setValue={setValue}
        />
        <input
          type="hidden"
          name="q[city_id_eq]"
          value={idCityQuery}
        />
      </Col>
    </>
  );
}
