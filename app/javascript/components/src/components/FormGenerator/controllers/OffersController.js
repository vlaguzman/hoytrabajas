import React from 'react'
import { Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import DefaultContainer from '../../../components/FormGenerator/containers/DefaultContainer'
import UncontrolledContainer from '../../../components/FormGenerator/containers/UncontrolledContainer'

const Title = ({ title }) => (
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

const OffersController = ({
  formObj,
  formSection,
  formName,
  dispatch,
  scrollAction
}) =>
  formObj.map(item => {
    const {
      kind,
      pro,
      className,
      title,
      aux,
      extra,
      ownSection,
      ...props
    } = item
    const { name } = pro

    if (kind.toLowerCase() === 'formrow') {
      return (
        <Col key={name} className={className} {...props}>
          <UncontrolledContainer
            {...{
              formSection: ownSection || formSection,
              formName,
              dispatch,
              pro,
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

export default OffersController
