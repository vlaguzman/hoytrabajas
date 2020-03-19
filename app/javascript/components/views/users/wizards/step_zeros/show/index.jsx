import React from 'react'
import PropTypes from 'prop-types'

export default class Show extends React.Component {
  constructor(props) {
    super(props)
    this.props = props
  }

  render() {
    const {
      users_wizards_step_zeros_curriculum_vitae_path,
      log_out_companies,
      company_signed_in,
      user_signed_in,
      log_out_user,
      csrf_param,
      csrf_token,
      step_zero_translation,
      session_translation
    } = this.props

    return (
      <div className="main-wrapper">

          <div className="background">
            <div className="container-general">
              <div className="container-specific background" />
              <div className="container-specific">
                <h1>{step_zero_translation.title}</h1>
                <p>{step_zero_translation.description}</p>
                <a href={users_wizards_step_zeros_curriculum_vitae_path}>
                  {step_zero_translation.button_action}
                </a>
              </div>
            </div>
          </div>
      </div>
    )
  }
}

Show.propTypes = {
  users_wizards_step_zeros_curriculum_vitae_path: PropTypes.string.isRequired,
  log_out_companies: PropTypes.string.isRequired,
  company_signed_in: PropTypes.bool.isRequired,
  user_signed_in: PropTypes.bool.isRequired,
  log_out_user: PropTypes.string.isRequired,
  csrf_param: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired,
  step_zero_translation: PropTypes.object.isRequired,
  session_translation: PropTypes.object.isRequired
}
