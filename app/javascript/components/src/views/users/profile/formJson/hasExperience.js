export default {
  prev: 5,
  pag: 6,
  next: 7,
  title: 'Cuentanos un poco de tu experiencia',
  subtitle: 'Brinda a las empresas información valiosa sobre ti.',
  formSection: 'has_experience',
  formObj: [
    {
      kind: 'skipButton',
      className:
        'my-20 justify-content-center align-items-center animated fadeIn',
      xs: 12,
      pro: {
        title: 'Cuentas con experiencía',
        name: 'hasExperience_yes',
        titleClass: 'my-30 text-muted',
        className:
          'w-100 d-flex flex-column justify-content-center align-items-center',
        buttonClass: 'w-50 text-center fw-bold',
        contained: true,
        style: { borderRadius: '30px', fontSize: '.75rem' },
        color: 'primary',
        size: 'large',
        text: 'Si, quiero adicionarla'
      },
      aux: {
        skip: 7
      },
      extra: {
        ignoreState: true
      }
    },
    {
      kind: 'skipButton',
      className:
        'w-100 mt-0 mb-10 row justify-content-center align-items-center animated fadeIn',
      pro: {
        className: 'w-100 d-flex justify-content-center',
        buttonClass: 'w-50 text-center text-muted fw-bold',
        name: 'hasExperience_no',
        contained: true,
        style: { borderRadius: '30px', fontSize: '.75rem' },
        //   icon: true,
        color: 'default',
        size: 'large',
        text: 'No pero con disposición'
      },
      aux: {
        skip: 8
      },
      extra: {
        ignoreState: true
      }
    }
  ]
}
