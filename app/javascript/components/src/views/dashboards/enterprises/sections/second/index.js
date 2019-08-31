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
import Table from '@material-ui/core/Table'
import TableBody from '@material-ui/core/TableBody'
import TableCell from '@material-ui/core/TableCell'
import TableHead from '@material-ui/core/TableHead'
import TableRow from '@material-ui/core/TableRow'
import Switch from '@material-ui/core/Switch'
import FavoriteBorder from '@material-ui/icons/FavoriteBorder'
import CheckCircle from '@material-ui/icons/CheckCircle'
import RemoveCircleOutline from '@material-ui/icons/RemoveCircleOutline'
import ChatBubbleOutline from '@material-ui/icons/ChatBubbleOutline'



const rows = [
  {
    oferta: 'Community manager proactivo',
    pausa: true,
    candidatos: '10',
    entrevistas: '1',
    inicio: '5/5/2019',
    cierre: '20/5/2019',
    estado: false
  }
]

const Second = () => {
  const theTitle = (texto) => (
    <Fragment>
    <IconButton className="p-0" aria-label="Settings">
      <FavoriteBorder />
    </IconButton>
    <Typography className="mb-10 ml-10 fw-bold d-lg-none" component='span' variant="h6">
                {texto}
    </Typography>
    </Fragment>
  )
  return (
    <Row noGutters className="w-100 justify-content-between my-30 px-20">
    <Col xs={12} className="bg-primary">
      <Card className="p-25">
        <CardHeader
          title={theTitle('Mis ofertas')}
          subheader={
            <Typography className="mb-10 fw-bold d-none d-lg-inline" variant="h5">
              Mis ofertas
            </Typography>
          }
        />
        <CardContent className='px-0-dash'>
          <Row noGutters className='justify-content-center d-lg-none '>
          </Row>
          <div className="container">
          <Table style={{minWidth: '650'}}>
          <TableHead className="bg-white">
            <TableRow>
              <TableCell className="text-info" align="left" padding="checkbox" ></TableCell>
              <TableCell className="text-info" size='medium' align="center">Oferta</TableCell>
              <TableCell className="text-info" align="left" size='small' >
                Pausa
              </TableCell>
              <TableCell className="text-info" align="center" size='small' >
                Candidatos
              </TableCell>
              <TableCell className="text-info" align="center" size='small' >
                Entrevistas
              </TableCell>
              <TableCell className="text-info" align="left">
                Inicio
              </TableCell>
              <TableCell className="text-info" align="left">
                Cierre
              </TableCell>
              <TableCell className="text-info" align="left">
                Estado
              </TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {rows.map((row, i) => (
              <TableRow key={i}>
                <TableCell align="right" padding="checkbox">
                  <i className="ti-pencil-alt"></i>
                </TableCell>
                <TableCell align="center" size='medium'>
                  {row.oferta}
                </TableCell>
                <TableCell align="left" size='small' >
                  <Switch
                    checked={row.pausa}
                    value="checkedA"
                    inputProps={{ 'aria-label': 'secondary checkbox' }}
                  />
                </TableCell>
                <TableCell align="center" size='small'>{row.candidatos}</TableCell>
                <TableCell align="center" size='small'>{row.entrevistas}</TableCell>
                <TableCell align="left">{row.inicio}</TableCell>
                <TableCell align="left">{row.cierre}</TableCell>
                <TableCell align="left">
                  {row.estado ? 'Abierto' : 'Cerrado'}
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
          </div>
        </CardContent>
      </Card>
    </Col>
  </Row>
  )
}

export default Second