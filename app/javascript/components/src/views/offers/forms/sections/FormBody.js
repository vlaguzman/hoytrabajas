import React, { Fragment } from 'react'
import FormGenerator from '../../../../components/FormGenerator'
import FormTitle from './FormTitle'
import FormButtons from './FormButtons'

const FormBody = props => {
  const { scrollAction, formContent, formInfo } = props
  const { formObj, formSection, next, prev } = formContent
  const { title, subtitle, form: { buttons, action, method, type, fields } } = formInfo

  const handleSubmit = e => {
    e.preventDefault()
  }

  return (
    <Fragment>
      <FormTitle title={title} subtitle={subtitle} />
      <div className="w-80">
        <form
          className="forms__candidate"
          action={action}
          method={method}
          onSubmit={handleSubmit}
        >
          <FormGenerator
            {...{ scrollAction, formObj, formSection, fields, formName: type }}
          />
          <FormButtons {...{ scrollAction, next, prev, submit, formSection }} />
        </form>
      </div>
    </Fragment>
  )
}

export default FormBody
