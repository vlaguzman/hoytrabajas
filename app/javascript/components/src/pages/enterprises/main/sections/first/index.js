import React from 'react'
import Paper from '@material-ui/core/Paper'
import {Row} from 'reactstrap'
import Typography from '@material-ui/core/Typography'

const FirstSection = () => {
  return (
    <Row className="my-50 justify-content-center w-100" noGutters>
      <Paper style={{borderRadius: '16px'}} className="d-flex flex-column responsive-papers-entpr pt-50 justify-content-center align-items-center profile_photo_back">
        <div className="user-image text-center position-relative mt-40">
          {/* <a
            href="javascript:void(0);"
            style={{ top: '0px', right: '-9px', lineHeight: '34px' }}
            className="square-30 bg-warning card-right-action"
          >
            <i className="ti-pencil"></i>
          </a> */}
          <img
            src={require('Assets/avatars/user-10.jpg')}
            className="img-fluid mx-auto user-profile-image"
            alt="user images"
            width="160"
            height="160"
          />
        </div>
        <Typography variant="h4" className="fw-bold my-20 px-10 text-center">
          ¡Hola! <span className="text-primary">Verdelógico</span>
        </Typography>
        <Row className='justify-content-center align-items-center mb-50'>
              <div className=" mx-5 text-center text-primary icon_border_bigger" >
                <i className="zmdi zmdi-twitter"></i>
              </div>                        
              <div className=" mx-5 text-center text-primary icon_border_bigger" >
                <i className="zmdi zmdi-facebook"></i>
              </div>                  
              <div className=" mx-5 text-center text-primary icon_border_bigger" >
                <i className="zmdi zmdi-instagram"></i>
              </div>                  
              <div className=" mx-5 text-center text-primary icon_border_bigger" >
                <i className="zmdi zmdi-whatsapp"></i>
              </div>                 
        </Row>
      </Paper>
    </Row>
  )
}

export default FirstSection