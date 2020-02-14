import React, { useState } from 'react'
import Button from '@material-ui/core/Button';
import IconButton from '@material-ui/core/IconButton';
import PhotoCamera from '@material-ui/icons/PhotoCamera';
import CheckIcon from '@material-ui/icons/Check';

const UserUploadPhoto = props => {
const { action, method, csrf_param, csrf_token } = props;

  const [uploadButton, setUploadButton] = useState(true)

  const handleOnChange = (e) => {
    let attach_file = e.target.files
    attach_file.length >= 1 && setUploadButton(false)
  };

  return (
    <form action={action} method="post" encType="multipart/form-data" className="noHeight" >
      <input type="hidden" name={csrf_param} value={csrf_token}/>
      <input type="hidden" name="_method" value={method}/>
      <>
        <input accept="image/*" id="icon-button-file" type="file" onChange={handleOnChange} className="hidden" name="curriculum_vitae[photo]" />
        <label htmlFor="icon-button-file" className={`${ uploadButton ? 'visibleElement' : 'hiddenElement' }`}>
          <IconButton color="primary" aria-label="upload picture" component="span" className="uploadPhoto">
            <PhotoCamera />
          </IconButton>
        </label>
      </>
        <>
           <input className="hidden" id="icon-button-submit" type="submit" />
           <label htmlFor="icon-button-submit" className={`${ uploadButton ? 'hiddenElement' : 'visibleElement' }`} >
           <IconButton color="primary" aria-label="upload picture" component="span" className='uploadPhoto'>
               <CheckIcon />
             </IconButton>
           </label>
        </>
    </form>
  )
}

export default UserUploadPhoto
