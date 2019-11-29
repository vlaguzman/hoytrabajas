import React from 'react'
import PropTypes from 'prop-types'
import Presentation from './sections/presentation'
// import First from './sections/first'
import Second from './sections/second'
// import Third from './sections/third'

const DashEnterprises = props => {
  const { my_offers } = props

  return (
    <>
      <Presentation />
      <Second my_offers={my_offers} />
      {
        // TODO: add this when dashboards be implemented
        /* <First />
      <Second />
      <Third /> */
      }
    </>
  )
}

export default DashEnterprises

DashEnterprises.propTypes = {
  my_offers: PropTypes.array.isRequired
}
