import React, { Fragment } from 'react'
import FormGenerator from '../../../../components/FormGenerator'
import FormTitle from './FormTitle'
import FormButtons from './FormButtons'

const FormBody = props => {
  const { scrollAction, formContent, formName } = props
  const { title, subtitle, formObj, formSection, next, prev } = formContent

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
            {...{ scrollAction, formObj, formName, formSection }}
          />
          <FormButtons {...{ scrollAction, next, prev, formSection }} />
        </form>
      </div>
    </Fragment>
  )
}

export default FormBody
