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
// import { FormProvider } from '../context/formContext'
// import { InfoProvider } from '../context/formInfoContext'

// utilizar rutas absolutas para importar
// import FormBody from '../views/users/profile/form_sections/FormBody'
// import allForms from '../views/users/profile/formJson'

const Transition = React.forwardRef(function Transition(props, ref) {
  return <Slide direction="up" ref={ref} {...props} />
})

const AddEditTimeUpdateButton = ({ texto, tiempo, formNumber }) => {
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
    // <Row className='w-100 justify-content-between mr-0' >
    <>
      <div>
        <Typography
          className="text-muted"
          variant="caption"
          style={{ lineHeight: '1.7rem' }}
        >{`Última actualización: Hace ${tiempo} `}</Typography>
      </div>
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
        // className='w-50'
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
          Use Google&apos;s location service?
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
    </>
    // </Row>
  )
}

export default AddEditTimeUpdateButton
