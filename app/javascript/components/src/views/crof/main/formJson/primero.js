    export default {
        pag: 0,
        next: 1,
        prev: null,
        title: 'Empecemos por conocernos',
        subtitle: 'Brinda a tu candidato información de tu empresa.',
        formObj: [
        {
            kind: 'stInput',
            className: 'my-30 col-12 col-md-6 pr-30',
            pro: {
               className: 'w-100 animated fadeIn',
               name:'nombre',
               id: "nombre",
               label: "Nombre empresa o Razón social",
             //   defaultValue: "Default Value",
            //    helperText: "Some important text",
               margin: "normal"
            } 
          },
        {
            kind: 'stInput',
            className: 'my-30 col-12 col-md-6',
            pro: {
               className: 'w-100 animated fadeIn',
               name:'apellido',
               id: "apellido",
               label: "Sector al que pertenece tu empresa",
             //   defaultValue: "Default Value",
            //    helperText: "Some important text",
               margin: "normal"
            } 
          },
          {
          
            kind: 'stInput',
            className: 'my-30 col-12 col-md-6 pr-30',
            pro: {
               className: 'w-100 animated fadeIn mt-0',
               name:'nombre',
               id: "nombre",
               label: "Persona de contacto",
             //   defaultValue: "Default Value",
            //    helperText: "Some important text",
               margin: "normal"
            } 
          },
          {
          
            kind: 'select',
            className:'col-4 col-md-1',
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
            className: ' my-30 col-8 col-md-5',
            pro: {
               className: 'w-100 my-0 animated fadeIn',
               name:'d',
               id: "st",
               label: "Telefono de cóntacto*",
             //   defaultValue: "Default Value",
            //    helperText: "numero de telefono",
               margin: "normal"
            } 
          },   
        {
          kind: 'stInput',
          className: 'my-10 col-12 col-md-6 pr-30',
          pro: {
             className: 'w-100 my-0 animated fadeIn',
             name:'nacionalidad',
             id: "nacionalidad",
             label: "Sitio web",
           //   defaultValue: "Default Value",
          //    helperText: "Some important text",
             margin: "normal"
          } 
        },
        {
            kind: 'drag_drop',
            className: 'my-20 my-20 col-12 col-md-6 animated fadeIn animated fadeIn'
        }
      ]
      
      }