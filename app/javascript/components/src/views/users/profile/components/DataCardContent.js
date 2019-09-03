import React from 'react'
import PropTypes from 'prop-types'
import { connect } from 'react-redux'
import Typography from '@material-ui/core/Typography'
import { Row, Col } from 'reactstrap'
import { makeGetDisplayFields } from '../../../../selectors/forms'
import useWhyDidYouUpdate from '../../../../hooks/useWhyDidYouUpdate'

const BasicInfoDisplay = ({ currentDataContent }) => {
  const ignoreFields = ['name', 'last_name']
  return (
    <>
      <Typography variant="h6" component="p" className="fw-bold">
        {currentDataContent['name'] && (
          <span className="text-primary">{currentDataContent['name']}</span>
        )}
        {currentDataContent['last_name'] &&
          ` ${currentDataContent['last_name']}`}
      </Typography>
      {Object.keys(currentDataContent).map(key => {
        if (ignoreFields.includes(key)) return null
        return (
          <Typography
            key={key}
            variant="body1"
            component="p"
            className="text-muted"
          >
            {currentDataContent[key]}
          </Typography>
        )
      })}
    </>
  )
}

const renderOptions = {
  basic_info: currentDataContent => (
    <BasicInfoDisplay {...{ currentDataContent }} />
  )
}

const DataCardContent = props => {
  const { currentDataContent, dataSection } = props
  console.log('DataCardContent props')
  console.log(props)
  useWhyDidYouUpdate('dataCardContent', props)

  if (!currentDataContent) return null
  return (
    <Col className="py-25 px-0 pb-30">
      {renderOptions[dataSection](currentDataContent)}
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
export default connect(makeMapStateToProps)(DataCardContent)
