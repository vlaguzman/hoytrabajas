export default {
  pag: 0,
  next: 1,
  prev: null,
  title: 'Empecemos por conocernos',
  subtitle: 'Brinda a las empresas información valiosa sobre ti.',
  formSection: 'basic_info',
  formObj: [
    {
      kind: 'standard_input',
      className: 'my-30 mt-60 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: 'my-0',
        name: 'name',
        id: 'name',
        label: 'Nombre',
        margin: 'normal'
      },
      extra: {
        isLetters: true
      }
    },
    {
      kind: 'standard_input',
      className: 'my-30 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: 'my-0',
        name: 'last_name',
        id: 'last_name',
        label: 'Apellido'
      },
      extra: {
        isLetters: true
      }
    },
    {
      kind: 'selectChip',
      className: 'my-30 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: '',
        name: 'nationality',
        id: 'nationality',
        multiple: false,
        label: 'Nacionalidad'
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
      kind: 'select',
      className: 'my-30 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: 'my-0',
        name: 'document',
        id: 'document',
        select: true,
        label: 'Tipo de Documento'
      },
      extra: {
        isInt: true
      },
      aux: [
        {
          value: 1,
          label: 'Cédula'
        },
        {
          value: 2,
          label: 'Pasaporte'
        }
      ]
    },
    {
      kind: 'standard_input',
      className: 'my-30 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: 'my-0',
        name: 'document_number',
        id: 'document_number',
        label: 'Número Documento'
      },
      extra: {
        isNumeric: true
      }
    },
    {
      kind: 'select',
      className: 'my-30 animated fadeIn',
      xs: 4,
      lg: 2,
      pro: {
        className: '',
        name: 'area_code',
        id: 'area_code',
        select: true
      },
      aux: [
        {
          value: '57',
          label: '57',
          code: 'CO'
        }
      ]
    },
    {
      kind: 'standard_input',
      className: 'my-30 pl-2 animated fadeIn',
      xs: 8,
      lg: 4,
      pro: {
        className: 'my-0',
        name: 'phone',
        id: 'phone',
        label: 'Teléfono de contacto'
      },
      extra: {
        isNumeric: true
      }
    }
  ]
}
