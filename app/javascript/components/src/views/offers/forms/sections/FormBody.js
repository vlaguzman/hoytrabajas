import React, { Fragment, useContext } from 'react'
import FormGenerator from 'Components/FormGenerator'
import { FormContext, FormNameContext } from 'Context/formContext'
import FormTitle from './FormTitle'
import FormButtons from './FormButtons'

const FormBody = ({ scrollAction }) => {
  const { title, subtitle, formObj, formSection } = useContext(FormContext)
  const formName = useContext(FormNameContext)

  const handleSubmit = e => {
    e.preventDefault()
  }

  return (
    <Fragment>
      <FormTitle title={title} subtitle={subtitle} />
      <div className="w-80">
        <form
          className="forms__candidate"
          method="POST"
          onSubmit={handleSubmit}
        >
          <FormGenerator
            {...{ scrollAction, formObj, formSection, formName }}
          />
          <FormButtons {...{ scrollAction }} />
        </form>
      </div>
    </Fragment>
  )
}

export default FormBody
