export default {
  prev: 4,
  pag: 5,
  next: 6,
  title: 'Conozcamos más de tu oferta',
  subtitle: 'Brinda a tu candidato una relevante de tu empresa.',
  formSection: 'offer_requirements',
  formObj: [
    {
      kind: 'textchip',
      className: 'my-30 animated fadeIn',
      xs: 12,
      pro: {
        name: 'responsabilities',
        id: 'responsabilities',
        label: 'Campo: Responsabilidades'
      },
      extra: {
        subFields: {
          value: 'responsability_id',
          label: 'responsability_name'
        }
      }
    },
    {
      kind: 'textchip',
      className: 'my-30 animated fadeIn',
      xs: 12,
      pro: {
        label: 'Requerimientos',
        name: 'requirements',
        id: 'requirements'
      },
      extra: {
        subFields: {
          value: 'requirement_id',
          label: 'requirement_name'
        }
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
        name: 'vehicle',
        id: 'vehicle',
        label: `Requiere tu oferta algún tipo de automotor`
      },
      aux: [
        {
          value: 1,
          label: 'Bicicleta'
        },
        {
          value: 2,
          label: 'Moto'
        },
        {
          value: 3,
          label: 'Automóvil'
        },
        {
          value: 4,
          label: 'Camión'
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
        name: 'license',
        id: 'license',
        label: `Licencia de conducción requerida`
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
    }
  ]
}
