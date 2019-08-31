export default {
  pag: 1,
  next: 2,
  prev: 0,
  title: 'Empecemos por conocernos',
  subtitle: 'Brinda a tu candidato información de tu empresa.',
  formSection: 'about_company',
  formObj: [
    {
      kind: 'stInput',
      className: 'my-30 mt-60 animated fadeIn',
      xs: 12,
      pro: {
        multiline: true,
        fullWidth: true,
        className: '',
        name: 'history',
        id: 'history'
        // label: 'Cuéntanos un poco de ti',
      },
      extra: {
        isTextarea: true,
        isLength: true,
        minLength: 0,
        maxLength: 256
      }
    }
  ]
}
