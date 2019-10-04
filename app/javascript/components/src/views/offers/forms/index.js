import React from 'react'
import FormWrapper from './sections/FormWrapper'
import allForms from './formJson'

const OffersForm = ({ formInfo, formIndex }) => (
  <FormWrapper formInfo={formInfo} formContent={allForms[formIndex]} />
)

export default OffersForm
