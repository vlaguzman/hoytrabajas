import React, { useState } from 'react'
import Button from '@material-ui/core/Button';
import IconButton from '@material-ui/core/IconButton';
import PhotoCamera from '@material-ui/icons/PhotoCamera';
import CheckIcon from '@material-ui/icons/Check';

const UserUploadPhoto = props => {
  { action, method, csrf_param, csrf_token } = props;

  const [defaultButton, setDefaultButton] = useState(false)

  const handleOnChange = (e) {
    let attach_file = e.target.files
    attach_file.length >= 1 && setDefaultButton(true)
  };

  return (
    <form action={action} method="post">
      <input type="hidden" name={csrf_param} value={csrf_token}> </input>
      <input type="hidden" name="_method" value={method}> </input>

      { defaultButton ?

        (<>
          <input accept="image/*" id="icon-button-file" type="file" />
          <label htmlFor="icon-button-file">
            <IconButton color="primary" aria-label="upload picture" component="span">
              <PhotoCamera />
            </IconButton>
          </label>
        </>)
      :
        (<>
           <input id="icon-button-file" type="submit" />
           <label htmlFor="icon-button-file">
             <IconButton color="primary" aria-label="upload picture" component="span">
               <CheckIcon />
             </IconButton>
           </label>
         </>)
      }
    </form>
  )
}

export default UserUploadPhoto
