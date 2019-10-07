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
          <h1>El trabajo ideal</h1>
          <h1>¡si existe!</h1>
          <a href={this.props.users_wizards_step_one_path}>Quiero publicar mi oferta</a>
        </AppLayout>
      </div>
    )
  }
}

