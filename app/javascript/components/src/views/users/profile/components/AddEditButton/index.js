import React, { Fragment } from 'react'
import AddCircleOutline from '@material-ui/icons/AddCircleOutline'
import { Row } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import Fab from '@material-ui/core/Fab'
import Button from '@material-ui/core/Button'
import Dialog from '@material-ui/core/Dialog'
import DialogActions from '@material-ui/core/DialogActions'
import DialogContent from '@material-ui/core/DialogContent'
import DialogContentText from '@material-ui/core/DialogContentText'
import DialogTitle from '@material-ui/core/DialogTitle'
import Slide from '@material-ui/core/Slide'
// import { FormProvider } from 'Context/formContext'
// import { InfoProvider } from 'Context/formInfoContext'

// // utilizar rutas absolutas para importar
// import FormBody from 'Views/users/profile/form_sections/FormBody'
// import allForms from 'Views/users/profile/formJson'

const Transition = React.forwardRef(function Transition(props, ref) {
  return <Slide direction="up" ref={ref} {...props} />
})

const AddEditButton = ({ texto, formNumber = 0 }) => {
  const [open, setOpen] = React.useState(false)

  function handleClickOpen() {
    setOpen(true)
  }

  function handleClose() {
    setOpen(false)
  }

  const myRef = React.createRef()

  const scrollTop = () => {
    setTimeout(() => {
      // myRef.current.scrollIntoView({ behavior: 'smooth', block: 'start' })
    }, 50)
  }
  return (
    <Fragment>
      <Fab
        onClick={handleClickOpen}
        variant="extended"
        style={{ boxShadow: 'none', backgroundColor: 'transparent' }}
      >
        <AddCircleOutline color="primary" className="mr-10" />
        <Typography
          color="primary"
          variant="body2"
          className=""
          style={{ lineHeight: '1.7rem', textDecoration: 'underline' }}
        >
          {texto}
        </Typography>
      </Fab>
      <Dialog
        open={open}
        scroll="body"
        maxWidth={false}
        PaperProps={{ style: { width: '800px' } }}
        TransitionComponent={Transition}
        keepMounted
        onClose={handleClose}
        aria-labelledby="alert-dialog-slide-title"
        aria-describedby="alert-dialog-slide-description"
      >
        <DialogTitle id="alert-dialog-slide-title">
          {"Use Google's location service?"}
        </DialogTitle>
        <DialogContent className="px-70">
          {/* <FormProvider allForms={allForms.slice(formNumber, (formNumber+1))}>
            <InfoProvider>
              <FormBody scrollAction={scrollTop} />
            </InfoProvider>
          </FormProvider> */}
        </DialogContent>
        <DialogActions>
          {/* <Button onClick={handleClose} color="primary">
            Disagree
          </Button>
          <Button onClick={handleClose} color="primary">
            Agree
          </Button> */}
        </DialogActions>
      </Dialog>
    </Fragment>
  )
}

export default AddEditButton
