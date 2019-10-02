export default {
  prev: null,
  pag: 'step_one',
  next: 'step_two',
  title: 'Empecemos por conocernos',
  subtitle: 'Brinda a tu candidato información valiosa de tu empresa.',
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
        label: 'Nombre empresa o Razón social'
      },
      extra: {
        isAlphanumeric: true
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
      },
      extra: {
        isLetters: true
      }
    },
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
      },
      extra: {
        isLetters: true
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
      },
      extra: {
        isLetters: true
      }
    },
    {
      kind: 'select',
      className: 'pr-0 my-30 animated fadeIn',
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
          label: '(57)',
          code: 'CO'
        }
      ]
    },
    {
      kind: 'stInput',
      className: 'my-30 pl-2 animated fadeIn',
      xs: 8,
      lg: 4,
      pro: {
        className: 'my-0',
        name: 'phone',
        id: 'phone',
        label: 'Número de contacto'
      },
      extra: {
        isNumeric: true
      }
    },
    {
      kind: 'selectChip',
      className: 'px-15 my-30 animated fadeIn',
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
    }
  ]
}
