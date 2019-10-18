import React from 'react'
import { DynamicCompaniesStepSeven } from '../../../../../src/views/DynamicViews'
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
    prevPath: '/companies/first_offer/step_six',
    nextPath: '/companies/first_offer/completed',
    action: '',
    method: 'PUT',
    type: 'company',
    formFields: {
      offer_location: {
        name: 'offer_location',
        beforeLabel: 'Que resida en',
        current_value: '',
        isMultiple: true,
        values: [
          {
            id: 1,
            description: 'Bogotá'
          },
          {
            id: 2,
            description: 'Medellín'
          }
        ]
      },
      offer_education: {
        name: 'offer_education',
        beforeLabel: 'Nivel mínimo de educacióm',
        current_value: '',
        values: [
          {
            id: 1,
            description: 'Secundaria'
          },
          {
            id: 2,
            description: 'Título universitario'
          }
        ]
      },
      offer_experience_number: {
        name: 'offer_experience_number',
        beforeLabel: 'Con mínimo',
        currentValue: '',
        values: [
          {
            id: 1,
            description: '1'
          },
          {
            id: 2,
            description: '2'
          }
        ]
      },
      offer_experience_unit: {
        name: 'offer_experience_unit',
        currentValue: '',
        afterLabel: 'de experiencia',
        values: [
          {
            id: 1,
            description: 'Semanas'
          },
          {
            id: 2,
            description: 'Meses'
          },
          {
            id: 3,
            description: 'Años'
          }
        ]
      },
      offer_skills_ids: {
        name: 'offer_skills_ids',
        beforeLabel: 'Con habilidades en',
        currentValue: '',
        values: [
          {
            id: 1,
            description: 'Redes sociales'
          },
          {
            id: 2,
            description: 'Marketing'
          },
          {
            id: 3,
            description: 'Programacióm'
          }
        ]
      },
      offer_skills_level: {
        name: 'offer_skills_level',
        beforeLabel: 'con nivel',
        currentValue: '',
        values: [
          {
            id: 1,
            description: 'Básico'
          },
          {
            id: 2,
            description: 'Intermedio'
          },
          {
            id: 3,
            description: 'Avanzado'
          }
        ]
      },
      offer_languages_id: {
        name: 'offer_languages_id',
        beforeLabel: 'Manejo del idioma',
        currentValue: '',
        isMultiple: true,
        values: [
          {
            id: 1,
            description: 'Inglés'
          },
          {
            id: 2,
            description: 'Francés'
          }
        ]
      },
      offer_languages_level: {
        name: 'offer_languages_level',
        beforeLabel: 'con nivel',
        currentValue: '',
        values: [
          {
            id: 1,
            description: 'Básico'
          },
          {
            id: 2,
            description: 'Intermedio'
          },
          {
            id: 3,
            description: 'Avanzado'
          }
        ]
      }
    }
  }
}

const CompaniesStepSevenPage = props => {
  return (
    <AppLayout>
      <DynamicCompaniesStepSeven formInfo={formInfo} />
    </AppLayout>
  )
}

export default CompaniesStepSevenPage
