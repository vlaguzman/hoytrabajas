export default {
  pag: 0,
  next: null,
  prev: null,
  title: 'Empecemos por conocernos',
  subtitle: 'Brinda a las empresas información valiosa sobre ti.',
  formSection: 'aboutUser',
  formObj: [
    {
      kind: 'stInput',
      className: 'animated fadeIn',
      xs: 12,
      pro: {
        multiline: true,
        fullWidth: true,
        className: '',
        name: 'history',
        id: 'history',
        label: 'Hablanos un poco de tu empresa',
        //   defaultValue: "Default Value",
        margin: 'normal'
      }
    },
  ]
}
