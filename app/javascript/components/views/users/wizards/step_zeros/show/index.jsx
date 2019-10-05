import React from 'react'
import AppLayout from '../../../../../src/components/Layout/AppLayout'

export default class Show extends React.Component {
  render() {
    return (
      <div className="main-wrapper">
        <AppLayout>
          <h1>El trabajo ideal</h1>
          <h1>¡si existe!</h1>
          <a href="#">Quiero públicar mi oferta</a>
        </AppLayout>
      </div>
    )
  }
}

