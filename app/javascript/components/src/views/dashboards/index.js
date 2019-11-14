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
  const { presentation_section, first_section, second_section } = translations

  return (
    <>
      <Presentation {...presentation_section} />
      <First {...dashboard_main_data} first_section={first_section} />
      <Second applied_offers={applied_offers} second_section={second_section} />
      {/* <Third /> */}
      {/* <Fourth /> */}
      {/* <Typography className="my-25 fw-bold" variant="h5">
        Estás ofertas podrían interesarte
      </Typography> */}
    </>
  )
}

DashBoardClientes.propTypes = {
  translations: PropTypes.shape({
    presentation_section: PropTypes.object,
    first_section: PropTypes.object,
    second_section: PropTypes.object
  }),
  dashboard_main_data: PropTypes.object,
  applied_offers: PropTypes.object
}

export default DashBoardClientes
