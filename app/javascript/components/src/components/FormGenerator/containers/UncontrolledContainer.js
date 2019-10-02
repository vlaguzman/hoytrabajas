import React from 'react'
import PropTypes from 'prop-types'
import fieldOptions from "../fields/fieldOptions"

const UncontrolledContainer = props => {
  const {
    formSection,
    formName,
    name,
    item: { kind, pro, className = null }
  } = props

  return fieldOptions[kind]({
    formSection,
    formName,
    dispatch,
    pro,
    name,
    className
  })
}

export default UncontrolledContainer

UncontrolledContainer.propTypes = {
  formName: PropTypes.string.isRequired,
  formSection: PropTypes.string.isRequired,
  name: PropTypes.string,
  item: PropTypes.shape({
    kind: PropTypes.string.isRequired,
    pro: PropTypes.object.isRequired
  })
}
