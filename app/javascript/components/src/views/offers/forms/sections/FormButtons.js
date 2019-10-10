import React from 'react'
import Button from '@material-ui/core/Button'
import { Row } from 'reactstrap'

const FormButtons = props => {
  const { scrollAction, next, prev, buttons, formSection } = props
  const {
    prev: prevText = null,
    next: nextText = null,
    submit: submitText = null
  } = buttons
  const isChoiceForm = formSection.toLowerCase() === 'has_experience'

  const nextPage = () => {
    if (next) {
      window.location.assign(`/companies/first_offer/${next}`)
    } else {
      window.location.assign(`/companies/first_offer/completed`)
    }
  }

  const prevPage = () => {
    window.location.assign(`/companies/first_offer/${prev}`)
  }

  const submit = e => {
    e.preventDefault()
    nextPage()
  }
  return (
    <>
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
              {submitText}
            </Button>
          )}
        </div>
      </div>
      <div className="w-100 d-flex justify-content-between">
        {prev && prevText && (
          <Button
            onClick={prevPage}
            size="small"
            style={{ bottom: '0', left: '0' }}
            className="position-absolute text-wrap text-muted fw-bold mt-0 mx-5 w-20 animated fadeIn"
          >
            <i className="ti-arrow-circle-left mx-10" />
            <small className="fw-bold text-muted">${prevText}</small>
          </Button>
        )}
        {prev && next && nextText && !isChoiceForm && (
          <Button
            onClick={nextPage}
            size="small"
            style={{ bottom: '0', right: '0' }}
            className="position-absolute text-wrap text-muted fw-bold mx-5 mt-0 w-20 animated fadeIn"
          >
            <small className="fw-bold text-muted mx-10">${nextText}</small>
            <i className="ti-arrow-circle-right" />
          </Button>
        )}
      </div>
    </>
  )
}

export default FormButtons
