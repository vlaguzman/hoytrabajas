import React from 'react'
import { DynamicUsersWizardsStepThree } from '../../../../../src/views/DynamicViews'
import AppLayout from '../../../../../src/components/Layout/AppLayout'

const formInfo = {
  title: '¡Búsquemos las mejores ofertas!',
  subtitle: 'Brinda a las empresas información valiosa sobre ti.',
  form: {
    buttons: {
      submit: 'Siguiente',
      next: 'Saltar',
      previous: 'Regresar',
      nextPath: '/users/wizards/step_four',
      previousPath: '/users/wizards/step_two'
    },
    action: '/users/wizards/step_three',
    method: 'put',
    type: 'user',
    formFields: {
      job_category_ids: {
        name: 'user[curriculum_vitae][job_category_ids][]',
        label: 'Elje las categorías en las que deseas buscar trabajo',
        values: [
          { id: 1, description: '_elem_1' },
          { id: 2, description: '_elem_2' }
        ]
      },
      offer_type_ids: {
        name: 'user[curriculum_vitae][offer_type_ids][]',
        label: 'Tipo de oferta',
        values: [
          { id: 1, description: '_elem_1' },
          { id: 2, description: '_elem_2' }
        ]
      },
      contract_type_id: {
        name: 'user[curriculum_vitae][contract_type_id]',
        label: 'Acuerdo legal',
        values: [
          { id: 1, description: '_elem_1' },
          { id: 2, description: '_elem_2' }
        ]
      },
      work_mode_ids: {
        name: 'user[curriculum_vitae][work_mode_ids][]',
        label: 'Modalidad de trabajo',
        values: [
          { id: 1, description: '_elem_1' },
          { id: 2, description: '_elem_2' }
        ]
      },
      labor_disponibility_id: {
        name: 'user[curriculum_vitae][labor_disponibility_id]',
        label: 'Disponibilidad para trabajar',
        values: [
          { id: 1, description: '_elem_1' },
          { id: 2, description: '_elem_2' }
        ]
      }
    }
  }
}

const UsersWizardsStepThreePage = props => {
  return (
    <AppLayout>
      <DynamicUsersWizardsStepThree {...props} formInfo={formInfo} />
    </AppLayout>
  )
}

export default UsersWizardsStepThreePage
