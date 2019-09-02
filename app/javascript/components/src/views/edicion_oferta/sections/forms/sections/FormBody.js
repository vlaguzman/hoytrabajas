import React, { Fragment, useContext } from 'react'
import FormGenerator from '../components/FormGenerator'
import { FormContext, FormNameContext } from '../context/formContext'
import FormButtons from './FormButtons'

const FormBody = ({ scrollAction }) => {
  const { next, prev, formObj, formSection } = useContext(FormContext)
  const formName = useContext(FormNameContext)

  const handleSubmit = e => {
    e.preventDefault()
  }

  return (
    <Fragment>
      <div className="special-gutters-responsive__one_page_forms">
        <form
          className="forms__candidate"
          method="POST"
          onSubmit={handleSubmit}
        >
          <FormGenerator
            {...{ scrollAction, formObj, formSection, formName }}
          />
          <FormButtons
            {...{ scrollAction, formSection, formName, next, prev }}
          />
        </form>
      </div>
    </Fragment>
  )
}

export default FormBody
