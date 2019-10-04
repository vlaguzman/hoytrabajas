import React from 'react'
import Paper from '@material-ui/core/Paper'
import FormBody from './FormBody'
import {Row, Col} from 'reactstrap'
import LinearProgress from '@material-ui/core/LinearProgress';
import Typography from '@material-ui/core/Typography';

const FormWrapper = ({ formContent, formInfo }) => {
  const myRef = React.createRef()

  const scrollTop = () => {
    setTimeout(() => {
      myRef.current.scrollIntoView({ behavior: 'smooth', block: 'start' })
    }, 50)
  }

  return (
    <div className="main-wrapper" ref={myRef}>
      <Row className='mx-0 mt-70 mb-0 w-100 justify-content-center d-md-none'>
        <Col>
          <LinearProgress color="primary" variant="determinate" value={50} className='w-75 mx-auto' />
          <Typography variant='h6' className='text-center'>
            50%
          </Typography>
        </Col>
      </Row>
      <Row className="mt-10 mb-70 justify-content-center w-100 pb-50 mx-0 px-20">
        <Paper className="d-flex flex-column position-relative paper-width justify-content-around align-items-center pt-60 mb-70">
          <FormBody scrollAction={scrollTop} formName="offers" formContent={formContent} formInfo={formInfo} />
        </Paper>
      </Row>
    </div>
  )
}

export default FormWrapper
