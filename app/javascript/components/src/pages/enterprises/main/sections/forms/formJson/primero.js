export default {
  pag: 0,
  next: 1,
  prev: null,
  title: 'Empecemos por conocernos',
  subtitle: 'Brinda a las empresas información valiosa sobre ti.',
  formSection: 'basic_nfo',
  formObj: [
    {
      kind: 'stInput',
      className: 'my-20 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: 'my-0',
        name: 'enterprise_name',
        id: 'enterprise_name',
        label: 'Nombre de la empresa o razón social',
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
        name: 'sector',
        id: 'sector',
        label: 'Sector al que pertenece tu empresa',
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
        name: 'nit',
        id: 'nit',
        label: 'Nit',
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
        name: 'address',
        id: 'address',
        label: 'Dirección',
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
        name: 'place',
        id: 'place',
        label: 'Localidad',
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
        name: 'email',
        id: 'email',
        label: 'Correo Electrónico',
        //   defaultValue: "Default Value",
        //    helperText: "Some important text",
        margin: 'normal'
      }
    },
    {
      kind: 'stInput',
      className: 'my-20 pl-2 animated fadeIn',
      xs: 12,
      lg: 6,
      pro: {
        className: 'my-0',
        name: 'webSite',
        id: 'webSite',
        label: 'Sitio web',
        //   defaultValue: "Default Value",
        //  helperText: "número de telefono",
        margin: 'normal'
      }
    }
  ]
}
