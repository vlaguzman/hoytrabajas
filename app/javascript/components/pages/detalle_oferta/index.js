import React from 'react'
import PropTypes from 'prop-types'
import { DynamicDetalle } from '../../src/views/DynamicViews'
import AppLayout from '../../src/components/Layout/AppLayout'

const MainPage = props => {
  const { csrf_param, csrf_token } = props

  return (
    <AppLayout>
      <DynamicDetalle
        csrf_param={csrf_param}
        csrf_token={csrf_token}
        {...props}
      />
    </AppLayout>
  )
}

export default MainPage

MainPage.propTypes = {
  csrf_param: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired
}
