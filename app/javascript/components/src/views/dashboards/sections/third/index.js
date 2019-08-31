import React, {Fragment} from 'react'
import {Row, Col} from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import Button from '@material-ui/core/Button'
import IconButton from '@material-ui/core/IconButton'
import Card from '@material-ui/core/Card'
import CardHeader from '@material-ui/core/CardHeader'
import CardContent from '@material-ui/core/CardContent'
import CardActions from '@material-ui/core/CardActions'
import Table from '@material-ui/core/Table'
import TableBody from '@material-ui/core/TableBody'
import TableCell from '@material-ui/core/TableCell'
import TableHead from '@material-ui/core/TableHead'
import TableRow from '@material-ui/core/TableRow'
import RemoveCircleOutline from '@material-ui/icons/RemoveCircleOutline'
import TouchApp from '@material-ui/icons/TouchApp'
import FavoriteBorder from '@material-ui/icons/FavoriteBorder'

const rows2 = [
  {
    Oferta: 'Community manager proactivo',
    Aplicaciones: '10',
    Afinidad: '64%',
    Inicio: '5/5/2019',
    Cierre: '20/5/2019',
    Estado: true
  },
  {
    Oferta: 'Community manager proactivo',
    Aplicaciones: '10',
    Afinidad: '64%',
    Inicio: '5/5/2019',
    Cierre: '20/5/2019',
    Estado: true
  },
]


const Third = () => {
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
    <Row noGutters className="w-100 justify-content-between my-30 p-10">
    <Col xs={12} className="bg-primary">
      <Card className="p-25">
        <CardHeader
          action={
            <Typography className="mt-20 d-lg-inline d-none" variant="body2">
              Has agregado <span className="text-info">2 ofertas</span> a
              tus favoritos
            </Typography>
          }
          title={theTitle('Mis Favoritos')}
          subheader={
            <Typography className="mb-10 fw-bold d-none d-lg-inline" variant="h5">
              Mis Favoritos
            </Typography>
          }
        />
        <CardContent className='px-0-dash'>
          <div className='container'>
            <Table style={{minWidth: '650'}}>
              <TableHead className="bg-white text-info">
                <TableRow>
                  <TableCell className="text-info" align="left" padding="checkbox" />
                  <TableCell className="text-info" align="center" size='medium' >Oferta</TableCell>
                  <TableCell className="text-info" align="left" size='small'>
                    Aplicaciones
                  </TableCell>
                  <TableCell className="text-info" align="left">
                    Afinidad
                  </TableCell>
                  <TableCell className="text-info" align="left">
                    Aplicar
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
                {rows2.map((row, i) => (
                  <TableRow key={i}>
                    <TableCell align="left" padding="checkbox" >
                      <RemoveCircleOutline />
                    </TableCell>
                    <TableCell align="center" size='medium' >
                      {row.Oferta}
                    </TableCell>
                    <TableCell align="left" size='small'>{row.Aplicaciones}</TableCell>
                    <TableCell align="left">{row.Afinidad}</TableCell>
                    <TableCell align="left">
                      <TouchApp />
                    </TableCell>
                    <TableCell align="left">{row.Inicio}</TableCell>
                    <TableCell align="left">{row.Cierre}</TableCell>
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


export default Third