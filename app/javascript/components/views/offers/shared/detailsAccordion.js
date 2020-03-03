import React, { useState } from 'react'
import PropTypes from 'prop-types'

import KeyboardArrowDownIcon from '@material-ui/icons/KeyboardArrowDown'
import KeyboardArrowUpIcon from '@material-ui/icons/KeyboardArrowUp'

const DetailsAccordion = ({ title, details, requirements }) => {
  const [hiddenPanel, setHiddenPanel] = useState(true)

  const handleOnClick = () => {
    setHiddenPanel(!hiddenPanel)
  }

  const list = [...details, ...requirements]

  const listIterator = listElements =>
    listElements.map(element => (
      <div className="m-detail">
        <div className="a-labelBox">{element.label}</div>
        <div className="a-spanBox">{element.value}</div>
      </div>
    ))

  return (
    <>
      <button
        type="button"
        onClick={handleOnClick}
        className="m-accordionButton detailTitle"
      >
        {title}
        {hiddenPanel ? <KeyboardArrowDownIcon /> : <KeyboardArrowUpIcon />}
      </button>
      <div
        className={`__panel m-detailsList ${
          hiddenPanel ? 'hiddenElement' : ''
        }`}
      >
        {listIterator(list)}
      </div>
    </>
  )
}

DetailsAccordion.propTypes = {
  title: PropTypes.string.isRequired,
  details: PropTypes.array,
  requirements: PropTypes.array
}

export default DetailsAccordion
