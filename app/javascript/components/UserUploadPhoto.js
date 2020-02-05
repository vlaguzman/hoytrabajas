import React from 'react'
import Button from '@material-ui/core/Button';
import IconButton from '@material-ui/core/IconButton';
import PhotoCamera from '@material-ui/icons/PhotoCamera';

const UserUploadPhoto = props => {
  { action, method, csrf_param, csrf_token } = props;

  const onSubmitChange = (e) {
    e.preventDefault();
  }

  const handleOnChange = (e) {
    e.target.value
    //aqui es cuando debo ejecutar el submit
  }

  return (
    <form action={action} method="post">
      <input type="hidden" name={csrf_param} value={csrf_token}> </input>
      <input type="hidden" name="_method" value={method}> </input>

      <input accept="image/*" className={classes.input} id="icon-button-file" type="file" />
      <label htmlFor="icon-button-file">
        <IconButton color="primary" aria-label="upload picture" component="span">
          <PhotoCamera />
        </IconButton>
      </label>
      <input type="submit"> </input>
    </form>
  )
}

export default UserUploadPhoto
