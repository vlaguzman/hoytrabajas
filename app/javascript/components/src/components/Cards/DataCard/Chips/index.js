import React, { Fragment } from 'react'
import Typography from '@material-ui/core/Typography'
import Chip from '@material-ui/core/Chip'
import { Row } from 'reactstrap'

const ChipsList = ({ ChipsTitle, Chips }) => {
  return (
    <Fragment>
      {ChipsTitle && (
        <Typography
          variant="body2"
          className="fw-bold my-5"
          color="textSecondary"
          component="p"
        >
          {ChipsTitle}
        </Typography>
      )}
      <Row className="px-10 flex-wrap justify-content-start my-5">
        {Chips.map((e, i) => (
          <Chip
            key={i}
            className="text-white mt-5 mr-5"
            label="Primary Clickable Chip"
            clickable
          />
        ))}
      </Row>
    </Fragment>
  )
}
export default ChipsList
