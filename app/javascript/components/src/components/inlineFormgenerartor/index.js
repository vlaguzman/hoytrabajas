import React, { Fragment } from 'react'
import { Col } from 'reactstrap'
import TextField from '@material-ui/core/TextField'
import MenuItem from '@material-ui/core/MenuItem'

const InlineFormGenerator = ({ fields }) => {
  return (
    <>
      {fields.map(({ label, name, type, aux, xs, md }) => (
        <Col key={name} {...{ xs, md }} className=" p-0 pb-20 mr-10">
          {type.includes('text') ? (
            <TextField {...{ label }} className="pr-5" />
          ) : (
            <TextField select {...{ label }} className="w-100 pr-10" value="">
              {aux.map(({ value, text }) => (
                <MenuItem key={value} {...{ value }}>
                  {text}
                </MenuItem>
              ))}
            </TextField>
          )}
        </Col>
      ))}
    </>
  )
}

export default InlineFormGenerator
