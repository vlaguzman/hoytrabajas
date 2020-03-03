import React from 'react'
import Fab from '@material-ui/core/Fab'
import FavoriteBorderIcon from '@material-ui/icons/FavoriteBorder'

const LikeCompanyButton = ({ liked }) => {
  return (
    <Fab
      color="secondary"
      className="a-likeCompanyButton __pink"
      aria-label="edit"
    >
      <FavoriteBorderIcon />
    </Fab>
  )
}

export default LikeCompanyButton