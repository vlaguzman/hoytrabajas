import React, {Fragment} from 'react'
import FavoriteBorder from '@material-ui/icons/FavoriteBorder';
import IconButton from '@material-ui/core/IconButton';
import Chip from '@material-ui/core/Chip';
import Typography from '@material-ui/core/Typography';
import { Row } from 'reactstrap';
import CheckCircle from '@material-ui/icons/CheckCircle'



const PaperHeader = ({titulo}) => {
  return (
    <Fragment>
      <Row className='w-100 justify-content-between' noGutters>
        <IconButton aria-label="Settings"><FavoriteBorder /></IconButton>
        <Chip
              className='text-white mt-20 mr-20'
              label="Completo"
              clickable
              color="primary"
              onDelete={() => (alert('delete icon'))}
              deleteIcon={<CheckCircle className='text-white'  />}
            />
      </Row>
      <Row className='w-100 justify-content-between' noGutters>
          <Typography variant='h6' className='pl-10 text-left fw-bold'>
            {titulo}
          </Typography>
      </Row>
    </Fragment>
  )
}

export default PaperHeader;