export default {
    pag: 3,
    next: 4,
    prev: 2,
    title: 'Empecemos por conocernos',
    subtitle: 'Brinda a tu candidato información de tu empresa.',
    formObj: [
      {    
        kind: 'selectChip',
        className:'w-50 my-30 pr-30',
        pro: {
            className:'w-100 animated fadeIn',
            name:'documento',
            multiple: true,
            value:[],
           // onChange={handleChange}
            id:"documento",
            label:"Tipo de oferta",
           //  style: {marginTop: '0.5rem'},
        },
        aux: [
         {
           value: 'USD',
           label: 'algo',
         },
         {
           value: 'EUR',
           label: 'mas',
         },
         {
           value: 'BTC',
           label: 'otro',
         },
         {
           value: 'JPY',
           label: 'hollow',
         },
       ]
      },
      {    
        kind: 'selectChip',
        className:'w-50 my-30 pr-30',
        pro: {
            className:'w-100 animated fadeIn',
            name:'documento',
            multiple: true,
            value:[],
           // onChange={handleChange}
            id:"documento",
            label:"Tipo de contratación",
           //  style: {marginTop: '0.5rem'},
        },
        aux: [
         {
           value: 'USD',
           label: 'algo',
         },
         {
           value: 'EUR',
           label: 'mas',
         },
         {
           value: 'BTC',
           label: 'otro',
         },
         {
           value: 'JPY',
           label: 'hollow',
         },
       ]
      },
      {    
        kind: 'selectChip',
        className:'w-25 my-30 pr-30',
        pro: {
            className:'w-100 animated fadeIn',
            name:'documento',
            multiple: true,
            value:[],
           // onChange={handleChange}
            id:"documento",
            label:"Pago",
           //  style: {marginTop: '0.5rem'},
        },
        aux: [
         {
           value: 'USD',
           label: 'algo',
         },
         {
           value: 'EUR',
           label: 'mas',
         },
         {
           value: 'BTC',
           label: 'otro',
         },
         {
           value: 'JPY',
           label: 'hollow',
         },
       ]
      },
      {    
        kind: 'selectChip',
        className:'w-25 my-30 pr-30',
        pro: {
            className:'w-100 animated fadeIn',
            name:'documento',
            multiple: true,
            value:[],
           // onChange={handleChange}
            id:"documento",
            label:"Monto salario",
           //  style: {marginTop: '0.5rem'},
        },
        aux: [
         {
           value: 'USD',
           label: 'algo',
         },
         {
           value: 'EUR',
           label: 'mas',
         },
         {
           value: 'BTC',
           label: 'otro',
         },
         {
           value: 'JPY',
           label: 'hollow',
         },
       ]
      },
      {
        kind: 'select',
        // title: 'Define tu aspiración salarial',
        className:'w-5 mr-15',
        pro: {
            className:'w-100 animated fadeIn',
            name:'c',
            id:"standard-select-currency",
            select: true,
            label:"",
            style: {marginTop: '2.9rem'},
            value:'EUR',
            // onChange:{handleChange('currency')},
            SelectProps:{MenuProps: {},},
            // helperText:"Please select your currency",
            margin:"normal"
        },
        aux: [
         {
           value: 'USD',
           label: '$',
         },
         {
           value: 'EUR',
           label: '€',
         },
         {
           value: 'BTC',
           label: '฿',
         },
         {
           value: 'JPY',
           label: '¥',
         },
       ]
      },
      {
          kind: 'stInput',
          title: 'Define tu aspiración salarial',
          className: 'my-30 w-20 pr-20  position-relative',
          pro: {
             className: 'w-100 animated fadeIn',
             name:'nombre',
             id: "nombre",
             label: "",
             placeholder: 'min',
            //  defaultValue: "Default Value",
          //    helperText: "Some important text",
             margin: "normal"
          } 
        },
      {
          kind: 'stInput',
          className: 'my-30 w-20',
          pro: {
             className: 'w-100 animated fadeIn',
             name:'nombre',
             id: "nombre",
             label: "",
             placeholder: 'max',
            //  defaultValue: "Default Value",
          //    helperText: "Some important text",
             margin: "normal"
          } 
        },
  ]
  
  }