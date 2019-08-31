import React, { Fragment, useContext } from 'react'
import FormGenerator from '../components/FormGenerator'
// import ResposiveDialog from '../components/Dialog/ResponsiveDialog'
// import ExperienceCard from '../components/ExperienceCard'
import { FormContext } from '../context/formContext'
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
