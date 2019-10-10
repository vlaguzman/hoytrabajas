import React from 'react'
import { Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import DefaultContainer from '../containers/DefaultContainer'
import UncontrolledContainer from '../containers/UncontrolledContainer'

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
  fields,
  scrollAction
}) =>
  fields.map(item => {
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
            scrollAction,
            item,
            name
          }}
        />
      </Col>
    )
  })

export default OffersController
