import React from 'react'
import { DynamicCompaniesStepOne } from '../../../../../src/views/DynamicViews'
import AppLayout from '../../../../../src/components/Layout/AppLayout'

const formInfo = {
  title: 'Empecemos por conocernos',
  subtitle: 'Brinda a tu candidato información de tu empresa.',
  form: {
    buttons: {
      submit: 'Siguiente'
    },
    action: '',
    method: 'PUT',
    type: 'company',
    formFields: {
      name: {
        name: 'name',
        label: 'Nombre empresa o Razón social*'
      },
      industry_id: {
        name: 'industry_id',
        label: 'Sector al que pertenece tu empresa*',
        values: [
          {
            id: 1,
            description: 'Textiles'
          }
        ]
      },
      contact_work_position: {
        name: 'contact_work_position',
        label: 'Cargo'
      },
      contact_name: {
        name: 'contact_name',
        label: 'Persona de contacto'
      },
      contact_cellphone: {
        name: 'contact_cellphone',
        label: 'Número de contacto'
      },
      employees_range_id: {
        name: 'employees_range_id',
        label: 'Número de empleados',
        values: [
          {
            id: 1,
            description: '1 - 5'
          },
          {
            id: 2,
            description: '6 - 20'
          },
          {
            id: 3,
            description: '21 - 50'
          },
          {
            id: 4,
            description: '51 - 100'
          }
        ]
      }
    }
  }
}

const CompaniesStepOnePage = props => {
  return (
    <AppLayout>
      <DynamicCompaniesStepOne formInfo={formInfo} />
    </AppLayout>
  )
}

export default CompaniesStepOnePage
