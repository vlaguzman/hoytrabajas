export default {
  pag: 0,
  next: null,
  prev: null,
  formSection: 'basic_info',
  formObj: [
    {
      kind: 'stInput',
      className: 'my-30 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: 'my-0',
        name: 'name',
        id: 'name',
        label: 'Nombre de la empresa o razón social'
      }
    },
    {
      kind: 'stInput',
      className: 'my-30 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: 'my-0',
        name: 'sector',
        id: 'sector',
        label: 'Sector al que pertenece tu empresa'
      }
    },
    {
      kind: 'stInput',
      className: 'my-30 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: 'my-0',
        name: 'nit',
        id: 'nit',
        label: 'Nit'
      }
    },
    {
      kind: 'selectChip',
      className: 'my-30 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: ' my-0',
        label: 'Número de empleados',
        name: 'number_of_employees',
        id: 'number_of_employees',
        multiple: false
      },
      aux: [
        {
          value: 1,
          label: '1-5'
        },
        {
          value: 2,
          label: '6-11'
        },
        {
          value: 3,
          label: '11-50'
        },
        {
          value: 4,
          label: '50+'
        }
      ]
    },
    {
      kind: 'stInput',
      className: 'my-30 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: 'my-0',
        name: 'location',
        id: 'location',
        label: 'Localidad'
      }
    },
    {
      kind: 'stInput',
      className: 'my-30 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: 'my-0',
        name: 'website',
        id: 'website',
        label: 'Sitio web'
      }
    },
    {
      kind: 'stInput',
      className: 'my-30 animated fadeIn',
      xs: 12,
      pro: {
        className: 'my-0',
        name: 'address',
        id: 'address',
        label: 'Dirección'
      }
    }
  ]
}
