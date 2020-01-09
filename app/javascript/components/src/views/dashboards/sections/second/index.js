import React from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
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
import Chip from '@material-ui/core/Chip'
import FavoriteBorder from '@material-ui/icons/FavoriteBorder'
// import CheckCircle from '@material-ui/icons/CheckCircle'
import RemoveCircleOutline from '@material-ui/icons/RemoveCircleOutline'
// import ChatBubbleOutline from '@material-ui/icons/ChatBubbleOutline'

const Second = ({ applied_offers = [], second_section }) => {
  const {
    you_have_applied_to,
    my_applys,
    offers_count,
    one_offer,
    people_applied,
    closed_at,
    started_at,
    status,
    offer_status,
    no_applied_offers_present
  } = second_section

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
      <Col xs={12} className="bg-primary">
        <Card className="p-25">
          <CardHeader
            action={
              <Typography
                variant="body1"
                className="m-5 d-none d-lg-block bg__orange-main text-white"
                style={{ padding: '5px 10px', borderRadius: '35px' }}
              >
                {you_have_applied_to}
                <span className="fw-bold">
                  {applied_offers.length} {offers_count}
                </span>
              </Typography>
            }
            title={theTitle(my_applys)}
            subheader={
              <Typography
                className="mb-10 fw-bold d-none d-lg-inline"
                variant="h5"
              >
                {my_applys}
              </Typography>
            }
          />
          <CardContent className="px-0-dash">
            <Row noGutters className="justify-content-center d-lg-none ">
              <Chip
                className="text-white py-1"
                label={
                  <Typography variant="caption" className="text-center">
                    {you_have_applied_to}
                    <span className="fw-bold">
                      {applied_offers.length} {offers_count}
                    </span>
                  </Typography>
                }
                clickable
                color="primary"
              />
            </Row>
            <div>
              {applied_offers.length === 0 && (
                <h2>{no_applied_offers_present}</h2>
              )}
              {applied_offers.length > 0 && (
                <Table style={{ minWidth: '650' }}>
                  <TableHead className="bg-white">
                    <TableRow>
                      <TableCell
                        className="text-info"
                        align="left"
                        padding="checkbox"
                      />
                      <TableCell
                        className="text-info"
                        align="center"
                        size="medium"
                      >
                        {one_offer}
                      </TableCell>
                      {/* <TableCell className="text-info" align="left">
                    Chat
                  </TableCell> */}
                      {/* <TableCell className="text-info" align="left">
                    <i className="ti-timer"></i>
                  </TableCell> */}
                      <TableCell className="text-info" align="left">
                        {people_applied}
                      </TableCell>
                      <TableCell className="text-info" align="left">
                        {started_at}
                      </TableCell>
                      <TableCell className="text-info" align="left">
                        {closed_at}
                      </TableCell>
                      <TableCell className="text-info" align="left">
                        {status}
                      </TableCell>
                    </TableRow>
                  </TableHead>
                  <TableBody>
                    {applied_offers &&
                      applied_offers.map(offer => (
                        <TableRow key={offer.title}>
                          <TableCell align="left" padding="checkbox">
                            <RemoveCircleOutline />
                          </TableCell>
                          <TableCell align="center" size="medium">
                            <a href={offer.visit_offer_path}>{offer.title}</a>
                          </TableCell>
                          {/* <TableCell component="th" scope="row">
                      <ChatBubbleOutline />
                    </TableCell> */}
                          {/* <TableCell align="left">{row.timer}</TableCell> */}
                          <TableCell align="center">
                            {offer.people_applied}
                          </TableCell>
                          <TableCell align="left">{offer.start_date}</TableCell>
                          <TableCell align="left">{offer.close_date}</TableCell>
                          <TableCell align="left">
                            {offer.status
                              ? offer_status['open_offer']
                              : offer_status['close_offer']}
                          </TableCell>
                        </TableRow>
                      ))}
                  </TableBody>
                </Table>
              )}
            </div>
          </CardContent>
        </Card>
      </Col>
    </Row>
  )
}

Second.propTypes = {
  applied_offers: PropTypes.array,
  second_section: PropTypes.object
}

export default Second
