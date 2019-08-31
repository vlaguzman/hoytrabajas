export const fields1 = [
  // { type: 'text',
  //   xs: 12,
  //   lg: 2,
  //  label: 'Palabra clave', name: 'keyWord' },
  {
    type: 'select',
    label: 'Ciudad',
    name: 'city', 
      xs: 2,
      lg: 2,
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
      xs: 2,
      lg: 2,
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
      xs: 2 ,
      lg: 2,
    aux: [
      { label: 'text', value: 'test' },
      { label: 'text', value: 'test' },
      { label: 'text', value: 'test' }
    ]
  }
]