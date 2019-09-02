export default {
    pag: 2,
    next: 3,
    prev: 1,
    title: 'Empecemos por conocernos',
    subtitle: 'Brinda a tu candidato información de tu empresa.',
    formObj: [
      {
    
        kind: 'stInput',
        className: 'my-30 w-50 pr-30',
        pro: {
           className: 'w-100 mt-0 animated fadeIn',
           name:'nombre',
           id: "nombre",
           label: "Título de tu oferta",
         //   defaultValue: "Default Value",
           helperText: "Ejem. Dj para Bar",
           margin: "normal"
        } 
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
            label:"Tu oferta está diriguida a:",
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
        className:'w-50 pr-30',
        pro: {
            className:'w-100 animated fadeIn',
            name:'c',
            id:"standard-select-currency",
            select: true,
            label:"Selecciona la categoría de tu oferta",
            style: {marginTop: '1.9rem'},
            value:'',
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
        kind: 'selectChip',
        className:'w-50 my-30 pr-30',
        pro: {
            className:'w-100 animated fadeIn',
            name:'documento',
            multiple: true,
            value:['Mesero'],
           // onChange={handleChange}
            id:"documento",
            label:"Escribe el cargo que deseas contratar ",
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
            value:['Inmediato'],
           // onChange={handleChange}
            id:"documento",
            label:"Cual es el tiempo para cubrir esta oferta",
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
        kind: 'datePicker',
        className: 'w-50 my-30 pr-30 animated fadeIn',
        pro: {
         className: 'w-100 animated fadeIn',
           name: 'crash',
           id:"mui-pickers-date",
           label:"Vencimiento de la oferta",
           // value:new Date(),
           // value: null,
           onChange:() => {console.log('something')},
        }
     },
  ]
  
  }