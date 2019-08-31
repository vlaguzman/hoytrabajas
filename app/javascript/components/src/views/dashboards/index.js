import React, { Fragment } from 'react'
import Presentation from './sections/presentation'
import First from './sections/first'
import Second from './sections/second'
import Third from './sections/third'
import Fourth from './sections/fourth'

function ListItemLink(props) {
  return <ListItem button component="a" {...props} />
}

const DashBoardClientes = () => {
  return (
    <Fragment>
      <Presentation />
      <First />
      <Second />
      <Third />
      <Fourth />
      {/* <Typography className="my-25 fw-bold" variant="h5">
        Estás ofertas podrían interesarte
      </Typography> */}
    </Fragment>
  )
}

export default DashBoardClientes
