export default {
  prev: 8,
  pag: 9,
  next: null,
  title: '¿Cuentas con reconocimientos?',
  subtitle: 'Brinda a las empresas información valiosa sobre ti.',
  formSection: 'diplomas',
  formObj: [
    {
      kind: 'multiForm',
      className: 'justify-content-start align-items-end p-0 py-30 w-100 m-0',
      style: {
        flexWrap: 'wrap',
        display: 'flex'
      },
      pro: {
        name: 'multiFormWrapper',
        fields: [
          {
            kind: 'stInput',
            className: 'position-relative my-30 mt-60 col-12 animated fadeIn',
            xs: 12,
            pro: {
              className: '',
              name: 'title',
              id: 'title',
              label: 'Título reconocimiento',
              fullWidth: true
            },
            extra: {
              isAlphanumeric: true
            }
          },
          {
            kind: 'datePicker',
            className: 'col-12 col-md-6 my-30 animated fadeIn',
            pro: {
              className: '',
              name: 'started_at',
              id: 'started_at',
              label: 'Fecha Inicio',
              fullWidth: true,
              datepicker: {
                format: 'MMM yyyy',
                disableFuture: true,
                emptyLabel: '...',
                views: ['month', 'year']
              }
            }
          },
          {
            kind: 'stInput',
            className: 'my-30 col-12 col-md-6 animated fadeIn',
            pro: {
              className: 'm-0',
              name: 'school',
              id: 'school',
              label: 'Institución o entidad',
              placeholder: 'Servicio nacional de aprendizaje SENA',
              fullWidth: true,
              sizes: {
                xs: 12,
                lg: 6
              }
            },
            extra: {
              isAlphanumeric: true
            }
          },
          {
            kind: 'drag_drop',
            className:
              'my-20 mx-auto justify-content-center align-items-center animated fadeIn',
            pro: {
              name: 'file',
              id: 'file',
              sizes: {
                xs: 12
              }
            }
          },
          {
            kind: 'modal',
            className:
              'my-20 justify-content-center align-items-center animated fadeIn',
            pro: {
              className: 'justify-content-center',
              buttonClass: 'px-10 text-center text-wrap fw-bold',
              contained: true,
              style: { borderRadius: '30px', fontSize: '.75rem' },
              icon: true,
              color: 'primary',
              buttonSize: 'small',
              text: 'Agregar otro reconocimiento',
              sizes: {
                xs: 12
              }
            },
            extra: {
              ignoreState: true
            }
          },
          {
            kind: 'chips',
            className:
              'my-20 justify-content-center align-items-center animated fadeIn',
            pro: {
              className: '',
              multiple: true
            },
            extra: {
              ignoreState: true
            }
          }
        ]
      }
    }
  ]
}
