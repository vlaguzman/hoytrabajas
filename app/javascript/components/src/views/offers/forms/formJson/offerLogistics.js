export default {
  prev: 3,
  pag: 4,
  next: 5,
  title: 'Conozcamos más de tu oferta',
  subtitle: 'Brinda a tu candidato una relevante de tu empresa.',
  formSection: 'offer_logistics',
  formObj: [
    {
      kind: 'controlledInputs',
      className: 'justify-content-start align-items-end p-0 m-0 my-30 mt-60 w-100',
      xs: 12,
      style: {
        flexWrap: 'wrap',
        display: 'flex'
      },
      pro: {
        formTitle: 'Aspiración salarial',
        name: 'type_range',
        mainField: {
          kind: 'select',
          pro: {
            className: 'animated fadeIn controlledInputs mt-20',
            name: 'type_range',
            id: 'type_range',
            select: true,
            default: 1,
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
            xs: 12,
            lg: 2,
            pro: {
              className: 'animated fadeIn controlledInputs mt-20',
              name: 'min_salary',
              id: 'min_salary',
              label: '',
              placeholder: 'Ej: 750.000',
              sizes: {
                xs: 12,
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
              className: 'pr-0 animated fadeIn controlledInputs mt-20',
              name: 'max_salary',
              id: 'max_salary',
              label: '',
              placeholder: 'Ej: 750.000',
              style: {
                width: '100%'
              },
              sizes: {
                xs: 12,
                lg: 2
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
    },
    {
      kind: 'selectChip',
      className: 'my-30 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: '',
        multiple: true,
        id: 'required_days',
        name: 'required_days',
        label: '¿Qué días de la semana?'
      },
      aux: [
        {
          value: 1,
          label: 'Lunes a viernes'
        },
        {
          value: 2,
          label: 'Fines de semana'
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
      lg: 6,
      pro: {
        className: '',
        multiple: true,
        id: 'working_hours',
        name: 'working_hours',
        label: '¿En qué jornada?'
      },
      aux: [
        {
          value: 1,
          label: 'Mañana 7am-1pm'
        },
        {
          value: 2,
          label: 'Tarde 2pm-7pm'
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
        id: 'benefits',
        name: 'benefits',
        label: 'Auxilios o prestaciones asociados a tu oferta'
      },
      aux: [
        {
          value: 1,
          label: 'Auxilio transporte'
        },
        {
          value: 2,
          label: 'Comisiones'
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
    }
  ]
}
