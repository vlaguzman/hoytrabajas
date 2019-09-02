import React, { Fragment, useContext } from 'react'
import FormGenerator from '../components/FormGenerator'
import { FormContext } from '../context/formContext'
import FormTitle from './FormTitle'

export default () => {
  const { title, subtitle, formObj } = useContext(FormContext)
  return (
    <Fragment>
      <FormTitle title={title} subtitle={subtitle} />
      <div className="w-75 mb-50">
        <form>
          <FormGenerator {...{ formObj }} />
        </form>
      </div>
    </Fragment>
  )
}
