export default {
  pag: 2,
  next: 3,
  prev: 1,
  title: '¡Búsquemos las mejores ofertas!',
  subtitle: 'Brinda a las empresas información valiosa sobre ti.',
  formSection: 'job_info',
  formObj: [
    {
      kind: 'selectChip',
      className: 'my-30 mt-60 animated fadeIn',
      xs: 12,
      // md: 6,
      pro: {
        className: '',
        name: 'job_categories',
        id: 'job_categories',
        multiple: true,
        label: 'Elige las categorías en las que deseas buscar trabajo'
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
        name: 'job_offer',
        id: 'job_offer',
        multiple: true,
        label: 'Tipo de oferta'
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
        name: 'legal_agreement',
        id: 'legal_agreement',
        multiple: false,
        label: 'Acuerdo legal'
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
        name: 'work_methodology',
        id: 'work_methodology',
        multiple: true,
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
    },
    {
      kind: 'selectChip',
      className: 'my-30 animated fadeIn',
      xs: 12,
      md: 6,
      pro: {
        className: '',
        multiple: false,
        label: 'Disponibilidad para trabajar',
        name: 'job_availability',
        id: 'job_availability'
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
