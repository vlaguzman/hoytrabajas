import React from 'react'
import PropTypes from 'prop-types'
import Presentation from './sections/presentation'
import Second from './sections/second'

const DashEnterprises = props => {
  const { my_offers, component_translations, edit_offer_path } = props

  const { my_offers_section } = component_translations

  return (
    <>
      <Presentation />
      <Second
        my_offers={my_offers}
        my_offers_section={my_offers_section}
        edit_offer_path={edit_offer_path}
      />
    </>
  )
}

export default DashEnterprises

DashEnterprises.propTypes = {
  my_offers: PropTypes.array.isRequired,
  edit_offer_path: PropTypes.string.isRequired,
  component_translations: PropTypes.object.isRequired
}
