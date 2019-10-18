import React from 'react'
import { DynamicCompaniesStepThree } from '../../../../../src/views/DynamicViews'
import AppLayout from '../../../../../src/components/Layout/AppLayout'

const formInfo = {
  title: 'Conozcamos más de tu oferta',
  subtitle: 'Brinda a tu candidato una relevante de tu empresa.',
  form: {
    buttons: {
      submit: 'Siguiente',
      previous: 'Regresar',
      next: 'Saltar'
    },
    previousPath: '/companies/first_offer/step_three',
    nextPath: '/companies/first_offer/step_five',
    action: '',
    method: 'PUT',
    type: 'company',
    formFields: {
      title: {
        name: 'title',
        label: 'Título de tu oferta* Ejem. Dj para Bar',
        isRequired: true,
        current_value: ''
      },
      job_category_id: {
        name: 'job_category_id',
        label: 'Selecciona la categoría de tu oferta',
        isRequired: true,
        current_value: '',
        values: [
          {
            id: 1,
            description: 'Opción 1'
          },
          {
            id: 2,
            description: 'Opción 2'
          }
        ]
      },
      work_position_id: {
        name: 'work_position_id',
        label: 'Escribe el cargo que deseas contratar',
        currentValue: ''
      },
      offer_type_id: {
        name: 'offer_type_id',
        label: 'Tipo de oferta',
        isRequired: true,
        currentValue: '',
        values: [
          {
            id: 1,
            description: 'Medio tiempo'
          },
          {
            id: 2,
            description: 'Ocasional'
          },
          {
            id: 3,
            description: 'Jornada completa'
          }
        ]
      },
      work_mode_id: {
        name: 'work_mode_id',
        label: 'Modalidad de trabajo',
        currentValue: '',
        values: [
          {
            id: 1,
            description: 'Teletrabajo'
          }
        ]
      }
    }
  }
}

const CompaniesStepThreePage = props => {
  return (
    <AppLayout>
      <DynamicCompaniesStepThree formInfo={formInfo} {...props} />
    </AppLayout>
  )
}

export default CompaniesStepThreePage
