export default {
  pag: 6,
  next: null,
  prev: 5,
  title: 'Conozcamos más de tu oferta',
  subtitle: 'Brinda a tu candidato información de tu empresa.',

  formObj: [
    // *****************************
    // *****************************
    // *****************************
    // *****************************
    //******************** Primero
    // *****************************
    // *****************************
    // *****************************
    // *****************************
    {
      kind: 'mini_form',
      className: 'w-100 my-10',
      pro: {
        className:
          'd-flex justify-content-around align-items-center p-20  w-100 animated fadeIn',
        // form_title: 'Define tres habilidades que destacarías de tu perfil',
        // button_text: null,
        boxShadow: 3,
        icon_button: true,
        fields: [
          {
            kind: 'selectChip',
            className: 'w-80 animated fadeIn d-flex justify-content-around',
            pro: {
              sideText: 'Nivel minimo de educación',
              className: 'w-50',
              name: 'documento',
              multiple: true,
              value: ['Diseño Gráfico'],
              // onChange={handleChange}
              id: 'documento',
              // label:"Habilidades",
              style: { marginTop: '-1.5rem' }
            },
            aux: [
              {
                value: 'USD',
                label: 'algo'
              },
              {
                value: 'EUR',
                label: 'mas'
              },
              {
                value: 'BTC',
                label: 'otro'
              },
              {
                value: 'JPY',
                label: 'hollow'
              }
            ]
          }
        ]
      }
    },
    // *****************************
    // *****************************
    // *****************************
    // *****************************
    //******************** Segundo
    // *****************************
    // *****************************
    // *****************************
    // *****************************
    {
      kind: 'mini_form',
      className: 'w-100 my-10',
      pro: {
        className:
          'd-flex justify-content-start align-items-center p-20  w-100 animated fadeIn',
        // button_text: null,
        boxShadow: 3,
        icon_button: true,
        fields: [
          {
            kind: 'selectChip',
            className: 'animated fadeIn d-flex justify-content-start',
            pro: {
              sideText: 'Con mínimo',
              className: 'w-40 ml-20',
              name: 'documento',
              multiple: true,
              value: [1],
              // onChange={handleChange}
              id: 'documento',
              // label:"Habilidades",
              style: { marginTop: '-1.5rem' }
            },
            aux: [
              {
                value: 'USD',
                label: 'algo'
              },
              {
                value: 'EUR',
                label: 'mas'
              },
              {
                value: 'BTC',
                label: 'otro'
              },
              {
                value: 'JPY',
                label: 'hollow'
              }
            ]
          },
          {
            kind: 'selectChip',
            className: 'animated fadeIn d-flex justify-content-start',
            pro: {
              sideTextRight: 'de experiencia  ó',
              className: 'mr-20',
              name: 'documento',
              multiple: true,
              value: ['Años'],
              // onChange={handleChange}
              id: 'documento',
              // label:"Habilidades",
              style: { marginTop: '-1.5rem' }
            },
            aux: [
              {
                value: 'USD',
                label: 'algo'
              },
              {
                value: 'EUR',
                label: 'mas'
              },
              {
                value: 'BTC',
                label: 'otro'
              },
              {
                value: 'JPY',
                label: 'hollow'
              }
            ]
          },
          {
            kind: 'radio',
            className: ' position-relative w-30 animated fadeIn',
            pro: {
              className:
                'p-0 w-100  d-flex flex-row position-absolute animated fadeIn',
              style: { top: '-1.8rem' },
              name: 'radio',
              value: null
            },
            aux: ['Sin experiencia']
          }
        ]
      }
    },
    // *****************************
    // *****************************
    // *****************************
    // *****************************
    //******************** Tercero
    // *****************************
    // *****************************
    // *****************************
    // *****************************
    {
      kind: 'mini_form',
      className: 'w-100 my-10',
      pro: {
        // form_title: '¿Te gustaría aprender o reforzar alguna otra habilidad?',
        className:
          'd-flex justify-content-around align-items-center p-20  w-100 animated fadeIn',
        // button_text: null,
        boxShadow: 3,
        icon_button: true,
        fields: [
          {
            kind: 'selectChip',
            className: 'animated fadeIn d-flex',
            pro: {
              sideText: 'Manejo del idioma',
              className: 'ml-20',
              name: 'documento',
              multiple: true,
              value: ['Diseño Gráfico'],
              // onChange={handleChange}
              id: 'documento',
              // label:"Habilidades",
              style: { marginTop: '-1.5rem' }
            },
            aux: [
              {
                value: 'USD',
                label: 'algo'
              },
              {
                value: 'EUR',
                label: 'mas'
              },
              {
                value: 'BTC',
                label: 'otro'
              },
              {
                value: 'JPY',
                label: 'hollow'
              }
            ]
          },
          {
            kind: 'selectChip',
            className: 'ml-20 animated fadeIn d-flex',
            pro: {
              sideText: 'con nivel',
              className: 'ml-20',
              name: 'documento',
              multiple: true,
              value: ['Diseño Gráfico'],
              // onChange={handleChange}
              id: 'documento',
              // label:"Habilidades",
              style: { marginTop: '-1.5rem' }
            },
            aux: [
              {
                value: 'USD',
                label: 'algo'
              },
              {
                value: 'EUR',
                label: 'mas'
              },
              {
                value: 'BTC',
                label: 'otro'
              },
              {
                value: 'JPY',
                label: 'hollow'
              }
            ]
          }
        ]
      }
    },
    // *****************************
    // *****************************
    // *****************************
    // *****************************
    //******************** Cuarto
    // *****************************
    // *****************************
    // *****************************
    // *****************************
    {
      kind: 'mini_form',
      className: 'w-100 my-10',
      pro: {
        className:
          'd-flex justify-content-around align-items-center p-20  w-100 animated fadeIn',
        // button_text: null,
        boxShadow: 3,
        icon_button: true,
        fields: [
          {
            kind: 'selectChip',
            className: 'w-70 animated fadeIn d-flex',
            pro: {
              sideText: 'Que resida en',
              className: 'w-60 ml-20',
              name: 'documento',
              multiple: true,
              value: ['Diseño Gráfico'],
              // onChange={handleChange}
              id: 'documento',
              // label:"Habilidades",
              style: { marginTop: '-1.5rem' }
            },
            aux: [
              {
                value: 'USD',
                label: 'algo'
              },
              {
                value: 'EUR',
                label: 'mas'
              },
              {
                value: 'BTC',
                label: 'otro'
              },
              {
                value: 'JPY',
                label: 'hollow'
              }
            ]
          }
        ]
      }
    },
    // *****************************
    // *****************************
    // *****************************
    // *****************************
    // ******************** quinto
    // *****************************
    // *****************************
    // *****************************
    // *****************************
    {
      kind: 'mini_form',
      className: 'w-100 my-10',
      pro: {
        className:
          'd-flex justify-content-around align-items-center p-20  w-100 animated fadeIn',
        // button_text: null,
        boxShadow: 3,
        icon_button: true,
        fields: [
          {
            kind: 'selectChip',
            className: 'w-50 animated fadeIn d-flex',
            pro: {
              sideText: 'Con habilidades en',
              className: 'ml-20',
              name: 'documento',
              multiple: true,
              value: ['Diseño Gráfico'],
              // onChange={handleChange}
              id: 'documento',
              // label:"Habilidades",
              style: { marginTop: '-1.5rem' }
            },
            aux: [
              {
                value: 'USD',
                label: 'algo'
              },
              {
                value: 'EUR',
                label: 'mas'
              },
              {
                value: 'BTC',
                label: 'otro'
              },
              {
                value: 'JPY',
                label: 'hollow'
              }
            ]
          },
          {
            kind: 'selectChip',
            className: 'animated fadeIn d-flex',
            pro: {
              sideText: 'con nivel',
              className: 'ml-20',
              name: 'documento',
              multiple: true,
              value: ['Diseño Gráfico'],
              // onChange={handleChange}
              id: 'documento',
              // label:"Habilidades",
              style: { marginTop: '-1.5rem' }
            },
            aux: [
              {
                value: 'USD',
                label: 'algo'
              },
              {
                value: 'EUR',
                label: 'mas'
              },
              {
                value: 'BTC',
                label: 'otro'
              },
              {
                value: 'JPY',
                label: 'hollow'
              }
            ]
          }
        ]
      }
    },
    {
      kind: 'fourButtons',
      className:
        'w-100 mt-50 d-flex justify-content-around align-items-center animated fadeIn',
      pro: {
        buttons: [
          {
            className: '',
            buttonClass: 'px-30 text-center fw-bold',
            contained: false,
            style: { borderRadius: '30px', fontSize: '.75rem' },
            color: 'primary',
            size: 'large',
            text: 'Experiencias'
          },
          {
            className: '',
            buttonClass: 'px-30 text-center fw-bold',
            contained: false,
            style: { borderRadius: '30px', fontSize: '.75rem' },
            color: 'primary',
            size: 'large',
            text: 'Formación'
          },
          {
            className: '',
            buttonClass: 'px-30 text-center fw-bold',
            contained: false,
            style: { borderRadius: '30px', fontSize: '.75rem' },
            color: 'primary',
            size: 'large',
            text: 'Ubicación'
          },
          {
            className: '',
            buttonClass: 'px-30 text-center fw-bold',
            contained: false,
            style: { borderRadius: '30px', fontSize: '.75rem' },
            color: 'primary',
            size: 'large',
            text: 'Certificaciones'
          },
          {
            className: '',
            buttonClass: 'px-30 text-center fw-bold',
            contained: false,
            style: { borderRadius: '30px', fontSize: '.75rem' },
            color: 'primary',
            size: 'large',
            text: 'Idiomas'
          }
        ]
      }
    }
  ]
}
