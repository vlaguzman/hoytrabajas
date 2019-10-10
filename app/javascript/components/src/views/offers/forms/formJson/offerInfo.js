export default {
  prev: 'step_two',
  pag: 'step_three',
  next: 'step_four',
  title: 'Creemos tu primera oferta',
  subtitle: 'Brinda a tu candidato una relevante de tu empresa.',
  formSection: 'offer_info',
  formObj: [
    {
      kind: 'standard_input',
      className: 'my-30 animated fadeIn',
      xs: 12,
      pro: {
        className: 'my-0',
        name: 'offer_title',
        id: 'offer_title',
        label: 'Título de tu oferta'
      },
      extra: {
        isAlphanumeric: true,
        isLength: true,
        minLength: 0,
        maxLength: 16
      }
    },
    {
      kind: 'select',
      className: 'pr-0 my-30 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: '',
        name: 'offer_category',
        id: 'offer_category',
        label: 'Selecciona la categoría de tu oferta',
        select: true
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
      kind: 'textchip',
      className: 'pr-0 my-30 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: '',
        name: 'offer_role',
        id: 'offer_role',
        label: 'Elige el cargo que deseas contratar',
        select: true
      },
      extra: {
        subFields: {
          value: 'offer_role_id',
          label: 'offer_role_name'
        }
      }
    },
    {
      kind: 'select',
      className: 'pr-0 my-30 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: '',
        name: 'offer_type',
        id: 'offer_type',
        select: true,
        label: 'Tipo de oferta'
      },
      aux: [
        {
          value: 1,
          label: 'Ocasional'
        },
        {
          value: 2,
          label: 'Medio tiempo'
        },
        {
          value: 3,
          label: 'Tiempo completo'
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
        name: 'work_methodology',
        id: 'work_methodology',
        multiple: false,
        label: 'Modalidad de trabajo'
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
