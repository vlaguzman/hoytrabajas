import React from 'react'
import { DynamicCompaniesStepFive } from '../../../../../src/views/DynamicViews'
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
    prevPath: '/companies/first_offer/step_four',
    nextPath: '/companies/first_offer/step_six',
    action: '',
    method: 'PUT',
    type: 'company',
    formFields: {
      offer_salary_id: {
        name: 'offer_salary_id',
        label: 'Aspiración Salarial',
        isRequired: true,
        current_value: '',
        values: [
          {
            id: 1,
            description: 'Rango'
          },
          {
            id: 2,
            description: 'Fijo'
          }
        ]
      },
      offer_salary_currency_id: {
        name: 'offer_salary_currency_id',
        label: '',
        current_value: 1,
        values: [
          {
            id: 1,
            description: 'COP'
          },
          {
            id: 2,
            description: 'USD'
          }
        ]
      },
      offer_salary_min: {
        name: 'offer_salary_min',
        placeholder: 'Ej: 750.000',
        currentValue: ''
      },
      offer_salary_max: {
        name: 'offer_salary_max',
        label: 'Edad del candidato',
        placeholder: 'Ej: 750.000',
        beforeLabel: 'a',
        currentValue: ''
      },
      offer_salary_interval_id: {
        name: 'offer_salary_interval_id',
        label: 'Pago',
        currentValue: '',
        values: [
          {
            id: 1,
            description: 'Mensual'
          },
          {
            id: 2,
            description: 'Semanal'
          }
        ]
      },
      offer_working_days: {
        name: 'offer_working_days',
        label: '¿Qué días a la semana?',
        currentValue: '',
        isMultiple: true,
        values: [
          {
            id: 1,
            description: 'Lunes a viernes'
          },
          {
            id: 2,
            description: 'Fines de semana'
          }
        ]
      },
      offer_working_hours: {
        name: 'offer_working_hours',
        label: '¿En qué jornada?',
        currentValue: '',
        isMultiple: true,
        values: [
          {
            id: 1,
            description: 'Mañana 7am-1pm'
          },
          {
            id: 2,
            description: 'Tarde 2pm-7pm'
          }
        ]
      },
      offer_benefits: {
        name: 'offer_benefits',
        label: 'Auxilios o prestaciones asociadas a tu oferta',
        currentValue: '',
        isMultiple: true,
        values: [
          {
            id: 1,
            description: 'Auxilio transporte'
          },
          {
            id: 2,
            description: 'Comisiones'
          }
        ]
      }
    }
  }
}

const CompaniesStepFivePage = props => {
  return (
    <AppLayout>
      <DynamicCompaniesStepFive formInfo={formInfo} />
    </AppLayout>
  )
}

export default CompaniesStepFivePage
