import React, { Fragment, useState } from 'react'
import Chip from '@material-ui/core/Chip'
import FaceIcon from '@material-ui/icons/Face'
import { connect } from 'react-redux'
import { makeGetMultiFormInfo } from 'Src/selectors/forms'
import dialogState from 'Hooks/dialogState'
import FormDialog from './FormDialog'

const Chips = props => {
  const {
    formSection,
    pro,
    currentFormInfo: { allForms = null }
  } = props

  const [content, setContent] = useState(null)

  const { value: state, handleClickOpen, handleClose } = dialogState({
    open: false
  })

  const handleClick = id => {
    setContent(allForms.find(form => form.id === id))
    handleClickOpen()
  }

  if (allForms.constructor === Array) {
    return (
      <Fragment>
        {allForms.map((item, idx) => {
          const { id = null } = item
          if (idx === allForms.length - 1) return null
          return (
            <Chip
              {...pro}
              clickable
              style={{ margin: `5px 2px`, maxHeight: '30px' }}
              key={id || idx}
              icon={<FaceIcon />}
              label={item.company || item.title || `Nueva experiencia...`}
              onClick={() => handleClick(id)}
              // onDelete={handleDelete}
            />
          )
        })}
        <FormDialog
          {...{
            open: state.open,
            addSingleForm: false,
            currentMultiForm: content,
            formSection,
            handleClose
          }}
        />
      </Fragment>
    )
  }
  return null
}

const makeMapStateToProps = () => {
  const getMultiFormInfo = makeGetMultiFormInfo()
  const mapStateToProps = (state, props) => ({
    currentFormInfo: getMultiFormInfo(state, props)
  })
  return mapStateToProps
}

export default connect(makeMapStateToProps)(Chips)
