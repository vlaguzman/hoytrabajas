import React, { useContext, Fragment } from 'react'
import { connect } from 'react-redux'
import { useRouter } from 'next/router'
import Button from '@material-ui/core/Button'
import { loadInfo } from 'Actions'
import { FormContext, DispatchContext } from 'Context/formContext'
// import { InfoContext } from 'Context/formInfoContext'

const FormButtons = ({ scrollAction, dispatch }) => {
  const { next, prev, formSection } = useContext(FormContext)
  const dispatchForm = useContext(DispatchContext)
  const router = useRouter()
  const isChoiceForm = formSection.toLowerCase() === 'has_experience'

  // const infoState = useContext(InfoContext)

  if (!next) router.prefetch('/regcan/forms/completed')

  const nextPage = () => {
    if (next) {
      dispatchForm({ type: next })
      scrollAction()
    } else {
      router.push('/regcan/forms/completed')
    }
  }

  const prevPage = () => {
    dispatchForm({ type: prev })
    scrollAction()
  }

  const submit = e => {
    e.preventDefault()
    nextPage()
    // loadInfo({ ...infoState })
  }
  return (
    <Fragment>
    <div className="w-100 my-70" style={{ height: '15%' }}>
      <div className="w-100 d-flex justify-content-center">
        {!isChoiceForm && (
          <Button
            type="submit"
            onClick={submit}
            variant={next ? 'outlined' : 'contained'}
            size="large"
            color="primary"
            style={{ borderRadius: '30px' }}
            className={`text-wrap text-${
              next ? 'primary' : 'white'
            } fw-bold mt-10 col-6 col-md-4`}
          >
            {next ? 'siguiente' : 'publicar'}
          </Button>
        )}
      </div>
    </div>
      <div className="w-100 d-flex justify-content-between">
        {prev != null && (
          <Button
            onClick={prevPage}
            size="small"
            style={{bottom: '0', left: '0'}}
            className="position-absolute text-wrap text-muted fw-bold mt-0 mx-5 w-20 animated fadeIn"
          >
            <i className="ti-arrow-circle-left mx-10" />
            <small className="fw-bold text-muted">REGRESAR</small>
          </Button>
        )}
        {prev != null && next && next !== 1 && !isChoiceForm && (
          <Button
            onClick={nextPage}
            size="small"
            style={{bottom: '0', right: '0'}}
            className="position-absolute text-wrap text-muted fw-bold mx-5 mt-0 w-20 animated fadeIn"
          >
            <small className="fw-bold text-muted mx-10">SALTAR</small>
            <i className="ti-arrow-circle-right" />
          </Button>
        )}
      </div>
    </Fragment>
  )
}

export default connect()(FormButtons)