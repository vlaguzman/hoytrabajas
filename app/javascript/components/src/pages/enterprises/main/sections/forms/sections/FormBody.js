import React, { Fragment, useContext } from 'react'
import FormGenerator from 'Components/FormGenerator'
// import ResposiveDialog from 'Components/Dialog/ResponsiveDialog'
// import ExperienceCard from 'Components/ExperienceCard'
import { FormContext } from 'Context/formContext'
import FormTitle from './FormTitle'
import FormButtons from './FormButtons'

const FormBody = ({ scrollAction, history }) => {
  const { title, subtitle } = useContext(FormContext)
  return (
    <Fragment>
      {/* <FormTitle title={title} subtitle={subtitle} /> */}
      {/* <div className="w-75 mb-50"> */}
        <form className='w-75 mt-30' >
          <FormGenerator {...{ scrollAction }} />
          <FormButtons {...{ scrollAction }} {...{ history }} />
        </form>
      {/* </div> */}
    </Fragment>
  )
}

export default FormBody
