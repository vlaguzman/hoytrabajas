export default {
  prev: 4,
  pag: 5,
  next: 6,
  title: 'Déjanos conocer tus habilidades',
  subtitle: 'Brinda a las empresas información valiosa sobre ti.',
  formSection: 'skills',
  formObj: [
    {
      kind: 'multiSelect',
      className: 'my-30 mt-60 p-0 animated fadeIn',
      xs: 12,
      pro: {
        className:
          'row justify-content-around align-items-center py-15 w-100 m-0',
        formTitle: 'Define tres habilidades que destacarías de tu perfil ',
        style: {
          padding: `10px 20px`
        },
        name: 'primary_skills',
        boxShadow: 3,
        iconButton: false,
        fields: [
          {
            kind: 'selectChip',
            className: 'my-20 animated fadeIn',
            xs: 12,
            pro: {
              className: '',
              multiple: true,
              name: 'primary_skills_array',
              id: 'primary_skills_array',
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
          }
        ]
      }
    },
    {
      kind: 'formRow',
      className: 'my-30 p-0 animated fadeIn',
      xs: 12,
      pro: {
        className:
          'row justify-content-around align-items-end p-10 py-15 w-100 m-0',
        formTitle: 'Define tres habilidades técnicas de acuerdo a tu perfil ',
        boxShadow: 3,
        iconButton: true,
        name: 'technical_skills',
        id: 'technical_skills',
        fields: [
          {
            kind: 'selectChip',
            className: 'my-20 animated fadeIn',
            pro: {
              className: '',
              multiple: true,
              name: 'skill_category',
              id: 'skill_category',
              style: {
                width: `100%`,
                flex: 1,
                display: 'flex',
                alignItems: 'flex-end',
                margin: 0
              },
              sizes: {
                xs: 12,
                lg: 4
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
            className: 'my-20 animated fadeIn',
            pro: {
              className: '',
              multiple: true,
              name: 'skill_name',
              id: 'skill_name',
              style: {
                width: `100%`,
                flex: 1,
                display: 'flex',
                alignItems: 'flex-end',
                margin: 0
              },
              sizes: {
                xs: 12,
                lg: 3
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
            className: 'my-20 animated fadeIn',
            pro: {
              className: '',
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
                xs: 10,
                lg: 3
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
          }
        ]
      }
    },
    {
      kind: 'formRow',
      className: 'my-30 p-0 animated fadeIn',
      xs: 12,
      pro: {
        formTitle: 'Define qué habilidades te gustaría aprender o reforzar',
        className:
          'row justify-content-around align-items-end p-10 py-15 w-100 m-0',
        boxShadow: 3,
        iconButton: true,
        name: 'other_skills',
        fields: [
          {
            kind: 'selectChip',
            className: 'my-20 animated fadeIn',
            pro: {
              className: '',
              multiple: true,
              name: 'skill_category',
              id: 'skill_category',
              style: {
                width: `100%`,
                flex: 1,
                display: 'flex',
                alignItems: 'flex-end',
                margin: 0
              },
              sizes: {
                xs: 3,
                lg: 3
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
            kind: 'textchip',
            className: 'my-20 animated fadeIn',
            pro: {
              className: '',
              multiple: true,
              name: 'skills',
              id: 'skills',
              style: {
                width: `100%`,
                flex: 1,
                display: 'flex',
                alignItems: 'flex-end',
                margin: 0
              },
              sizes: {
                xs: 7,
                lg: 7
              }
            },
            extra: {
              isLetters: true,
              placeholder: 'Escoge tus habilidades',
              subFields: {
                value: 'skill_id',
                label: 'skill_name'
              }
            }
          }
        ]
      }
    },
    {
      kind: 'formRow',
      className: 'my-30 p-0 animated fadeIn',
      xs: 12,
      pro: {
        formTitle: '¿Qué idiomas deseas resaltar en tu perfil?',
        className:
          'row justify-content-around align-items-end p-10 py-15 w-100 m-0',
        boxShadow: 3,
        iconButton: true,
        name: 'languages',
        fields: [
          {
            kind: 'selectChip',
            className: 'my-20 animated fadeIn',
            pro: {
              className: '',
              multiple: false,
              name: 'language_name',
              id: 'language_name',
              style: {
                width: `100%`,
                flex: 1,
                display: 'flex',
                alignItems: 'flex-end',
                margin: 0
              },
              sizes: {
                xs: 7,
                lg: 7
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
            className: 'my-20 animated fadeIn',
            pro: {
              className: '',
              multiple: true,
              name: 'language_proficiency',
              id: 'language_proficiency',
              sizes: {
                xs: 3,
                lg: 3
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
          }
        ]
      }
    }
  ]
}
