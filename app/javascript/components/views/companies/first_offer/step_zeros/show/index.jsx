import React from 'react'
import AppLayout from '../../../../../src/components/Layout/AppLayout'

export default class Show extends React.Component {
  constructor(props) {
    super(props)
    this.props = props
  }
  render() {
    return (
      <div className="main-wrapper">
        <AppLayout>
          <h1>El empleado ideal</h1>
          <h1>¡si existe!</h1>
          <p>Y crear una oferta atractiva para llegar</p>
          <p>a el es muy fácil ¡Vamos a hacerlo!</p>

          <a href={this.props.path}> Quiero publicar mi oferta </a>
        </AppLayout>
      </div>
    )
  }
}

