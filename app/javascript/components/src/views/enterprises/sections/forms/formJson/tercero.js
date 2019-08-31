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
        name: 'contact_person',
        id: 'contact_person',
        label: 'Persona de contacto'
      }
    },
    {
      kind: 'stInput',
      className: 'my-30 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: 'my-0',
        name: 'role',
        id: 'role',
        label: 'Cargo'
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
        select: true,
        label: ''
      },
      aux: [
        {
          value: '57',
          label: '(57)',
          code: 'co'
        }
      ]
    },
    {
      kind: 'stInput',
      className: 'my-30 animated fadeIn',
      xs: 8,
      lg: 4,
      pro: {
        className: 'my-0',
        name: 'phone',
        id: 'phone',
        label: 'Telefono de cóntacto'
      }
    },
    {
      kind: 'stInput',
      className: 'my-30 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: 'my-0',
        name: 'email',
        id: 'email',
        label: 'Correo electrónico',
      }
    }
  ]
}
