import React, { useState } from 'react'
import PropTypes from 'prop-types'
import IconButton from '@material-ui/core/IconButton'
import PhotoCamera from '@material-ui/icons/PhotoCamera'
import CheckIcon from '@material-ui/icons/Check'

const UserUploadPhoto = props => {
  const {
    action,
    method,
    csrf_param,
    csrf_token,
    src_image,
    candidate_present
  } = props

  const [uploadButton, setUploadButton] = useState(true)
  const [urlPhoto, setUrlPhoto] = useState(src_image)

  const handleOnChange = e => {
    const attach_file = e.target.files
    if (attach_file.length >= 1) setUploadButton(false)
    setUrlPhoto(URL.createObjectURL(attach_file[0]))
  }

  const FormCandidate = () => (
    <form
      action={action}
      method="post"
      encType="multipart/form-data"
      className="noHeight"
    >
      <input type="hidden" name={csrf_param} value={csrf_token} />
      <input type="hidden" name="_method" value={method} />
      <>
        <input
          accept="image/*"
          id="icon-button-file"
          type="file"
          onChange={handleOnChange}
          className="-hidden"
          name="curriculum_vitae[photo]"
        />
        <label
          htmlFor="icon-button-file"
          className={`${uploadButton ? 'visibleElement' : 'hiddenElement'}`}
        >
          <IconButton
            color="primary"
            aria-label="upload picture"
            component="span"
            className="uploadPhoto"
          >
            <PhotoCamera />
          </IconButton>
        </label>
      </>
      <>
        <input className="-hidden" id="icon-button-submit" type="submit" />
        <label
          htmlFor="icon-button-submit"
          className={`${uploadButton ? 'hiddenElement' : 'visibleElement'}`}
        >
          <IconButton
            color="primary"
            aria-label="upload picture"
            component="span"
            className="uploadPhoto"
          >
            <CheckIcon />
          </IconButton>
        </label>
      </>
    </form>
  )

  return (
    <>
      <img src={urlPhoto} alt="Photo Profile" className="profilePicture" />
      {candidate_present &&
        FormCandidate({ csrf_param, csrf_token, action, method })}
    </>
  )
}

export default UserUploadPhoto

UserUploadPhoto.propTypes = {
  csrf_param: PropTypes.string,
  csrf_token: PropTypes.string,
  candidate_present: PropTypes.bool,
  action: PropTypes.string.isRequired,
  method: PropTypes.string,
  src_image: PropTypes.string
}
