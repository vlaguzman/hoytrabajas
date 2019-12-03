import React from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import uuidv4 from 'uuid/v4'
// import Button from '@material-ui/core/Button'
import IconButton from '@material-ui/core/IconButton'
import Card from '@material-ui/core/Card'
import CardHeader from '@material-ui/core/CardHeader'
import CardContent from '@material-ui/core/CardContent'
// import CardActions from '@material-ui/core/CardActions'
// import Divider from '@material-ui/core/Divider'
import Table from '@material-ui/core/Table'
import TableBody from '@material-ui/core/TableBody'
import TableCell from '@material-ui/core/TableCell'
import TableHead from '@material-ui/core/TableHead'
import TableRow from '@material-ui/core/TableRow'
// import Switch from '@material-ui/core/Switch'
import FavoriteBorder from '@material-ui/icons/FavoriteBorder'
// import CheckCircle from '@material-ui/icons/CheckCircle'
// import RemoveCircleOutline from '@material-ui/icons/RemoveCircleOutline'
// import ChatBubbleOutline from '@material-ui/icons/ChatBubbleOutline'
import EditIcon from '@material-ui/icons/Edit'

const Second = ({ my_offers, my_offers_section }) => {
  const theTitle = texto => (
    <>
      <IconButton className="p-0" aria-label="Settings">
        <FavoriteBorder />
      </IconButton>
      <Typography
        className="mb-10 ml-10 fw-bold d-lg-none"
        component="span"
        variant="h6"
      >
        {texto}
      </Typography>
    </>
  )
  return (
    <Row noGutters className="w-100 justify-content-between my-30 px-20">
      <Col xs={12} className="bg-primary">
        <Card className="p-25">
          <CardHeader
            title={theTitle(my_offers_section['the_title'])}
            subheader={
              <Typography
                className="mb-10 fw-bold d-none d-lg-inline"
                variant="h5"
              >
                Mis ofertas
              </Typography>
            }
          />
          <CardContent className="px-0-dash">
            {/* <Row noGutters className='justify-content-center d-lg-none '>
          </Row> */}
            <div>
              {/* style={{minWidth: '650'}} */}
              <Table>
                <TableHead className="bg-white">
                  <TableRow>
                    <TableCell
                      className="text-info"
                      align="left"
                      padding="checkbox"
                    />
                    <TableCell
                      className="text-info"
                      size="medium"
                      align="center"
                    >
                      {my_offers_section['the_title']}
                    </TableCell>
                    <TableCell className="text-info" align="left" size="small">
                      {my_offers_section['approved']}
                    </TableCell>
                    <TableCell
                      className="text-info"
                      align="center"
                      size="small"
                    >
                      {my_offers_section['candidates']}
                    </TableCell>
                    {/* TODO OScar add this column when the company could entreview the candidates */}
                    {/* <TableCell className="text-info" align="center" size='small' >
                Entrevistas
              </TableCell> */}
                    <TableCell className="text-info" align="left">
                      {my_offers_section['started_at']}
                    </TableCell>
                    <TableCell className="text-info" align="left">
                      {my_offers_section['closed_at']}
                    </TableCell>
                    <TableCell className="text-info" align="left">
                      {my_offers_section['status']}
                    </TableCell>
                  </TableRow>
                </TableHead>
                <TableBody>
                  {my_offers.map(row => (
                    <TableRow key={uuidv4()}>
                      <TableCell align="right" padding="checkbox">
                        <IconButton
                          href={`/companies/first_offer/step_three?offer_id=${row.id}`}
                          className="p-0"
                          // aria-label="Settings"
                        >
                          <EditIcon />
                        </IconButton>
                      </TableCell>
                      <TableCell align="center" size="medium">
                        <a href={`/offers/${row.id}`}>{row.title}</a>
                      </TableCell>
                      <TableCell align="left" size="small">
                        {row.approved
                          ? my_offers_section.approved_list.approved
                          : my_offers_section.approved_list.not_approved}
                        {/* <Switch
                    checked={row.approved}
                    value="checkedA"
                    inputProps={{ 'aria-label': 'secondary checkbox' }}
                  /> */}
                      </TableCell>
                      <TableCell align="center" size="small">
                        {row.applied_candidates}
                      </TableCell>
                      {/* TODO Oscar add this column when the company could entreview the candidates */}
                      {/* <TableCell align="center" size='small'>{row.entrevistas}</TableCell> */}
                      <TableCell align="left">{row.start_date}</TableCell>
                      <TableCell align="left">{row.close_date}</TableCell>
                      <TableCell align="left">
                        {my_offers_section.status_lists[`${row.status}`]}
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

Second.propTypes = {
  my_offers: PropTypes.array.isRequired,
  my_offers_section: PropTypes.object.isRequired
}
