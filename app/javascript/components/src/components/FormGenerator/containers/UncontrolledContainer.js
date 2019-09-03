import React from 'react'
import { connect } from 'react-redux'
import PropTypes from 'prop-types'
import useWhyDidYouUpdate from '../../../hooks/useWhyDidYouUpdate'
import fieldOptions from '../../../components/FormGenerator/fields/fieldOptions'

const UncontrolledContainer = props => {
  const {
    formSection,
    formName,
    name,
    dispatch,
    item: { kind, pro, className = null }
  } = props

  useWhyDidYouUpdate('UncontrolledContainer-WhyDidYouUpdate', props)

  return fieldOptions[kind]({
    formSection,
    formName,
    dispatch,
    pro,
    name,
    className
  })
}

// export default UncontrolledContainer
export default connect()(UncontrolledContainer)

UncontrolledContainer.propTypes = {
  formName: PropTypes.string.isRequired,
  formSection: PropTypes.string.isRequired,
  dispatch: PropTypes.func.isRequired,
  name: PropTypes.string,
  item: PropTypes.shape({
    kind: PropTypes.string.isRequired,
    pro: PropTypes.object.isRequired
  })
}
