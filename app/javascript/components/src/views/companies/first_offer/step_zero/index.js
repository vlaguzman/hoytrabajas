import React from 'react'
import FormIntro from '../../../../components/FormsLayout/FormIntro'

// we should replace this data with data from rails

const data = {
  title: {
    line1: 'El trabajo ideal ¡si existe!',
    line2: 'y está en HoyTrabajas'
  },
  content: `Completa la siguiente información para que puedas contar con mayor relevancia frente a otros candidatos.`,
  img: 'https://via.placeholder.com/150',
  buttonText: 'Quiero encontrar mi trabajo ideal'
}

const CompaniesStepZero = () => {
  return (
    <>
      <div className="d-flex my-50 justify-content-center w-100 pb-50 ">
        <FormIntro redirectTo="/companies/first_offer/step_one" {...data} />
      </div>
    </>
  )
}

export default CompaniesStepZero
