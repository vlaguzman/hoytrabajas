import React, {Fragment} from 'react'
import Paper from '@material-ui/core/Paper';
import Typography from '@material-ui/core/Typography';
import {Row} from 'reactstrap'


const Saludo = () => {
  return (
    <Fragment>
      <Row className="my-20 justify-content-center w-100 mx-0 px-20" >
      <Paper className="w-100 d-flex flex-column pt-50 justify-content-center align-items-center profile_photo_back">
        <div className="user-image text-center position-relative mt-40">
          {/* <a href="javascript:void(0);" style={{top: '0px',right: '-9px', lineHeight: '34px'}}
            className="square-30 bg-warning card-right-action"><i className="ti-pencil"></i></a> */}
            <img
                src={require('Assets/avatars/user-11.jpg')}
                className="img-fluid mx-auto user-profile-image"
                alt="user images"
                width="130"
                height="130"
            />
          </div>
        <Typography variant='h4' className='fw-bold mt-50 mb-10'>
            ¡Hola! <span className='text-primary' >Carlos</span> 
        </Typography>
        <Row className='justify-content-center align-items-center mb-20'>
              <div className=" mx-5 text-center text-primary icon_border" >
                <i className="zmdi zmdi-twitter"></i>
              </div>                        
              <div className=" mx-5 text-center text-primary icon_border" >
                <i className="zmdi zmdi-facebook"></i>
              </div>                  
              <div className=" mx-5 text-center text-primary icon_border" >
                <i className="zmdi zmdi-instagram"></i>
              </div>                  
              <div className=" mx-5 text-center text-primary icon_border" >
                <i className="zmdi zmdi-whatsapp"></i>
              </div>                 
        </Row>
      </Paper> 
      </Row>
    </Fragment>
  )
}

export default Saludo