import React from 'react'
import { makeStyles } from '@material-ui/core/styles'
import Popper from '@material-ui/core/Popper'

const useStyles = makeStyles((theme) => ({
  paper: {
      border: '1px solid #eee',
      padding: theme.spacing(2),
      margin: '32px 0 0',
      backgroundColor: theme.palette.background.paper,
    },
}));

const PopperMenu = ( {translations} ) => {
 console.log("popper menu");

  const classes = useStyles();
  const [anchorEl, setAnchorEl] = React.useState(null);

  const open = Boolean(anchorEl);
  const id = open ? 'simple-popper' : undefined;


  const setOpen = React.useState(false);
  const [placement, setPlacement] = React.useState();

  const handleClick = (newPlacement) => (event) => {
      setAnchorEl(event.currentTarget);
      setOpen((prev) => placement !== newPlacement || !prev);
      setPlacement(newPlacement);
    };

  return (
      <div>
        <button aria-describedby={id} type="button" onClick={handleClick('bottom-start')}>
	  {translations.nav.candidates_title}
        </button>
        <Popper id={id} open={open} anchorEl={anchorEl}>
          <div className={classes.paper}>
	    <li>
              <a href='#'>{translations.nav.find_job}</a>
	    </li>
	    <li>
              <a href='#'>{translations.nav.benefits}</a>
	    </li>
	    <li>
              <a href='#'>{translations.nav.premium}</a>
	    </li>
	    <li>
              <a href='#'>{translations.nav.e_learning}</a>
	    </li>
	  </div>

        </Popper>
      </div>
    );
}

export default PopperMenu
