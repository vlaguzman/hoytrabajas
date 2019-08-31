export default {
    pag: 5,
    next: 6,
    prev: 4,
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
           label: "Describe las responsabilidades o funciones del candidato",
         //   defaultValue: "Default Value",
        //    helperText: "Some important text",
           margin: "normal"
        } 
    }
  ]
  
  }
