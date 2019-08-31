import React, {Fragment} from 'react'
import AddCircleOutline from '@material-ui/icons/AddCircleOutline';
import {Row} from 'reactstrap'
import Typography from '@material-ui/core/Typography';



const AddEditTimeUpdateButton = ({texto, tiempo}) => {
  return (
    // <Row className='w-100 justify-content-between mr-0' >
    <Fragment>
      <div>
        <Typography className='text-muted' variant='body1' style={{lineHeight: '1.7rem'}} >{
          `Última actualización: Hace ${tiempo} `
        }</Typography>
      </div>
      <div className='d-inline-block'>
        <Typography color='primary' variant='body1' className='text-right' style={{lineHeight: '1.7rem', textDecoration: 'underline'}} >
          <AddCircleOutline color='primary' className='mr-10' /> 
          {texto}
        </Typography>
      </div >
    </Fragment>
    // </Row>
  )
}

export default AddEditTimeUpdateButton
