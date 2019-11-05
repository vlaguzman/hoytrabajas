import React, { Fragment } from 'react'
import {Row,Col} from 'reactstrap'
import Typography from '@material-ui/core/Typography'

export default ({ id, img, quantity, name, handleJobCategory }) => {
  console.log('**************')
  console.log(img)
  console.log(name)
  console.log('**************')
  const ellipsis = (word) => {
    return word.length > 20 ? `${word.substr(0, 18)}...` : word;
  }

  return (
    <Col className='align-items-center justify-content-center h-100' onClick={() => { handleJobCategory(id) }}>
      <Row className="justify-content-center mb-5 mx-0">
        <img
          className="rounded"
          src={`/assets/static/img/${img}`}
          alt="client"
          width="40"
          height="40"
        />
      </Row>
      <Row className={`justify-content-center w-100 mt-5 ${name.length < 10 && 'mt-15 mb-10'} mx-0`}>
        <Typography
         variant='caption' component='div' 
         className='d-inline-block w-100 text-dark text-center text-wrap'>
          {ellipsis(name)}
        </Typography>
      </Row>
      <Row className='w-100 h-100 mx-0 mt-auto justify-content-center align-self-end'>
        <Typography variant='body1' 
        className="d-inline-block text-center mt-auto align-self-end fw-bold text-primary">
          {quantity}
        </Typography>
      </Row>
    </Col>
  )
}
