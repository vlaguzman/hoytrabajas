export default {
    pag: 1,
    next: 2,
    prev: 0,
    title: 'Empecemos por conocernos',
    subtitle: 'Brinda a tu candidato información de tu empresa.',
    formObj: [
    {
      
        kind: 'stInput',
        className: 'my-30 w-100 pr-30',
        pro: {
           multiline: true,
           fullWidth: true, 
           className: 'w-100 animated fadeIn',
           name:'aboutYou',
           id: "aboutYou",
           label: "Hablanos un poco de tu empresa",
         //   defaultValue: "Default Value",
        //    helperText: "Some important text",
           margin: "normal"
        } 
    }
  ]
  
  }