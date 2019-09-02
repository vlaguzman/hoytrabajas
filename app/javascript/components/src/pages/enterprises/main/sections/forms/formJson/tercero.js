export default {
  pag: 0,
  next: null,
  prev: null,
  title: '¡Búsquemos las mejores ofertas!',
  subtitle: 'Brinda a las empresas información valiosa sobre ti.',
  formSection: 'jobInfo',
  formObj: [
    {
      kind: 'stInput',
      className: 'my-20 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: 'my-0',
        name: 'contact_person',
        id: 'contact_person',
        label: 'Persona de contacto',
        //   defaultValue: "Default Value",
        //    helperText: "Some important text",
        margin: 'normal'
      }
    },
    {
      kind: 'stInput',
      className: 'my-20 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: 'my-0',
        name: 'position',
        id: 'position',
        label: 'Cargo',
        //   defaultValue: "Default Value",
        //    helperText: "Some important text",
        margin: 'normal'
      }
    },
    {
      kind: 'select',
      className: 'pr-0 animated fadeIn',
      xs: 4,
      lg: 2,
      pro: {
        className: '',
        name: 'areaCode',
        id: 'areaCode',
        select: true,
        label: '',
        style: { marginTop: '2.4rem' },
        value: '57',
        SelectProps: { MenuProps: {} },
        margin: 'normal'
      },
      aux: [
        {
          value: '57',
          label: '(57)',
          code: 'co'
          //  size: '1x'
        }
      ]
    },
    {
      kind: 'stInput',
      className: 'my-20 pl-2 animated fadeIn',
      xs: 8,
      lg: 4,
      pro: {
        className: 'my-0',
        name: 'phone',
        id: 'phone',
        label: 'Telefono de cóntacto*',
        //   defaultValue: "Default Value",
        //  helperText: "número de telefono",
        margin: 'normal'
      }
    },
    {
      kind: 'stInput',
      className: 'my-20 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: 'my-0',
        name: 'email',
        id: 'email',
        label: 'Correo Electrónico',
        margin: 'normal'
      }
    }
  ]
}
