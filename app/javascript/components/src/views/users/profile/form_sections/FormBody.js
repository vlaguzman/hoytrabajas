import React, { Fragment, useContext } from 'react'
import FormGenerator from 'Components/FormGenerator'
import { FormContext } from 'Context/formContext'
import FormButtons from './FormButtons'

const FormBody = ({ scrollAction }) => {
  return (
    <Fragment>
      <form className="p-25">
        <FormGenerator {...{ scrollAction }} />
        <FormButtons {...{ scrollAction }} />
      </form>
    </Fragment>
  )
}

export default FormBody
