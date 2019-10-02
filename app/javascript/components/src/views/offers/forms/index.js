import React from 'react'
import FormWrapper from './sections/FormWrapper'
import allForms from './formJson'

const OffersForm = ({ formIndex }) => (
  <FormWrapper formContent={allForms[formIndex]} />
)

export default OffersForm
