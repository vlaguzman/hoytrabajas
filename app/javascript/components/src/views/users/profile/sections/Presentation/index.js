import React, { Fragment } from 'react'
import { Row } from 'reactstrap'
import Paper from '@material-ui/core/Paper'
import Typography from '@material-ui/core/Typography'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'


// El nombre del componente debe coincidir con el nombre del archivo
// const Saludo = () => {
const Presentation = () => {
  return (
    <Fragment>
      <Row className="pt-70 mt-70 mb-20 justify-content-center w-100 mx-0 px-20">
        <Paper className="w-100 d-flex flex-column pt-50 justify-content-center align-items-center profile_photo_back light_shadow">
          <div className="user-image text-center position-relative mt-40">
            {/* <a href="javascript:void(0);" style={{top: '0px',right: '-9px', lineHeight: '34px'}}
            className="square-30 bg-warning card-right-action"><i className="ti-pencil" /></a> */}
            <img
              // utilizar la carpeta de Static directamente
              src="/assets/static/avatars/user-11.jpg"
              // src={require('/Assets/avatars/user-11.jpg')}
              className="img-fluid mx-auto user-profile-image"
              alt="user images"
              width="130"
              height="130"
            />
          </div>
          <Typography variant="h4" className="fw-bold mt-50 mb-10">
            ¡Hola! <span className="text-primary">Carlos</span>
          </Typography>
          <Row style={{height: '2rem'}} className='mb-40'>
              <div className='h-100 text-center ml-10 mr-5' 
                style={{ paddingTop: '2%',borderRadius: '50%', border: '1px solid orange', width: '2rem'}}>
                <FontAwesomeIcon className='mx-auto text-primary' icon={['fab', 'facebook-f']} size="sm" />
              </div>
                <div className='h-100 text-center mr-5'
                style={{ paddingTop: '2%',borderRadius: '50%', border: '1px solid orange', width: '2rem'}}>
                  <FontAwesomeIcon className='mx-auto text-primary' icon={['fab', 'instagram']} size="sm" />
                </div>
                <div className='h-100 text-center mr-5'
                  style={{ paddingTop: '2%',borderRadius: '50%', border: '1px solid orange', width: '2rem'}}>
                  <FontAwesomeIcon className='mx-auto text-primary' icon={['fab', 'twitter']} size="sm" />            
                </div>
                <div className='h-100 text-center mr-5' 
                  style={{ paddingTop: '2%',borderRadius: '50%', border: '1px solid orange', width: '2rem'}}>
                  <FontAwesomeIcon className='mx-auto text-primary' icon={['fab', 'whatsapp']} size="sm" />            
                </div>
            </Row>
        </Paper>
      </Row>
    </Fragment>
  )
}

export default Presentation
