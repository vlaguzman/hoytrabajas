export default {
  pag: 1,
  next: 2,
  prev: 0,
  title: 'Empecemos por conocernos',
  subtitle: 'Brinda a las empresas información valiosa sobre ti.',
  formSection: 'about_user',
  formObj: [
    {
      kind: 'standard_input',
      className: 'mt-60 px-15 animated fadeIn',
      xs: 12,
      pro: {
        multiline: true,
        fullWidth: true,
        className: '',
        name: 'history',
        id: 'history',
        label: 'Cuéntanos un poco de ti'
      },
      extra: {
        isLength: true,
        minLength: 0,
        maxLength: 256
      }
    },
    {
      kind: 'selectChip',
      className: 'px-15 my-25 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: ' my-0',
        label: 'Genero',
        name: 'genre',
        id: 'genre',
        multiple: false
      },
      extra: {
        isInt: true
      },
      aux: [
        {
          value: 1,
          label: 'Hombre'
        },
        {
          value: 2,
          label: 'Mujer'
        }
      ]
    },
    {
      kind: 'datePicker',
      className: 'my-30',
      xs: 12,
      md: 6,
      pro: {
        className: ' animated fadeIn',
        name: 'started_at',
        id: 'started_at',
        label: 'Fecha de inicio',
        datepicker: {
          format: 'dd MMM yyyy',
          disableFuture: true,
          emptyLabel: '...'
        }
      },
      extra: {
        isDate: true
      }
    },
    {
      kind: 'selectChip',
      className: 'px-15 my-25 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: '',
        name: 'special_condition',
        id: 'special_condition',
        multiple: false,
        label: 'Tienes alguna condición especial'
      },
      extra: {
        isInt: true
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
      className: 'px-15 my-25 animated fadeIn',
      xs: 12,
      md: 6,
      pro: {
        className: '',
        name: 'education_level',
        id: 'education_level',
        multiple: false,
        label: 'Nivel de educación'
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
      className: 'my-25 animated fadeIn px-20',
      xs: 12,
      lg: 6,
      pro: {
        className: '',
        multiple: true,
        id: 'vehicle',
        name: 'vehicle',
        label: 'Cuentas con algún tipo de vehículo'
      },
      aux: [
        {
          value: 'USD',
          label: 'algo'
        },
        {
          value: 'EUR',
          label: 'mas'
        },
        {
          value: 'BTC',
          label: 'otro'
        },
        {
          value: 'JPY',
          label: 'hollow'
        }
      ]
    },
    {
      kind: 'selectChip',
      className: 'my-25 animated fadeIn px-20',
      xs: 12,
      lg: 6,
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
