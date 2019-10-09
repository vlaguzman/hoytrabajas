import React from 'react'
import { DynamicOffersSteps } from '../../../src/views/DynamicViews'
import AppLayout from '../../../src/components/Layout/AppLayout'

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
    fields: [
      {
        name: 'name',
        label: 'Nombre empresa o Razón social*'
      },
      {
        name: 'industry_id',
        label: 'Sector al que pertenece tu empresa*',
        values: [
          {
            id: 1,
            description: 'Textiles'
          }
        ]
      },
      {
        name: 'employees_range_id',
        label: 'bla',
        values: [
          {
            id: 1,
            description: '0 - 100'
          }
        ]
      }
    ]
  }
}

const OffersStepsPage = props => {
  const { formIndex = 0 } = props
  return (
    <AppLayout>
      <DynamicOffersSteps {...{ formInfo, formIndex }} />
    </AppLayout>
  )
}

export default OffersStepsPage
