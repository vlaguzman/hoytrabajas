import React     from 'react'
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
          <div className='background'>
            <div className='container-general'>
              <div className='container-specific background'></div>
              <div className='container-specific'>
                <h1>El empleado ideal ¡si existe!</h1>
                <p>Y crear <strong>una oferta atractiva</strong> para llegar a el es muy facil <strong>¡vamos a hacerlo!</strong></p>
                <a href={this.props.users_wizards_step_one_path}>Quiero publicar mi oferta</a>
              </div>
            </div>
          </div>
        </AppLayout>
      </div>
    )
  }
}

