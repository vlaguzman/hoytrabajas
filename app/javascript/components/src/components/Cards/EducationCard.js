import React, { Fragment } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import Card from '@material-ui/core/Card'
import CardContent from '@material-ui/core/CardContent'
import Typography from '@material-ui/core/Typography'
import Divider from '@material-ui/core/Divider'
import { format } from 'date-fns'

const ExperienceCard = ({ content, formSection, style }) => {
  const {
    title,
    school,
    location,
    startedAt = new Date(),
    finishedAt = new Date(),
    stillInProgress
  } = content

  let startDate
  let endDate


  if (startedAt && startedAt.constructor === Date)
    startDate = format(startedAt, 'MMMM yyyy')
  if (finishedAt && finishedAt.constructor === Date)
    endDate = format(finishedAt, 'MMMM yyyy')

  return (
    <Row className="justify-content-center">
      <Card {...{ style }}>
        <CardContent>
          <Typography variant="h6" className="fw-bold mb-0" gutterBottom>
            {title || 'Compañía'}
          </Typography>
          <Typography variant="body1" className="fw-bold" color="primary">
            {school || 'Posición'}
          </Typography>
          <Typography variant="body2" className="fw-bold">
            {location || 'Posición'}
          </Typography>
          <Divider variant="middle" className="mx-0 my-5" />
          <Typography color="textSecondary">
            {startDate && startDate} —{' '}
            {stillInProgress ? 'En curso' : endDate && endDate}
          </Typography>
        </CardContent>
      </Card>
    </Row>
  )
}

export default ExperienceCard

ExperienceCard.propTypes = {
  content: PropTypes.object,
  formSection: PropTypes.string.isRequired
}
