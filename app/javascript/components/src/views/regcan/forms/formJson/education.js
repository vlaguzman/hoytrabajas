export default {
  prev: 7,
  pag: 8,
  next: 9,
  title: 'Veamos tu formación académica',
  subtitle: 'Brinda a las empresas información valiosa sobre ti.',
  formSection: 'education',
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
            kind: 'standard_input',
            // title: 'Agrega completa para contar con mas oportunidades en la selección',
            className: 'position-relative my-30 mt-60 animated fadeIn',
            pro: {
              className: '',
              name: 'title',
              id: 'title',
              label: 'Título educativo',
              placeholder: '¿Posees algún título?',
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
            kind: 'standard_input',
            className: 'position-relative my-30 animated fadeIn',
            pro: {
              className: '',
              name: 'school',
              id: 'school',
              label: 'Institución',
              placeholder: 'Escoge tu institución.',
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
            kind: 'datePicker',
            className: 'my-30 animated fadeIn',
            pro: {
              className: '',
              name: 'started_at',
              id: 'started_at',
              label: 'Inicio',
              datepicker: {
                format: 'MMM yyyy',
                disableFuture: true,
                emptyLabel: '...',
                views: ['month', 'year']
              },
              sizes: {
                xs: 12,
                lg: 3
              }
            }
          },
          {
            kind: 'datePicker',
            className: 'my-30 animated fadeIn',
            pro: {
              className: '',
              name: 'finished_at',
              id: 'finished_at',
              label: 'Terminación',
              datepicker: {
                format: 'MMM yyyy',
                disableFuture: false,
                emptyLabel: '...',
                views: ['month', 'year']
              },
              sizes: {
                xs: 12,
                lg: 3
              }
            }
          },
          {
            kind: 'checkbox',
            className:
              'position-relative mt-10 animated fadeIn radio-position2',
            pro: {
              className: 'p-0 row position-absolute',
              name: 'still_in_progress',
              id: 'still_in_progress',
              sizes: {
                xs: 12,
                lg: 6
              }
            },
            aux: ['Estudio en curso']
          },
          {
            kind: 'select',
            className: 'my-30 animated fadeIn',
            pro: {
              className: 'm-0',
              name: 'location',
              id: 'location',
              select: true,
              label: 'Ubicación',
              margin: 'normal',
              sizes: {
                xs: 12,
                lg: 6
              }
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
            kind: 'drag_drop',
            className:
              'my-20 justify-content-center align-items-center animated fadeIn',
            pro: {
              name: 'file',
              id: 'file',
              sizes: {
                xs: 12,
                lg: 6
              }
            }
          },
          {
            kind: 'modal',
            className:
              'my-20 justify-content-center align-items-center animated fadeIn',
            pro: {
              className: ' justify-content-center',
              buttonClass: 'px-10 text-center fw-bold',
              contained: true,
              style: {
                borderRadius: '30px',
                lineHeight: '0',
                fontSize: '.75rem'
              },
              sizes: {
                xs: 12
              },
              icon: true,
              color: 'primary',
              buttonSize: 'small',
              text: 'Agregar otro estudio'
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
