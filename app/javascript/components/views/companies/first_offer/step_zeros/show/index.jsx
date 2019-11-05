import React from 'react'
import PropTypes from 'prop-types'

export default class Show extends React.Component {
  constructor(props) {
    super(props)
    this.props = props
  }

  render() {
    const { path, step_zero_translation } = this.props

    return (
      <div className="main-wrapper">
        <div className="background">
          <div className="container-general">
            <div className="container-specific background" />
            <div className="container-specific">
              <h1>{step_zero_translation.title}</h1>
              <p>{step_zero_translation.description}</p>
              <a href={path}>{step_zero_translation.button_action}</a>
            </div>
          </div>
        </div>
      </div>
    )
  }
}

Show.propTypes = {
  path: PropTypes.string.isRequired,
  step_zero_translation: PropTypes.object.isRequired
}
