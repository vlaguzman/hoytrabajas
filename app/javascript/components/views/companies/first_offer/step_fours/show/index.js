import React from 'react'
import { DynamicCompaniesStepFour } from '../../../../../src/views/DynamicViews'
import AppLayout from '../../../../../src/components/Layout/AppLayout'

const formInfo = {
  title: 'Conozcamos más de tu oferta',
  subtitle: 'Brinda a tu candidato una relevante de tu empresa.',
  form: {
    buttons: {
      submit: 'Siguiente',
      prev: 'Regresar',
      next: 'Saltar'
    },
    prevPath: '/companies/first_offer/step_three',
    nextPath: '/companies/first_offer/step_five',
    action: '',
    method: 'PUT',
    type: 'company',
    formFields: {
      contract_type_id: {
        name: 'contract_type_id',
        label: 'Acuerdo legal',
        isRequired: true,
        current_value: 1,
        values: [
          {
            id: 1,
            description: 'Prestación de servicios'
          }
        ]
      },
      vacancies_quantity: {
        name: 'vacancies_quantity',
        label: 'Elige el número de vacantes',
        current_value: 20,
        values: {
          min: 0,
          max: 100
        },
        step: 1
      },
      sex_id: {
        name: 'sex_id',
        label: 'Tu oferta está dirigida a',
        currentValue: 2,
        values: [
          {
            id: 1,
            description: 'Hombres'
          },
          {
            id: 2,
            description: 'Mujeres'
          }
        ]
      },
      offer_candidate_age: {
        name: 'offer_candidate_age',
        label: 'Edad del candidato',
        beforeLabel: 'Edad min.',
        afterLabel: 'Edad máx.',
        currentValue: [20, 35],
        values: {
          min: 18,
          max: 80
        },
        step: 1
      },
      close_date: {
        name: 'close_date',
        label: 'Vencimiento de la oferta',
        isRequired: true,
        currentValue: '',
        dateOptions: {
          format: 'dd MMMM yyyy',
          disableFuture: false,
          emptyLabel: '...'
        }
      },
      immediate_start: {
        name: 'immediate_start',
        label: '¿Cuál es el tiempo para cubrir esta oferta?',
        description: 'Inicio inmediato',
        currentValue: false,
        isRequired: true
      }
    }
  }
}

const CompaniesStepFourPage = props => {
  return (
    <AppLayout>
      <DynamicCompaniesStepFour formInfo={formInfo} />
    </AppLayout>
  )
}

export default CompaniesStepFourPage
