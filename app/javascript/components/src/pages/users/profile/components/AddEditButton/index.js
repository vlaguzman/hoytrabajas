import React, {Fragment} from 'react'
import AddCircleOutline from '@material-ui/icons/AddCircleOutline';
import {Row} from 'reactstrap'
import Typography from '@material-ui/core/Typography';



const AddEditButton = ({texto}) => {
  return (
    <Fragment>
      <Typography color='primary' className='d-inline'
       variant='body1' component='span' style={{lineHeight: '1.7rem', textDecoration: 'underline'}} >
        <AddCircleOutline color='primary'className='mx-5' />{texto}
      </Typography>
    </Fragment>
  )
}

export default AddEditButton
