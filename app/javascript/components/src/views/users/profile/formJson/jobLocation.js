export default {
  prev: 2,
  pag: 3,
  next: 4,
  title: '¡Búsquemos las mejores ofertas!',
  subtitle: 'Brinda a las empresas información valiosa sobre ti.',
  formSection: 'job_location',
  formObj: [
    {
      kind: 'selectChip',
      className: 'my-30 mt-60 animated fadeIn',
      xs: 12,
      md: 6,
      pro: {
        className: '',
        multiple: false,
        id: 'job_state',
        name: 'job_state',
        label: 'Departamento'
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
      kind: 'checkbox',
      className: 'position-relative my-10 radio-position',
      xs: 12,
      md: 6,
      pro: {
        className:
          'p-0 w-100  d-flex flex-row position-absolute animated fadeIn',
        name: 'work_other_cities',
        id: 'work_other_cities'
      },
      aux: 'Disponibilidad para trabajar en otras ciudades'
    },
    {
      kind: 'selectChip',
      className: 'my-30 animated fadeIn',
      xs: 12,
      md: 6,
      pro: {
        className: '',
        multiple: false,
        id: 'job_city',
        name: 'job_city',
        label: 'Ciudad'
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
      md: 6,
      pro: {
        className: '',
        multiple: true,
        id: 'job_location',
        name: 'job_location',
        label: 'Selecciona la localidad'
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
      md: 6,
      pro: {
        className: '',
        multiple: true,
        id: 'vehicle',
        name: 'vehicle',
        label: 'Cuentas con algún tipo de vehículo'
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
      md: 6,
      pro: {
        className: '',
        multiple: true,
        id: 'licenses',
        name: 'licenses',
        label: 'Licencia de conducción requerida'
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
