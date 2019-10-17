import React     from 'react'
import AppLayout from '../../../../../src/components/Layout/AppLayout'

export default class Show extends React.Component {
  constructor(props) {
    super(props)
    this.props = props
  }

  render() {
    const {
      users_wizards_step_one_path,
      t
    } = this.props

    console.log(t)

    return (
      <div className="main-wrapper">
        <AppLayout>
          <div className='background'>
            <div className='container-general'>
              <div className='container-specific background'></div>
              <div className='container-specific'>
                <h1>{t.title}</h1>
                <p>{t.description}</p>
                <a href={users_wizards_step_one_path}>{t.button_action}</a>
              </div>
            </div>
          </div>
        </AppLayout>
      </div>
    )
  }
}

