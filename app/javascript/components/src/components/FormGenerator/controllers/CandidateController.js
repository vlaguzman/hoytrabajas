import React, { useState, useEffect, useContext } from 'react'
import { Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import DefaultContainer from 'Components/FormGenerator/containers/DefaultContainer'
import UncontrolledContainer from 'Components/FormGenerator/containers/UncontrolledContainer'
import MultiFormContainer from 'Components/FormGenerator/containers/MultiFormContainer'

const Title = ({ name, className, title, ...props }) => (
  <Typography
    variant="body1"
    className="position-absolute text-wrap animated fadeIn"
    style={{
      top: '-10px',
      left: '10px',
      marginTop: '20px',
      position: 'relative'
    }}
  >
    {title}
  </Typography>
)

const CandidateController = ({
  formObj,
  formSection,
  formName,
  dispatch,
  scrollAction
}) => {
  const sectionsWithMultipleForms = ['experiences', 'education', 'diplomas']
  const hasMultipleForms = sectionsWithMultipleForms.includes(formSection)

  return formObj.map(item => {
    const {
      kind,
      pro,
      className,
      title,
      aux,
      extra,
      ownSection = null,
      ...props
    } = item
    const { name } = pro
    if (hasMultipleForms) {
      return (
        <>
          {title && <Title {...props} {...{ name, className, title }} />}
          <MultiFormContainer
            key={name}
            {...{
              formName,
              formSection: ownSection || formSection,
              dispatch,
              kind,
              pro,
              extra
            }}
          />
        </>
      )
    }

    if (formSection === 'skills') {
      return (
        <Col key={name} className={className} {...props}>
          {title && <Title {...props} {...{ name, className, title }} />}
          <UncontrolledContainer
            {...{
              formSection: ownSection || formSection,
              formName,
              dispatch,
              item,
              name
            }}
          />
        </Col>
      )
    }

    return (
      <Col key={name} className={className} {...props}>
        {title && <Title {...props} {...{ name, className, title }} />}
        <DefaultContainer
          {...{
            formSection: ownSection || formSection,
            formName,
            dispatch,
            scrollAction,
            item,
            name
          }}
        />
      </Col>
    )
  })
}

export default CandidateController
