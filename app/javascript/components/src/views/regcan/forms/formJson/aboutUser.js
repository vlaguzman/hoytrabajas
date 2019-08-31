export default {
  pag: 1,
  next: 2,
  prev: 0,
  title: 'Empecemos por conocernos',
  subtitle: 'Brinda a las empresas información valiosa sobre ti.',
  formSection: 'about_user',
  formObj: [
    {
      kind: 'stInput',
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
      lg: 6,
      pro: {
        className: ' animated fadeIn',
        name: 'age',
        id: 'age',
        label: 'Fecha de nacimiento',
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
      lg: 6,
      pro: {
        className: '',
        name: 'education_level',
        id: 'education_level',
        multiple: false,
        label: 'Nivel de educación'
      },
      extra: {
        isNumeric: true
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
