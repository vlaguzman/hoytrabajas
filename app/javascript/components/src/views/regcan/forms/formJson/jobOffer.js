export default {
  prev: 3,
  pag: 4,
  next: 5,
  title: '¡Búsquemos las mejores ofertas!',
  subtitle: 'Brinda a las empresas información valiosa sobre ti.',
  formSection: 'job_offer',
  formObj: [
    {
      kind: 'selectChip',
      className: 'my-30 mt-60 animated fadeIn',
      xs: 12,
      pro: {
        className: '',
        multiple: true,
        id: 'days_available',
        name: 'days_available',
        label: '¿Qué días estás disponible para trabajar?'
      },
      aux: [
        {
          value: 1,
          label: 'One'
        },
        {
          value: 2,
          label: 'Two'
        },
        {
          value: 3,
          label: 'Three'
        },
        {
          value: 4,
          label: 'Four'
        }
      ]
    },
    {
      kind: 'selectChip',
      className: 'my-30 animated fadeIn',
      xs: 12,
      pro: {
        className: '',
        multiple: true,
        id: 'working_hours',
        name: 'working_hours',
        label: 'Franja horaria'
      },
      aux: [
        {
          value: 1,
          label: 'One'
        },
        {
          value: 2,
          label: 'Two'
        },
        {
          value: 3,
          label: 'Three'
        },
        {
          value: 4,
          label: 'Four'
        }
      ]
    },
    {
      kind: 'controlledInputs',
      className: 'justify-content-start align-items-end p-0 py-30 w-100 my-30',
      style: {
        flexWrap: 'wrap',
        display: 'flex'
      },
      pro: {
        name: 'type_range',
        formTitle: 'Aspiración salarial',
        mainField: {
          kind: 'select',
          pro: {
            className: 'animated fadeIn controlledInputs',
            name: 'type_range',
            id: 'type_range',
            select: true,
            sizes: {
              xs: 12,
              lg: 3
            }
          },
          aux: [
            {
              value: 1,
              label: 'Rango'
            },
            {
              value: 2,
              label: 'Fijo'
            }
          ],
          validation: {
            type: 'text'
          }
        },
        fields: [
          {
            kind: 'select',
            pro: {
              className: 'animated fadeIn controlledInputs mt-20',
              name: 'currency',
              id: 'currency',
              select: true,
              sizes: {
                xs: 12,
                lg: 2
              }
            },
            aux: [
              {
                value: 1,
                label: 'COP'
              },
              {
                value: 2,
                label: 'USD'
              }
            ]
          },
          {
            kind: 'stInput',
            containerStyle: {
              flex: 1
            },
            pro: {
              className: 'animated fadeIn controlledInputs mt-20',
              name: 'min_salary',
              id: 'min_salary',
              placeholder: 'Ej: 750.000',
              sizes: {
                xs: 6,
                lg: 2
              },
              style: {
                width: '100%'
              }
            },
            extra: {
              isCurrency: true
            }
          },
          {
            kind: 'stInput',
            containerStyle: {
              flex: 1
            },
            pro: {
              className: 'animated fadeIn controlledInputs mt-20',
              name: 'max_salary',
              id: 'max_salary',
              placeholder: 'Ej: 750.000',
              style: {
                width: '100%'
              }
            },
            extra: {
              before: 'a',
              showWithRange: true,
              isCurrency: true
            },
            validation: {
              type: 'number'
            }
          },
          {
            kind: 'select',
            pro: {
              className: 'animated fadeIn controlledInputs mt-20',
              name: 'salary_interval',
              id: 'salary_interval',
              select: true,
              label: 'Pago',
              sizes: {
                xs: 12,
                lg: 3
              }
            },
            aux: [
              {
                value: 1,
                label: 'Diario'
              },
              {
                value: 2,
                label: 'Semanal'
              },
              {
                value: 3,
                label: 'Quincenal'
              },
              {
                value: 4,
                label: 'Mensual'
              }
            ]
          }
        ]
      }
    }
  ]
}
