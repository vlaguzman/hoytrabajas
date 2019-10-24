import React from 'react'
import { DynamicCompaniesStepFive } from '../../../../../src/views/DynamicViews'
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
    previousPath: '/companies/first_offer/step_four',
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
      currency_id: {
        name: 'currency_id',
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
      from: {
        name: 'from',
        placeholder: 'Ej: 750.000',
        currentValue: ''
      },
      to: {
        name: 'to',
        label: 'Edad del candidato',
        placeholder: 'Ej: 750.000',
        beforeLabel: 'a',
        currentValue: ''
      },
      salary_type_id: {
        name: 'salary_type_id',
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
      available_work_day_id: {
        name: 'available_work_day_id',
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
      working_day_id: {
        name: 'working_day_id',
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
      job_aid_id: {
        name: 'job_aid_id',
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

const CompaniesStepFivePage = props => (
  <>
  {/* <AppLayout> */}
    <DynamicCompaniesStepFive formInfo={formInfo} />
  {/* </AppLayout> */}
  </>
)

export default CompaniesStepFivePage
