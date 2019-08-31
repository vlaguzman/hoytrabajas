import React, { useContext } from 'react'
import PropTypes from 'prop-types'
import Button from '@material-ui/core/Button'
import Router from 'next/router'
import { connect } from 'react-redux'
// import {
//   makeGetFormSection,
//   makeGetValidateFormSection
// } from 'Src/selectors/forms'
import useWhyDidYouUpdate from 'Hooks/useWhyDidYouUpdate'
import {
  FormContext,
  DispatchContext,
  FormChangeContext
} from 'Context/formContext'

// import { loadInfo } from 'Actions'
// import { InfoContext } from 'Context/formInfoContext'

const FormButtons = props => {
  const { scrollAction, formSection, formName, next, prev } = props
  const dispatch = useContext(DispatchContext)

  const nextPage = () => {
    if (next) {
      dispatch({ type: next })
      scrollAction()
    } else {
      // Router.push('/app/regcan/main/1')
      console.log('should save to DB')
    }
  }

  useWhyDidYouUpdate('formbuttons', props)

  const submit = e => {
    e.preventDefault()
    nextPage()
    // loadInfo({ ...infoState })
  }

  const infoHasChanged = false

  return infoHasChanged !== null ? (
    <div className="w-100 my-70" style={{ height: '15%' }}>
      <div className="w-100 d-flex justify-content-center">
        <Button
          type="submit"
          onClick={submit}
          variant={!infoHasChanged ? 'outlined' : 'contained'}
          size="large"
          color="primary"
          style={{ borderRadius: '30px' }}
          className={`text-wrap text-${
            !infoHasChanged ? 'primary' : 'white'
          } fw-bold mt-10 col-6 col-md-4`}
        >
          {infoHasChanged ? 'Guardar' : 'Guardado'}
        </Button>
      </div>
    </div>
  ) : null
}

// const makeMapStateToProps = () => {
//   const getField = makeGetFormSection()
//   const getValidationField = makeGetValidateFormSection()
//   const mapStateToProps = (state, props) => ({
//     currentField: getField(state, props),
//     currentValidation: getValidationField(state, props)
//   })
//   return mapStateToProps
// }

// export default connect(makeMapStateToProps)(FormButtons)
export default FormButtons

FormButtons.propTypes = {
  scrollAction: PropTypes.func,
  formSection: PropTypes.string,
  formName: PropTypes.string,
  next: PropTypes.number,
  prev: PropTypes.number
}
