import React, { useState } from 'react'
import PropTypes from 'prop-types'

import { Button, Dialog } from '@material-ui/core'
import CloseIcon from '@material-ui/icons/Close'

import classNames from 'classnames'

const AppliedOfferButton = ({ csrfParam, csrfToken, appliedOfferDetails }) => {
  const {
    is_applied,
    offer_id,
    total_applications,
    path_applied_offers_rest,
    translations,
    cookies_present = false
  } = appliedOfferDetails

  const { button_disactive, button_active, applied_offer_modal } = translations

  const [isApplied, setIsApplied] = useState(is_applied)
  const [isOpenAppliedModal, setIsOpenAppliedModal] = useState(cookies_present)
  const [numberOfApplications, setNumberOfApplications] = useState(
    total_applications
  )

  const valueButton = isApplied ? button_disactive : button_active

  const handleApplication = () => {
    const data = JSON.stringify({
      [csrfParam]: csrfToken,
      _method: 'post',
      applied_offer: {
        offer_id
      }
    })

    fetch(path_applied_offers_rest, {
      method: 'post',
      headers: { 'Content-Type': 'application/json' },
      body: data
    })
      .then(res => res.json())
      .then(({ success, redirect }) => {
        if (success) {
          setIsApplied(true)
          setIsOpenAppliedModal(true)
          setNumberOfApplications(numberOfApplications + 1)
        } else if (redirect) {
          window.location.href = redirect
        }
      })
  }

  return (
    <>
      <button
        type="button"
        onClick={handleApplication}
        className={classNames('a-actionButton', {
          '--disabled': isApplied
        })}
        disabled={isApplied}
      >
        <i className="material-icons"> check_circle </i>
      <span>{valueButton}</span>
      </button>

      <Dialog
        open={isOpenAppliedModal}
        onClose={() => setIsOpenAppliedModal(false)}
        className="m-appliedOfferModal"
      >
        <CloseIcon
          className="appliedOfferModal__closeButton"
          onClick={() => setIsOpenAppliedModal(false)}
        />
        <img
          className="a-appliedOfferModal __personImage appliedOfferModal__image"
          src="/assets/static/img/aplicacion-oferta-exitosa.png"
          alt="Ícono de persona"
        />
        <h2 className="appliedOfferModal__title">
          {applied_offer_modal.title}
        </h2>

        <p className="appliedOfferModal__description">
          {applied_offer_modal.description}
        </p>
        <strong> {applied_offer_modal.dashboard}</strong>
        <button
          type="button"
          className="a-button --primary --big appliedOfferModal__button"
          onClick={() => setIsOpenAppliedModal(false)}
        >
          {applied_offer_modal.button}
        </button>
      </Dialog>
    </>
  )
}

export default AppliedOfferButton

AppliedOfferButton.propTypes = {
  csrfParam: PropTypes.string.isRequired,
  csrfToken: PropTypes.string.isRequired,
  appliedOfferDetails: PropTypes.shape({
    is_applied: PropTypes.bool.isRequired,
    offer_id: PropTypes.oneOfType([PropTypes.string, PropTypes.number]),
    total_applications: PropTypes.number,
    path_applied_offers_rest: PropTypes.string.isRequired,
    translations: PropTypes.object.isRequired
  })
}
