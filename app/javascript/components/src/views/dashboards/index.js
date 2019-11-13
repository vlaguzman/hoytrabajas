import React from 'react'
import PropTypes from 'prop-types'
import Presentation from './sections/presentation'
import First from './sections/first'
import Second from './sections/second'
// TODO oscar Temporaly disable while w create the funcionality
// import Third from './sections/third'
// import Fourth from './sections/fourth'

const DashBoardClientes = props => {
  const { translations, dashboard_main_data, applied_offers } = props

  return (
    <>
      <Presentation {...translations} />
      <First {...dashboard_main_data} />
      <Second applied_offers={applied_offers} />
      {/* <Third /> */}
      {/* <Fourth /> */}
      {/* <Typography className="my-25 fw-bold" variant="h5">
        Estás ofertas podrían interesarte
      </Typography> */}
    </>
  )
}

DashBoardClientes.propTypes = {
  translations: PropTypes.object,
  dashboard_main_data: PropTypes.object,
  applied_offers: PropTypes.object
}

export default DashBoardClientes
