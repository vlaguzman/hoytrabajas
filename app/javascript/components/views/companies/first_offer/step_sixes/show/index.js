import React from 'react'
import PropTypes from 'prop-types'
import { DynamicCompaniesStepSix } from '../../../../../src/views/DynamicViews'
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
    previousPath: '/companies/first_offer/step_five',
    nextPath: '/companies/first_offer/step_seven',
    action: '',
    method: 'PUT',
    type: 'company',
    formFields: {
      responsability_id: {
        name: 'responsability_id',
        label: 'Campo: Responsabilidades',
        isRequired: true,
        current_value: '',
        values: [
          {
            id: 1,
            description: 'Repostero'
          },
          {
            id: 2,
            description: 'Manejo de fondant'
          }
        ]
      },
      requirement_id: {
        name: 'requirement_id',
        label: 'Requerimientos',
        current_value: '',
        values: [
          {
            id: 1,
            description: 'Certificado en manipulación de alimentos'
          },
          {
            id: 2,
            description: 'Certificado en locución'
          }
        ]
      },
      vehicle_id: {
        name: 'vehicle_id',
        label: 'Requiere tu oferta algún tipo de automotor',
        currentValue: '',
        values: [
          {
            id: 1,
            description: 'Moto'
          },
          {
            id: 2,
            description: 'Carro'
          }
        ]
      },
      driving_license_id: {
        name: 'driving_license_id',
        label: 'Licencia de conducción requerida',
        currentValue: '',
        values: [
          {
            id: 1,
            description: 'Tipo 1'
          },
          {
            id: 2,
            description: 'Tipo 2'
          }
        ]
      }
    }
  }
}

const CompaniesStepSixPage = props => {
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
      <DynamicCompaniesStepSix formInfo={formInfo} {...props} />
    </AppLayout>
  )
}

export default CompaniesStepSixPage

CompaniesStepSixPage.propTypes = {
  log_out_companies: PropTypes.string.isRequired,
  company_signed_in: PropTypes.bool.isRequired,
  user_signed_in: PropTypes.bool.isRequired,
  log_out_user: PropTypes.string.isRequired,
  csrf_param: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired,
  path: PropTypes.string.isRequired,
  session_translation: PropTypes.object.isRequired
}