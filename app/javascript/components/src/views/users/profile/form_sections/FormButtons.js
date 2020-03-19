import React, { useContext } from 'react'
import Button from '@material-ui/core/Button'
import Router from 'next/router'
import { FormContext, DispatchContext } from '../../../../context/formContext'

const FormButtons = ({ scrollAction }) => {
  const { next, prev, formSection } = useContext(FormContext)
  const dispatch = useContext(DispatchContext)
  const nextPage = () => {
    if (next) {
      dispatch({ type: next })
      scrollAction()
    } else {
      Router.push('/app/regcan/main/1')
    }
  }

  const isChoiceForm = formSection.toLowerCase() === 'has_experience'

  const prevPage = () => {
    dispatch({ type: prev })
    scrollAction()
  }
  const submit = e => {
    e.preventDefault()
    nextPage()
  }
  return (
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
            {next ? 'siguiente' : 'Guardar'}
          </Button>
        )}
      </div>
      <div className="w-100 d-flex justify-content-between">
        {prev != null && (
          <Button
            onClick={prevPage}
            size="small"
            className="text-wrap text-muted fw-bold mt-0 mx-5 w-20 animated fadeIn"
          >
            <i className="ti-arrow-circle-left mx-10" />
            <small className="fw-bold text-muted">REGRESAR</small>
          </Button>
        )}
        {prev != null && next && next !== 1 && !isChoiceForm && (
          <Button
            onClick={nextPage}
            size="small"
            className="text-wrap text-muted fw-bold mx-5 mt-0 w-20 animated fadeIn"
          >
            <small className="fw-bold text-muted mx-10">SALTAR</small>
            <i className="ti-arrow-circle-right" />
          </Button>
        )}
      </div>
    </div>
  )
}

export default FormButtons
