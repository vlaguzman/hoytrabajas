import React from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
// import Button from '@material-ui/core/Button'
import IconButton from '@material-ui/core/IconButton'
import Card from '@material-ui/core/Card'
import CardHeader from '@material-ui/core/CardHeader'
import CardContent from '@material-ui/core/CardContent'
import CardActions from '@material-ui/core/CardActions'
import Divider from '@material-ui/core/Divider'
// import List from '@material-ui/core/List'
// import ListItem from '@material-ui/core/ListItem'
// import ListItemText from '@material-ui/core/ListItemText'
// import ListItemSecondaryAction from '@material-ui/core/ListItemSecondaryAction'
// import CircularProgress from '@material-ui/core/CircularProgress'
import FavoriteBorder from '@material-ui/icons/FavoriteBorder'
// import CheckCircle from '@material-ui/icons/CheckCircle'

// TODO oscar uncomment when funcionaly is ready
/* function ListItemLink(props) {
  return <ListItem button component="a" {...props} />
} */

const lastUpdateInDays = last_update => {
  return Math.round((last_update - Date.now()) / (1000 * 60 * 60 * 24))
}

const First = ({
  name,
  last_name,
  telephone,
  email,
  location,
  last_update,
  first_section
}) => {
  const { my_profile, edit_profile, update } = first_section
  const { most_recent_update, today, remaining_days } = update

  last_update = lastUpdateInDays(new Date(last_update))

  const theTitle = text => (
    <>
      <IconButton className="p-0" aria-label="Settings">
        <FavoriteBorder />
      </IconButton>
      <Typography
        className="mb-10 ml-10 fw-bold d-lg-none"
        component="span"
        variant="h6"
      >
        {text}
      </Typography>
    </>
  )
  return (
    <Row noGutters className="w-100 justify-content-between my-30 p-10">
      <Col xs={12} md={6} className="p-5">
        <Card className="px-25 pt-25 pb-5">
          <CardHeader
            action={
              <>
                <span className="position-relative">
                  <Typography
                    className="mb-10 position-absolute"
                    component="span"
                    style={{ top: '-1.3rem', left: '.8rem' }}
                    variant="subtitle1"
                  >
                    {/* 75% */}
                  </Typography>
                </span>
                {/* TODO oscar percentage of profile complete */}
                {/* <CircularProgress variant="static" value={75} size={50} /> */}
              </>
            }
            title={theTitle(my_profile)}
            subheader={
              <Typography
                className="mb-10 fw-bold d-none d-lg-inline"
                variant="h5"
              >
                {my_profile}
              </Typography>
            }
          />
          <CardContent className="px-25 d-none d-lg-block">
            <Typography className="mb-10" variant="h6">
              {name} {last_name}
            </Typography>
            <Typography className="mb-10" variant="body1">
              {telephone}
            </Typography>
            <Typography className="mb-10" variant="body1">
              {email}
            </Typography>
            <Typography className="mb-25" variant="body1">
              {location}
            </Typography>
          </CardContent>
          <CardContent className="py-25 d-lg-none">
            <Typography className="fw-bold text-right mb-0" variant="h6">
              {name}
            </Typography>
            <Typography className="mb-10 text-primary text-right" variant="h6">
              {last_name}
            </Typography>
            <Typography className="mb-0 text-right" variant="body1">
              {telephone}
            </Typography>
            <Typography className="mb-0 text-right" variant="body1">
              {email}
            </Typography>
            <Typography className="mb-25 text-right" variant="body1">
              {location}
            </Typography>
          </CardContent>
          <Divider variant="middle" className="px-0" />
          <CardActions className="">
            <Row className="justify-content-between w-100 mr-0 px-30">
              <Typography variant="caption" component="span">
                {most_recent_update}{' '}
                {last_update >= 1
                  ? `${lastUpdateInDays(last_update)} ${remaining_days}`
                  : today}
              </Typography>
              <Typography
                onClick={() => {
                  window.location.assign('/users/wizards/step_one/edit')
                }}
                variant="caption"
                className="text-info text-right add-pointer"
                component="span"
              >
                <i className="ti-pencil text-info mr-10" />
                {edit_profile}
              </Typography>
            </Row>
          </CardActions>
        </Card>
      </Col>
      {/* TODO oscar notifications realy ? !! */}
      {/* <Col xs={12} md={6} className="p-5">
      <Card className="px-25 pt-25 pb-5">
        <CardHeader
          title={theTitle('Mis Notificaciones')}
          subheader={
            <Typography className="mb-10 fw-bold d-none d-lg-inline" variant="h5">
              Mis Notificaciones
            </Typography>
          }
        />
        <CardContent className='px-0-dash'>
          <List component="nav" aria-label="secondary mailbox folders">
            <ListItemLink button>
              <ListItemText primary="Recibir notificaciones vía mail" />
              <ListItemSecondaryAction>
                <CheckCircle fontSize="small" className="text-info" />
              </ListItemSecondaryAction>
            </ListItemLink>
            <ListItemLink href="#simple-list">
              <ListItemText primary="Recibir notificaciones vía SMS" />
              <ListItemSecondaryAction>
                <CheckCircle fontSize="small" className="text-info" />
              </ListItemSecondaryAction>
            </ListItemLink>
            <ListItemLink href="#simple-list">
              <ListItemText primary="Recibir notificaciones vía intereses" />
              <ListItemSecondaryAction>
                <CheckCircle fontSize="small" className="text-info" />
              </ListItemSecondaryAction>
            </ListItemLink>
          </List>
        </CardContent>
        <Divider variant="middle" className="px-0" />
        <CardActions className="">
          <Row className="justify-content-end w-100 mr-0 px-30">
            <Typography
              variant="caption"
              className="text-info text-right"
              component="span"
            >
              <i className="ti-settings text-info mr-10" />
              Configuración
            </Typography>
          </Row>
        </CardActions>
      </Card>
    </Col> */}
    </Row>
  )
}

First.propTypes = {
  name: PropTypes.string,
  last_name: PropTypes.string,
  telephone: PropTypes.string,
  email: PropTypes.string,
  location: PropTypes.string,
  last_update: PropTypes.string,
  first_section: PropTypes.object
}

export default First
