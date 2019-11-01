import React from 'react'
import Presentation from './sections/presentation'
import First from './sections/first'
import Second from './sections/second'
//TODO oscar Temporaly disable while w create the funcionality
//import Third from './sections/third'
//import Fourth from './sections/fourth'

/* function ListItemLink(props) {


  return <ListItem button component="a" {...props} />
}
 */
const DashBoardClientes = (props) => {
  const { translations, dashboard_main_data, applied_offers } = props

  return (
    <>
      <Presentation {...translations} />
      <First  {...dashboard_main_data} />
      <Second applied_offers={applied_offers} />
      {/* <Third /> */}
      {/* <Fourth /> */}
      {/* <Typography className="my-25 fw-bold" variant="h5">
        Estás ofertas podrían interesarte
      </Typography> */}
    </>
  )
}

export default DashBoardClientes
