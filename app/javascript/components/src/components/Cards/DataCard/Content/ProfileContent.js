import React from 'react'
import PropTypes from 'prop-types'
import { connect } from 'react-redux'
import { Col } from 'reactstrap'
import { makeGetDisplayFields } from 'selectors/forms'
import useWhyDidYouUpdate from 'hooks/useWhyDidYouUpdate'
import ProfileBasicInfo from './styles/ProfileBasicInfo'

const renderOptions = {
  basic_info: ({ currentDataContent }) => (
    <ProfileBasicInfo {...{ currentDataContent }} />
  )
}

const ProfileContent = props => {
  const { currentDataContent, dataSection } = props
  console.log('ProfileContent props')
  console.log(props)
  useWhyDidYouUpdate('ProfileContent', props)

  if (!currentDataContent) return null
  return (
    <Col className="py-25 px-0 pb-30">
      {renderOptions[dataSection]({ currentDataContent })}
    </Col>
  )
}

const makeMapStateToProps = () => {
  const getDisplayFields = makeGetDisplayFields()
  const mapStateToProps = (state, props) => ({
    currentDataContent: getDisplayFields(state, props)
  })
  return mapStateToProps
}
export default connect(makeMapStateToProps)(ProfileContent)
