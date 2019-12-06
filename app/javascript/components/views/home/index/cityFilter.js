import React, {useState} from 'react';
import TextField from '@material-ui/core/TextField';
import Autocomplete from '@material-ui/lab/Autocomplete';
import { Col } from 'reactstrap'

export default function cityFilter(cities) {
  const [value, setValue] = useState("")
  const [idCityQuery, setIdCity] = useState("")

  function filterCity(value) {
    let idCity = cities["cities"].filter(city => city.label === value)
      .map(city => city.value)
      .join("")
    setIdCity(idCity)
  }

  return (
    <>
      <Col ds={12} md={5} className=" p-0 pb-20 mx-5">
        <Autocomplete
          id="combo-box-demo"
          inputValue={value}
          onInputChange={ (event, value)=> {setValue(value); filterCity(value)} }
          options={cities["cities"]}
          getOptionLabel={option => option.label}
          renderInput={params => (
            <TextField {...params} label="Ciudad" fullWidth />
          )}
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
