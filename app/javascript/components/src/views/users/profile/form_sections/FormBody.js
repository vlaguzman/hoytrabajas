import React, { Fragment, useContext } from 'react'
import FormGenerator from '../components/FormGenerator'
import { FormContext } from '../context/formContext'
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
