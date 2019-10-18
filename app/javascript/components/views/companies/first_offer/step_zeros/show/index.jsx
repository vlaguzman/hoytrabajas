import React     from 'react'
import AppLayout from '../../../../../src/components/Layout/AppLayout'

export default class Show extends React.Component {
  constructor(props) {
    super(props)
    this.props = props
  }

  render() {
    const {
      log_out_companies,
      company_signed_in,
      user_signed_in,
      log_out_user,
      csrf_param,
      csrf_token,
      path,
      t
    } = this.props

    return (
      <div className="main-wrapper">
        <AppLayout
          log_out_companies={log_out_companies}
          company_signed_in={company_signed_in}
          user_signed_in={user_signed_in}
          log_out_user={log_out_user}
          csrf_param={csrf_param}
          csrf_token={csrf_token}
        >
          <div className='background'>
            <div className='container-general'>
              <div className='container-specific background'></div>
              <div className='container-specific'>
                <h1>{t.title}</h1>
                <p>{t.description}</p>
                <a href={path}>{t.button_action}</a>
              </div>
            </div>
          </div>
        </AppLayout>
      </div>
    )
  }
}

