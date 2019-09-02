export default {
  prev: null,
  pag: null,
  next: null,
  title: 'Conozcamos más de tu oferta',
  subtitle: 'Brinda a tu candidato una relevante de tu empresa.',
  editTitle: 'Háblanos de tu oferta',
  formSection: 'offer_details',
  formObj: [
    {
      kind: 'selectChip',
      className: 'my-30 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: '',
        multiple: false,
        id: 'legal_agreement',
        name: 'legal_agreement',
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
      kind: 'slider',
      className: 'my-30 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        // className: 'p-0 w-100 d-flex flex-row animated fadeIn',
        name: 'vacancies',
        label: 'Elige el número de vacantes',
        id: 'vacancies'
      },
      extra: {
        step: 1,
        minValue: 1
      }
    },
    {
      kind: 'selectChip',
      className: 'my-30 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: '',
        multiple: false,
        id: 'offer_genre',
        name: 'offer_genre',
        label: 'Tu oferta está dirigida a'
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
      kind: 'slider',
      className: 'animated fadeIn my-30',
      xs: 12,
      lg: 6,
      pro: {
        // className: 'p-0 w-100 d-flex flex-row animated fadeIn',
        label: 'Edad del candidato',
        name: 'offer_age',
        id: 'offer_age'
      },
      extra: {
        step: 1,
        minValue: 18,
        maxValue: 60,
        beforeLabel: 'Edad min.',
        afterLabel: 'Edad máx.'
      }
    },
    {
      kind: 'datePicker',
      className: 'my-30 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: ' animated fadeIn',
        name: 'expires_at',
        id: 'expires_at',
        label: 'Fecha de inicio',
        datepicker: {
          format: 'dd MMMM yyyy',
          disableFuture: false,
          emptyLabel: '...'
        }
      }
    },
    {
      kind: 'checkbox',
      className: ' position-relative my-10 radio-position',
      pro: {
        className:
          'p-0 w-100  d-flex flex-row position-absolute animated fadeIn',
        name: 'start_at',
        id: 'start_at',
        label: `¿Cuál es el tiempo para cubrir esta oferta?`,
        sizes: {
          xs: 12,
          lg: 6
        }
      },
      aux: '¿Cuál es el tiempo para cubrir esta oferta?'
    }
  ]
}
