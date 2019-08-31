import React, { useContext } from 'react'
import Button from '@material-ui/core/Button'
import { FormContext, DispatchContext } from '../context/formContext'

const FormButtons = ({ scrollAction }) => {
  const { next, prev } = useContext(FormContext)
  console.log(next);
  const dispatch = useContext(DispatchContext)
  return (
    <div className="w-100 my-70" style={{ height: '15%' }}>
      <div className="w-100 d-flex justify-content-center">
        <Button
          onClick={() => {
            dispatch({ type: next })
            scrollAction()
          }}
          variant={next ? 'outlined' : 'contained'}
          size="large"
          color="primary"
          style={{ borderRadius: '30px' }}
          className={`text-wrap text-${
            next ? 'primary' : 'white'
          } fw-bold mt-10 col-6 col-md-4"`}
        >
          {next ? 'siguiente' : 'publicar'}
        </Button>
      </div>
      <div className="w-100 d-flex justify-content-between">
        {prev != null && (
          <Button
            onClick={() => {
              dispatch({ type: prev })
              scrollAction()
            }}
            size="small"
            className="text-wrap text-muted fw-bold mt-0 w-20 animated fadeIn"
          >
            <i className="ti-arrow-circle-left"></i>&nbsp;&nbsp;&nbsp;
            <small className="fw-bold text-muted">REGRESAR</small>
          </Button>
        )}
        {prev != null && next && next != 1 && (
          <Button
            onClick={() => {
              dispatch({ type: next })
              scrollAction()
            }}
            size="small"
            className="text-wrap text-muted fw-bold mt-0 w-20 animated fadeIn"
          >
            <small className="fw-bold text-muted">SALTAR</small>
            &nbsp;&nbsp;&nbsp;
            <i className="ti-arrow-circle-right"></i>
          </Button>
        )}
      </div>
    </div>
  )
}

export default FormButtons
