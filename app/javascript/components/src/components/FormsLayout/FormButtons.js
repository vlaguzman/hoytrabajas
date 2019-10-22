import React from 'react'
import PropTypes from 'prop-types'
import Button from '@material-ui/core/Button'

const FormButtons = props => {
  const { nextPath, prevPath, buttons } = props
  const { next, previous, submit } = buttons

  const nextPage = e => {
    e.preventDefault()
    if (nextPath) window.location.assign(nextPath)
  }

  const prevPage = e => {
    e.preventDefault()
    if (prevPath) window.location.assign(prevPath)
  }

  return (
    <>
      <div className="w-100 my-70" style={{ height: '15%' }}>
        <div className="w-100 d-flex justify-content-center">
          {submit && (
            <Button
              type="submit"
              variant={nextPath ? 'outlined' : 'contained'}
              size="large"
              color="primary"
              style={{ borderRadius: '30px' }}
              className={`text-wrap text-${
                nextPath ? 'primary' : 'white'
              } fw-bold mt-10 col-6 col-md-4`}
            >
              {submit}
            </Button>
          )}
        </div>
      </div>
      <div className="w-100 d-flex justify-content-between">
        {prevPath && previous && (
          <Button
            onClick={prevPage}
            size="small"
            style={{ bottom: '0', left: '0' }}
            className="position-absolute text-wrap text-muted fw-bold mt-0 mx-5 w-20 animated fadeIn"
          >
            <i className="ti-arrow-circle-left mx-10" />
            <small className="fw-bold text-muted">{previous}</small>
          </Button>
        )}
        {prevPath && nextPath && next && (
          <Button
            onClick={nextPage}
            size="small"
            style={{ bottom: '0', right: '0' }}
            className="position-absolute text-wrap text-muted fw-bold mx-5 mt-0 w-20 animated fadeIn"
          >
            <small className="fw-bold text-muted mx-10">{next}</small>
            <i className="ti-arrow-circle-right" />
          </Button>
        )}
      </div>
    </>
  )
}

export default FormButtons

FormButtons.propTypes = {
  prevPath: PropTypes.string,
  nextPath: PropTypes.string,
  buttons: PropTypes.shape({
    previous: PropTypes.string,
    next: PropTypes.string,
    submit: PropTypes.string.isRequired
  }).isRequired
}
