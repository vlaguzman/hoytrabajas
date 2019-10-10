import React from 'react'
import Dialog from '@material-ui/core/Dialog'
import DialogContent from '@material-ui/core/DialogContent'
import ExperienceCard from '../../Cards/ExperienceCard'
import EducationCard from '../../Cards/EducationCard'

const FormDialog = props => {
  const {
    open,
    currentMultiForm,
    formSection,
    handleClose,
    addSingleForm
  } = props

  const closeDialog = () => {
    handleClose()
    if (addSingleForm) addSingleForm()
  }

  const isExperience = formSection.toLowerCase() === 'experiences'
  const isEducation =
    formSection.toLowerCase() === 'education' ||
    formSection.toLowerCase() === 'diplomas'

  return currentMultiForm ? (
    <Dialog
      maxWidth="lg"
      open={open}
      onClose={closeDialog}
      aria-labelledby="responsive-dialog-title"
    >
      <DialogContent>
        {isExperience && (
          <ExperienceCard
            {...{ content: currentMultiForm, formSection }}
            style={{ boxShadow: 'none' }}
          />
        )}
        {isEducation && (
          <EducationCard
            {...{ content: currentMultiForm, formSection }}
            style={{ boxShadow: 'none' }}
          />
        )}
      </DialogContent>
    </Dialog>
  ) : null
}

export default FormDialog
