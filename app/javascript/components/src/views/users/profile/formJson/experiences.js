export default {
  prev: 6,
  pag: 7,
  next: 8,
  title: 'Cuéntanos un poco de tu experiencia',
  subtitle: 'Brinda a las empresas información valiosa sobre ti.',
  formSection: 'experiences',
  formObj: [
    {
      kind: 'multiForm',
      className: 'justify-content-start align-items-end p-0 py-30 w-100 m-0',
      style: {
        flexWrap: 'wrap',
        display: 'flex'
      },
      pro: {
        name: 'fields',
        fields: [
          {
            kind: 'select',
            className: 'my-30 animated fadeIn',
            pro: {
              className: 'm-0',
              name: 'job_category',
              id: 'job_category',
              select: true,
              label: 'Ubíca el empleo dentro de una categoría',
              // helperText: 'Ej: Belleza y salud',
              sizes: {
                xs: 12,
                md: 6
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
            kind: 'stInput',
            className: 'my-30 animated fadeIn',
            pro: {
              className: 'm-0',
              name: 'company',
              id: 'company',
              label: 'Empresa',
              sizes: {
                xs: 12,
                md: 6
              }
            },
            extra: {
              isAlphanumeric: true
            }
          },
          {
            kind: 'selectChip',
            className: 'my-30 animated fadeIn',
            pro: {
              className: '',
              name: 'role',
              id: 'role',
              multiple: true,
              label: 'Cargo',
              sizes: {
                xs: 12,
                md: 6
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
            kind: 'selectChip',
            className: 'my-30 animated fadeIn',
            pro: {
              className: '',
              name: 'job_city',
              id: 'job_city',
              multiple: false,
              label: 'Ciudad',
              sizes: {
                xs: 12,
                md: 6
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
            kind: 'selectChip',
            className: 'my-30 animated fadeIn',
            pro: {
              className: '',
              name: 'job_location',
              id: 'job_location',
              multiple: true,
              label: 'Localidad',
              sizes: {
                xs: 12,
                md: 6
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
            kind: 'selectChip',
            className: 'my-30 animated fadeIn',
            pro: {
              className: '',
              name: 'work_methodology',
              id: 'work_methodology',
              multiple: false,
              label: 'Modalidad de trabajo',
              sizes: {
                xs: 12,
                md: 6
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
            kind: 'selectChip',
            className: 'my-30 animated fadeIn',
            pro: {
              className: '',
              name: 'responsabilities',
              id: 'responsabilities',
              multiple: true,
              label: 'Habilidades desempeñadas',
              sizes: {
                xs: 12
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
            kind: 'datePicker',
            className: 'my-30',
            pro: {
              className: ' animated fadeIn',
              name: 'started_at',
              id: 'started_at',
              label: 'Fecha de inicio',
              sizes: {
                xs: 12,
                md: 3
              },
              datepicker: {
                format: 'MMM yyyy',
                disableFuture: true,
                emptyLabel: '...',
                views: ['month', 'year']
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
              label: 'Fecha terminación',
              sizes: {
                xs: 12,
                md: 3
              },
              datepicker: {
                format: 'MMM yyyy',
                disableFuture: false,
                emptyLabel: '...',
                views: ['month', 'year']
              }
            }
          },
          {
            kind: 'checkbox',
            className: ' position-relative my-30 radio-position',
            pro: {
              className:
                'p-0 w-100  d-flex flex-row position-absolute animated fadeIn',
              name: 'still_in_progress',
              id: 'still_in_progress',
              sizes: {
                xs: 12,
                md: 6
              }
            },
            aux: 'Actualmente laborando'
          },
          {
            kind: 'modal',
            className:
              'my-20 justify-content-center align-items-center animated fadeIn',
            pro: {
              className: 'justify-content-center',
              buttonClass: 'px-10 text-center fw-bold',
              contained: true,
              style: {
                borderRadius: '30px',
                lineHeight: '0',
                fontSize: '.75rem'
              },
              icon: true,
              color: 'primary',
              buttonSize: 'small',
              text: 'Agregar otra experiencia',
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
