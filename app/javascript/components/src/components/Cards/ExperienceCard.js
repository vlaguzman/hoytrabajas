import React, { Fragment } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import Card from '@material-ui/core/Card'
import CardActions from '@material-ui/core/CardActions'
import CardContent from '@material-ui/core/CardContent'
import Button from '@material-ui/core/Button'
import Typography from '@material-ui/core/Typography'
import Divider from '@material-ui/core/Divider'
import Chip from '@material-ui/core/Chip'
import { format } from 'date-fns'

const ExperienceCard = ({ content, formSection, style }) => {
  const {
    company,
    position,
    jobCategory,
    responsabilities,
    startedAt = new Date(),
    finishedAt = new Date(),
    stillInProgress
  } = content

  let startDate, endDate

  if (startedAt && startedAt.constructor === Date)
    startDate = format(startedAt, 'MMMM yyyy')
  if (finishedAt && finishedAt.constructor === Date)
    endDate = format(finishedAt, 'MMMM yyyy')

  return (
    <Row className="justify-content-center">
      <Card {...{ style }}>
        <CardContent>
          <Typography variant="h6" className="fw-bold mb-0" gutterBottom>
            {company || 'Compañía'}
          </Typography>
          <Typography variant="body1" className="fw-bold" color="primary">
            {(position && position[0]) || 'Posición'}
          </Typography>
          <Divider variant="middle" className="mx-0 my-5" />
          <Typography color="textSecondary">
            {startDate && startDate} —{' '}
            {stillInProgress ? 'Actualidad' : endDate && endDate}
          </Typography>
          {responsabilities && responsabilities.length >= 1 && (
            <Fragment>
              <Typography variant="caption" component="p">
                Responsabilidades
              </Typography>
              {responsabilities.map(item => (
                <Chip label={item} key={item} />
              ))}
            </Fragment>
          )}
        </CardContent>
        {jobCategory && (
          <CardActions>
            <Button variant="contained" size="small">
              {jobCategory || 'Categoría'}
            </Button>
          </CardActions>
        )}
      </Card>
    </Row>
  )
}

export default ExperienceCard

ExperienceCard.propTypes = {
  content: PropTypes.object,
  formSection: PropTypes.string.isRequired
}
