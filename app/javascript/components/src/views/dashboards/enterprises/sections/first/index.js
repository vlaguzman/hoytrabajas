import React, {Fragment} from 'react'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import Button from '@material-ui/core/Button'
import IconButton from '@material-ui/core/IconButton'
import Card from '@material-ui/core/Card'
import CardHeader from '@material-ui/core/CardHeader'
import CardContent from '@material-ui/core/CardContent'
import CardActions from '@material-ui/core/CardActions'
import Divider from '@material-ui/core/Divider'
import List from '@material-ui/core/List'
import ListItem from '@material-ui/core/ListItem'
import ListItemText from '@material-ui/core/ListItemText'
import ListItemSecondaryAction from '@material-ui/core/ListItemSecondaryAction'
import CircularProgress from '@material-ui/core/CircularProgress'
import FavoriteBorder from '@material-ui/icons/FavoriteBorder'
import CheckCircle from '@material-ui/icons/CheckCircle'


function ListItemLink(props) {
  return <ListItem button component="a" {...props} />
}

  
const First = () => {
  const theTitle = (texto) => (
    <Fragment>
    <IconButton className="p-0" aria-label="Settings">
      <FavoriteBorder />
    </IconButton>
    </Fragment>
  )
  return (
    <Row noGutters className="w-100 justify-content-between my-30 px-20">
    <Col xs={12} md={6} className="p-5">
      <Card className="px-25 pt-25 pb-5">
        <CardHeader
          action={
            <Fragment>
              <span className="position-relative">
                <Typography
                  className="mb-10 position-absolute"
                  component="span"
                  style={{ top: '-1.3rem', left: '.8rem' }}
                  variant="subtitle1"
                >
                  70%
                </Typography>
              </span>
              <CircularProgress variant="static" value={75} size={50} />
            </Fragment>
          }
          title={theTitle('Mi perfil')}
          subheader={
            <Typography className="mb-10 fw-bold" variant="h5">
              Mi Perfil
            </Typography>
          }
        />
        <CardContent className="px-25 d-none d-lg-block">
          <Typography className="mb-10" variant="h6">
            Verdelogico S.A.S
          </Typography>
          <Typography className="mb-10" variant="body1">
            310 123 456 789
          </Typography>
          <Typography className="mb-10" variant="body1">
            milton@verdelogico.com
          </Typography>
          <Typography className="mb-25" variant="body1">
            Bogotá, Colombia
          </Typography>
        </CardContent>
        <CardContent className="py-25 d-lg-none">
          <Typography className="fw-bold text-right mb-0" variant="h6">
            Verdelogico S.A.S
          </Typography>
          <Typography className="mb-0 text-right" variant="body1">
            310 123 456 789
          </Typography>
          <Typography className="mb-0 text-right" variant="body1">
            milton@verdelogico.com
          </Typography>
          <Typography className="mb-25 text-right" variant="body1">
            Bogotá, Colombia
          </Typography>
        </CardContent>
        <Divider variant="middle" className="px-0" />
        <CardActions className="">
          <Row className="justify-content-between w-100 mr-0 px-30">
            <Typography variant="caption" component="span">
              Ultima actualización: Hace 25 días
            </Typography>
            <Typography
              variant="caption"
              className="text-info text-right"
              component="span"
            >
              <i className="ti-pencil text-info mr-10" />
              Editar
            </Typography>
          </Row>
        </CardActions>
      </Card>
    </Col>
    <Col xs={12} md={6} className="p-5">
      <Card className="px-25 pt-25 pb-5">
        <CardHeader
          title={theTitle('Mis Notificaciones')}
          subheader={
            <Typography className="mb-10 fw-bold" variant="h5">
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
    </Col>
  </Row>
  )
}

export default First


