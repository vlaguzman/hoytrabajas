import React from 'react'
import PropTypes from 'prop-types'
import { DynamicCompaniesStepSeven } from '../../../../../src/views/DynamicViews'
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
    previousPath: '/companies/first_offer/step_six',
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
        beforeLabel: 'Nivel mínimo de educación',
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
      offer_experience_boolean: {
        name: 'offer_experience_boolean',
        currentValue: '',
        beforeLabel: 'ó',
        description: 'Sin experiencia'
      },
      offer_skills: {
        name: 'offer_skills',
        current_value: [
          {
            id: 1,
            description: 'Redes sociales',
            level_id: 2
          }
        ]
      },
      offer_skills_ids: {
        beforeLabel: 'Con habilidades en',
        new_item_description: 'Agregar una nueva habilidad',
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
      offer_skills_level_id: {
        beforeLabel: 'con nivel',
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
      offer_languages: {
        name: 'offer_languages',
        current_value: [
          {
            id: 1,
            description: 'Inglés',
            level_id: 2
          }
        ]
      },
      languages_id: {
        name: 'languages_id',
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
          },
          {
            id: 3,
            description: 'Portugués'
          }
        ]
      },
      languages_level_id: {
        name: 'languages_level_id',
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
  const {
    log_out_companies,
    company_signed_in,
    user_signed_in,
    log_out_user,
    csrf_param,
    csrf_token,
    session_translation
  } = props
  return (
    <AppLayout
      log_out_companies={log_out_companies}
      company_signed_in={company_signed_in}
      user_signed_in={user_signed_in}
      log_out_user={log_out_user}
      csrf_param={csrf_param}
      csrf_token={csrf_token}
      session_translation={session_translation}
    >
      <DynamicCompaniesStepSeven formInfo={formInfo} {...props} />
    </AppLayout>
  )
}

export default CompaniesStepSevenPage

CompaniesStepSevenPage.propTypes = {
  log_out_companies: PropTypes.string.isRequired,
  company_signed_in: PropTypes.bool.isRequired,
  user_signed_in: PropTypes.bool.isRequired,
  log_out_user: PropTypes.string.isRequired,
  csrf_param: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired,
  path: PropTypes.string.isRequired,
  session_translation: PropTypes.object.isRequired
}
