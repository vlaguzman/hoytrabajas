export default {
  prev: null,
  pag: null,
  next: null,
  title: 'Conozcamos más de tu oferta',
  subtitle: 'Brinda a tu candidato información relevante de tu empresa.',
  editTitle: 'No está de más un poco de información',
  formSection: 'employee_profile',
  formObj: [
    {
      kind: 'selectChip',
      className: 'my-15 mt-40 p-0 animated fadeIn',
      xs: 12,
      pro: {
        className: 'ml-20',
        multiple: false,
        name: 'offer_city',
        id: 'offer_city',
        style: {
          width: `100%`,
          flex: 1,
          display: 'flex',
          alignItems: 'center',
          margin: 0
        }
      },
      extra: {
        beforeLabel: 'Que resida en',
        hasPaper: true
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
      className: 'my-15 p-0 animated fadeIn',
      xs: 12,
      pro: {
        className: 'ml-20',
        multiple: false,
        name: 'education_level',
        id: 'education_level',
        style: {
          width: `100%`,
          flex: 1,
          display: 'flex',
          alignItems: 'center',
          margin: 0
        }
      },
      extra: {
        beforeLabel: 'Nivel mínimo de educación',
        hasPaper: true
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
      kind: 'simpleRow',
      className: 'm-0 my-15 p-0 animated fadeIn',
      xs: 12,
      extra: {
        hasFields: true
        // hasPaper: true
      },
      pro: {
        className:
          'row justify-content-around align-items-end w-100 m-0 mx-10 my-20',
        name: 'minimal_experience',
        fields: [
          {
            kind: 'selectChip',
            // className: 'ml-20',
            xs: 6,
            lg: 4,
            pro: {
              className: 'ml-20',
              multiple: false,
              name: 'number',
              id: 'number',
              style: {
                width: `100%`,
                flex: 1,
                display: 'flex',
                alignItems: 'flex-end',
                margin: 0
              }
            },
            extra: {
              beforeLabel: `Con mínimo`
            },
            aux: [
              {
                value: 1,
                label: '1'
              },
              {
                value: 2,
                label: '2'
              },
              {
                value: 3,
                label: '3'
              },
              {
                value: 4,
                label: '4'
              }
            ]
          },
          {
            kind: 'selectChip',
            className: 'animated fadeIn',
            xs: 6,
            lg: 3,
            pro: {
              className: 'mr-20',
              multiple: true,
              name: 'type_of_unit',
              id: 'type_of_unit',
              style: {
                width: `100%`,
                flex: 1,
                display: 'flex',
                alignItems: 'flex-end',
                margin: 0
              }
            },
            extra: {
              afterLabel: 'de experiencia'
            },
            aux: [
              {
                value: 1,
                label: 'Semanas'
              },
              {
                value: 2,
                label: 'Meses'
              },
              {
                value: 3,
                label: 'Años'
              }
            ]
          },
          {
            kind: 'checkbox',
            className: ' position-relative my-10 radio-position',
            xs: 12,
            lg: 5,
            pro: {
              className: 'p-0 d-flex flex-row animated fadeIn',
              name: 'without_experience',
              id: 'without_experience',
              style: {
                width: `100%`,
                flex: 1,
                display: 'flex',
                alignItems: 'flex-end'
              }
            },
            extra: {
              beforeLabel: `ó`
            },
            aux: 'Sin experiencia'
          }
        ]
      }
    },
    {
      kind: 'formRow',
      className: 'my-15 p-0 animated fadeIn',
      xs: 12,
      pro: {
        className:
          'row justify-content-around align-items-end p-10 py-15 w-100 m-0',
        boxShadow: 3,
        iconButton: true,
        name: 'required_skills',
        id: 'required_skills',
        fields: [
          {
            kind: 'textchip',
            className: 'ml-10',
            pro: {
              className: 'ml-10',
              name: 'skills',
              id: 'skills',
              select: true,
              style: {
                width: `100%`,
                flex: 1,
                display: 'flex',
                alignItems: 'flex-end',
                margin: 0
              },
              sizes: {
                xs: 6,
                lg: 6
              }
            },
            extra: {
              beforeLabel: 'Con habilidades en',
              maxChips: 2,
              subFields: {
                value: 'skill_id',
                label: 'skill_name'
              }
            }
          },
          {
            kind: 'selectChip',
            className: 'my-20 animated fadeIn',
            pro: {
              className: 'ml-10',
              multiple: true,
              name: 'skill_proficiency',
              id: 'skill_proficiency',
              style: {
                width: `100%`,
                flex: 1,
                display: 'flex',
                alignItems: 'flex-end',
                margin: 0
              },
              sizes: {
                xs: 4,
                lg: 4
              }
            },
            extra: {
              beforeLabel: 'con nivel'
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
    },
    {
      kind: 'formRow',
      className: 'my-15 p-0 animated fadeIn',
      xs: 12,
      pro: {
        className:
          'row justify-content-around align-items-end p-10 py-15 w-100 m-0',
        boxShadow: 3,
        iconButton: true,
        name: 'required_languages',
        id: 'required_languages',
        fields: [
          {
            kind: 'textchip',
            className: 'pr-0 animated fadeIn',
            pro: {
              className: 'ml-10',
              name: 'languages',
              id: 'languages',
              select: true,
              style: {
                width: `100%`,
                flex: 1,
                display: 'flex',
                alignItems: 'flex-end',
                margin: 0
              },
              sizes: {
                xs: 6,
                lg: 6
              }
            },
            extra: {
              beforeLabel: 'Manejo del idioma',
              maxChips: 1,
              subFields: {
                value: 'language_id',
                label: 'language_name'
              }
            }
          },
          {
            kind: 'selectChip',
            className: 'my-20 animated fadeIn',
            pro: {
              className: 'ml-10',
              multiple: true,
              name: 'language_proficiency',
              id: 'language_proficiency',
              style: {
                width: `100%`,
                flex: 1,
                display: 'flex',
                alignItems: 'flex-end',
                margin: 0
              },
              sizes: {
                xs: 4,
                lg: 4
              }
            },
            extra: {
              beforeLabel: 'con nivel'
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
    }
  ]
}
