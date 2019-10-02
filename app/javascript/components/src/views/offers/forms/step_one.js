import React from 'react'
import FormWrapper from './sections/FormWrapper'
import allForms from './formJson'

const OffersStepOne = () => (
  <FormWrapper formContent={allForms[0]} />
)

export default OffersStepOne
