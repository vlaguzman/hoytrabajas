import React, { useState } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import classNames from 'classnames'

const CategoryUnit = ({
  id,
  img,
  quantity,
  name,
  jobCategoryIds,
  handleJobCategory
}) => {
  const ellipsis = word => {
    return word.length > 20 ? `${word.substr(0, 18)}...` : word
  }

  const isInArray = jobCategoryIds.findIndex(item => item === id)
  const [selected, setSelected] = useState(isInArray !== -1)

  return (
    <Col
      id={name}
      className={classNames(
        'align-items-center a-filter__gray justify-content-center h-100',
        {
          'is-selected': selected
        }
      )}
      onClick={(e) => {
        e.preventDefault()
        handleJobCategory(id, selected)
        setSelected(!selected)
      }}
    >
      <Row className="filterForm__image justify-content-center">
        <img
          className="rounded"
          src={`/assets/static/img/${img}`}
          alt="client"
          width="40"
          height="40"
        />
      </Row>
      <Row className="justify-content-center w-100 mx-0">
        <Typography
          variant="caption"
          component="div"
          className="d-inline-block w-100 text-dark text-center text-wrap"
        >
          {ellipsis(name)}
        </Typography>
      </Row>
      <Row className="w-100 h-100 mx-0 mt-auto justify-content-center align-self-end">
        <Typography
          variant="body1"
          className="d-inline-block text-center mt-auto align-self-end fw-bold text-primary"
        >
          {quantity}
        </Typography>
      </Row>
    </Col>
  )
}

CategoryUnit.propTypes = {
  id: PropTypes.string.isRequired,
  img: PropTypes.string.isRequired,
  quantity: PropTypes.number.isRequired,
  name: PropTypes.string.isRequired,
  jobCategoryIds: PropTypes.array.isRequired,
  handleJobCategory: PropTypes.func.isRequired
}

export default CategoryUnit
