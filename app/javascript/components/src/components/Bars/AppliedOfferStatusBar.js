import React, { useState, useEffect } from 'react'
import Dialog from '@material-ui/core/Dialog'
import CloseIcon from '@material-ui/icons/Close'

const AppliedOfferStatusBar = ({
  translations,
  company_signed_in,
  applied_offer_data,
  path_applied_offers_rest
}) => {
  const [currentState, setCurrentState] = useState(
    applied_offer_data && applied_offer_data.status
  )
  const [openStatusModal, setOpenStatusModal] = useState(false)

  const updateStateMachine = action => {
    const data = JSON.stringify({
      applied_offer: {
        ...applied_offer_data,
        action
      }
    })

    return fetch(
      `${path_applied_offers_rest}/${applied_offer_data.applied_offer_id}`,
      {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        body: data
      }
    )
      .then(res => res.json())
      .then(resJSON => resJSON)
  }

  useEffect(async () => {
    if (company_signed_in && applied_offer_data && currentState === 'unseen') {
      const { data } = await updateStateMachine('seen')
      if (data && data.new_state) setCurrentState(data.new_state)
    }
  }, [])

  const handleUpdate = async action => {
    const { data } = await updateStateMachine(action)
    if (data && data.new_state) setCurrentState(data.new_state)
  }

  const renderButtons = () => (
    <>
      <p className="title">{translations.status_options.are_you_interested}</p>
      <div className="buttonsGrid">
        <button
          type="button"
          className="a-button --white"
          onClick={() => handleUpdate('interested')}
        >
          {translations.status_options.im_interested}
        </button>
        <button
          type="button"
          className="a-button --white"
          onClick={() => handleUpdate('not_interested')}
        >
          {translations.status_options.im_not_interested}
        </button>
      </div>
      <button type="button" className="a-button --secondary download_cv">
        {translations.download_cv}
      </button>
    </>
  )

  const renderContent = () => {
    if (
      !company_signed_in ||
      !applied_offer_data ||
      currentState === 'interested' ||
      currentState === 'not_interested'
    ) {
      return null
    }

    return (
      <div className="a-statusOptions fixed">
        <div className="flexWrapper hideResponsive">{renderButtons()}</div>
        <div className="showResponsive">
          <button
            type="button"
            className="a-button --primary openStatusModalButton"
            onClick={() => setOpenStatusModal(true)}
          >
            {translations.status_options.are_you_interested}
          </button>
        </div>
        <Dialog
          open={openStatusModal}
          className="showResponsive a-statusOptions"
          onClose={() => setOpenStatusModal(false)}
        >
          <div className="statusModalCloseWrapper">
            <CloseIcon className="statusModalCloseIcon" />
          </div>
          <div className="modalWrapper">{renderButtons()}</div>
        </Dialog>
      </div>
    )
  }

  return (
    <>
      <div data-status={currentState} />
      {renderContent()}
    </>
  )
}

export default AppliedOfferStatusBar
