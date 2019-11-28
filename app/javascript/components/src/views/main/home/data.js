export const contenido = {
  cover: {
    welcome_Text: `Encuentra trabajo compatible con tus habilidades y competencias`,
    subtitle: 'El trabajo ideal lo encuentras en HoyTrabajas.com'
  },
  filterForm: {
    fields1: [
      { type: 'text', label: 'Palabra clave', name: 'keyWord' },
      {
        type: 'select',
        label: 'Ciudad',
        name: 'city',
        aux: [
          { label: 'text', value: 'test' },
          { label: 'text', value: 'test' },
          { label: 'text', value: 'test' }
        ]
      },
      {
        type: 'select',
        label: 'Tiempo',
        name: 'time',
        aux: [
          { label: 'text', value: 'test' },
          { label: 'text', value: 'test' },
          { label: 'text', value: 'test' }
        ]
      },
      {
        type: 'select',
        label: 'Rango Salarial',
        name: 'pay',
        aux: [
          { label: 'text', value: 'test' },
          { label: 'text', value: 'test' },
          { label: 'text', value: 'test' }
        ]
      }
    ],
    button1: 'Categories'
  },
  categories: {
    title: {
      main: 'El trabajo ideal',
      highlighted: 'si existe',
      last: 'esta en Hoy Trabajas'
    },
    subtexto:
      'Encuentra en un solo lugar las oportunidades de trabajo de acuerdo a tus intereses'
  },
  common: {
    categorias: [
      {
        img: 'icon-bar.svg',
        cant: Math.floor(Math.random() * (100 - 1 + 1)) + 1,
        name: 'Ventas y comercial'
      },
      {
        img: 'icon-bar.svg',
        cant: Math.floor(Math.random() * (100 - 1 + 1)) + 1,
        name: 'Marketing'
      },
      {
        img: 'icon-bar.svg',
        cant: Math.floor(Math.random() * (100 - 1 + 1)) + 1,
        name: 'Servicio al cliente'
      },
      {
        img: 'icon-bar.svg',
        cant: Math.floor(Math.random() * (100 - 1 + 1)) + 1,
        name: 'Operario'
      },
      {
        img: 'icon-bar.svg',
        cant: Math.floor(Math.random() * (100 - 1 + 1)) + 1,
        name: 'Gestión administrativa'
      },
      {
        img: 'icon-bar.svg',
        cant: Math.floor(Math.random() * (100 - 1 + 1)) + 1,
        name: 'Construcción y mantenimiento'
      },
      {
        img: 'icon-bar.svg',
        cant: Math.floor(Math.random() * (100 - 1 + 1)) + 1,
        name: 'Servicios generales y limpieza'
      },
      {
        img: 'icon-bar.svg',
        cant: Math.floor(Math.random() * (100 - 1 + 1)) + 1,
        name: 'Mensajería y transporte'
      },
      {
        img: 'icon-bar.svg',
        cant: Math.floor(Math.random() * (100 - 1 + 1)) + 1,
        name: 'Eventos y protocolo'
      },
      {
        img: 'icon-bar.svg',
        cant: Math.floor(Math.random() * (100 - 1 + 1)) + 1,
        name: 'Tecnología y Programación'
      },
      {
        img: 'icon-bar.svg',
        cant: Math.floor(Math.random() * (100 - 1 + 1)) + 1,
        name: 'Diseño'
      }
    ]
  },
  premium: {
    content: [
      {
        img: 'push.png',
        headline: 'Un super poder',
        desc: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed'
      },
      {
        img: 'tag.png',
        headline: 'Un super poder',
        desc: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed'
      },
      {
        img: 'call.png',
        headline: 'Un super poder',
        desc: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed'
      }
    ],
    button: 'Ver todos los beneficios premiun'
  },
  companies: {
    catalogo: Array(13).fill(null),
    title: {
      main: 'Ellos hoy confian en nosotros',
      subtitle: 'Para encontrar  su empleado ideal'
    }
  },
  gallery: {
    title: {
      main: 'El trabajo ideal',
      highlighted: 'si existe',
      last: 'esta en Hoy Trabajas'
    },
    ofertas: Array(6).fill(null),
    button: 'Ver más ofertas'
  }
}
