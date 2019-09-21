import React, { Fragment } from 'react'
import Popper from '@material-ui/core/Popper'
import Typography from '@material-ui/core/Typography'
import Button from '@material-ui/core/Button'
import Fade from '@material-ui/core/Fade'
import Paper from '@material-ui/core/Paper'

const Poper = ({ contenido, id, open, anchorEl }) => (
  <Popper
    id={id}
    open={open}
    anchorEl={anchorEl}
    transition
    style={{ zIndex: '9999' }}
  >
    {({ TransitionProps }) => (
      <Fade {...TransitionProps} timeout={350}>
        <Paper>
          <Typography>{contenido}</Typography>
        </Paper>
      </Fade>
    )}
  </Popper>
)

const SlideOne = () => {
  const [anchorEl, setAnchorEl] = React.useState(null)

  function handleClick(event) {
    setAnchorEl(anchorEl ? null : event.currentTarget)
  }

  const open = Boolean(anchorEl)
  const id = open ? 'simple-popper' : undefined
  return (
    <Fragment>
      <Poper contenido="Hello" {...{ id }} {...{ open }} {...{ anchorEl }} />
        <img
          src="/assets/static/img/node.png"
          onClick={handleClick}
          className="position-absolute animated fadeIn first_node"
          alt=""
        />
        <img
          src="/assets/static/img/node.png"
          onClick={handleClick}
          className="position-absolute animated fadeIn second_node"
          alt="Node"
        />
        <img
          src="/assets/static/img/node.png"
          onClick={handleClick}
          className="position-absolute animated fadeIn thrid_node"
          alt="Node"
        />
        <img
          src="/assets/static/img/box-oferta.png"
          className="position-absolute oferta-box oferta_acostada MuiPaper-elevation20 animated fadeIn"
          alt=""
          width="44%"
        />
    </Fragment>
  )
}

export default SlideOne
