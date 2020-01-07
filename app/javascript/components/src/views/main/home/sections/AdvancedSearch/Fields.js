import React, { useState } from 'react'
import PropTypes from 'prop-types'
import Popper from '@material-ui/core/Popper'
import DropdownContent from './DropdownContent'
import useWindowSize from '../../../../../hooks/useWindowSize'

const SingleField = ({
  translations,
  name,
  inputValue,
  handleOpenDropdown,
  openDropdown,
  field,
  currentValues,
  setFormValues,
  handleClose,
  windowSize
}) => {
  return (
    <div
      className={`advancedSearch__field ${
        openDropdown === name ? 'opened' : ''
      }`}
    >
      <input type="hidden" name={name} value={inputValue} />
      <button
        type="button"
        name={name}
        onClick={handleOpenDropdown}
        className={`advancedSearch__label ${
          openDropdown === name ? 'opened' : ''
        }`}
      >
        {translations['label']}
      </button>
      <button
        type="button"
        className={`advancedSearch__inputField ${
          openDropdown === name ? 'opened' : ''
        }`}
        name={name}
        onClick={handleOpenDropdown}
      >
        {translations['placeholder']}
      </button>
      {openDropdown === name && windowSize.width <= 992 && (
        <DropdownContent
          field={field}
          currentValues={currentValues}
          setFormValues={setFormValues}
          handleClose={handleClose}
          disableClickAway
          className="advancedSearch__dropdownResponsive"
        />
      )}
    </div>
  )
}

SingleField.propTypes = {
  translations: PropTypes.object.isRequired,
  name: PropTypes.string.isRequired,
  inputValue: PropTypes.object.isRequired,
  handleOpenDropdown: PropTypes.func.isRequired,
  openDropdown: PropTypes.func.isRequired,
  field: PropTypes.object,
  currentValues: PropTypes.object,
  setFormValues: PropTypes.func.isRequired,
  handleClose: PropTypes.func.isRequired,
  windowSize: PropTypes.object
}

const AdvancedSearchFields = ({
  translations,
  formValues,
  setFormValues,
  formFields
}) => {
  const {
    city = null,
    experience = null,
    age = null,
    job_category = null,
    work_mode = null,
    legal_agreement = null,
    offer_type = null,
    working_days = null,
    working_hours = null
  } = formFields
  const [anchorEl, setAnchorEl] = useState(null)
  const [openDropdown, setOpenDropdown] = useState(null)
  const windowSize = useWindowSize()

  const handleClose = e => {
    if (!e || !e.target.name) {
      setAnchorEl(null)
      setOpenDropdown(null)
    }
  }

  const handleOpenDropdown = event => {
    const { name } = event.target
    if (name === openDropdown) {
      handleClose()
    } else {
      setAnchorEl(event.currentTarget)
      setOpenDropdown(name)
    }
  }

  const secondGrid = [
    city,
    experience,
    age,
    job_category,
    work_mode,
    legal_agreement,
    offer_type,
    working_days,
    working_hours
  ]

  return (
    <>
      <div className="advancedSearch__fieldsGrid publishDate">
        <SingleField
          translations={translations['publish_date']}
          name="publish_date"
          inputValue={formValues['publish_date']}
          handleOpenDropdown={handleOpenDropdown}
          openDropdown={openDropdown}
          field={formFields[openDropdown]}
          currentValues={formValues[openDropdown]}
          setFormValues={setFormValues}
          handleClose={handleClose}
          windowSize={windowSize}
        />
        <div className="advancedSearch__emptyMD" />
        <div className="advancedSearch__emptyMD" />
        {secondGrid.map(field => (
          <SingleField
            key={field.name}
            translations={translations[field.name]}
            name={field.name}
            inputValue={formValues[field.name]}
            handleOpenDropdown={handleOpenDropdown}
            openDropdown={openDropdown}
            field={formFields[openDropdown]}
            currentValues={formValues[openDropdown]}
            setFormValues={setFormValues}
            handleClose={handleClose}
            windowSize={windowSize}
          />
        ))}
        <SingleField
          translations={translations['offer_aux']}
          name="offer_aux"
          inputValue={formValues['offer_aux']}
          handleOpenDropdown={handleOpenDropdown}
          openDropdown={openDropdown}
          field={formFields[openDropdown]}
          currentValues={formValues[openDropdown]}
          setFormValues={setFormValues}
          handleClose={handleClose}
          windowSize={windowSize}
        />
        <div className="advancedSearch__flexContainer">
          <div className="advancedSearch__offerSalary">
            <SingleField
              translations={translations['offer_salary']}
              name="offer_salary"
              inputValue={formValues['offer_salary']}
              handleOpenDropdown={handleOpenDropdown}
              openDropdown={openDropdown}
              field={formFields[openDropdown]}
              currentValues={formValues[openDropdown]}
              setFormValues={setFormValues}
              handleClose={handleClose}
              windowSize={windowSize}
            />
          </div>
          <div className="advancedSearch__offerDate">
            <SingleField
              translations={translations['offer_date']}
              name="offer_date"
              inputValue={formValues['offer_date']}
              handleOpenDropdown={handleOpenDropdown}
              openDropdown={openDropdown}
              field={formFields[openDropdown]}
              currentValues={formValues[openDropdown]}
              setFormValues={setFormValues}
              handleClose={handleClose}
              windowSize={windowSize}
            />
          </div>
        </div>
        <SingleField
          translations={translations['offer_language']}
          name="offer_language"
          inputValue={formValues['offer_language']}
          handleOpenDropdown={handleOpenDropdown}
          openDropdown={openDropdown}
          field={formFields[openDropdown]}
          currentValues={formValues[openDropdown]}
          setFormValues={setFormValues}
          handleClose={handleClose}
          windowSize={windowSize}
        />
      </div>
      {windowSize && windowSize.width > 992 && (
        <Popper
          anchorEl={anchorEl}
          open={!!anchorEl}
          onClose={handleClose}
          disablePortal
          placement="bottom-start"
          modifiers={{
            computeStyle: {
              gpuAcceleration: false
            }
          }}
        >
          <DropdownContent
            field={formFields[openDropdown]}
            currentValues={formValues[openDropdown]}
            setFormValues={setFormValues}
            handleClose={handleClose}
          />
        </Popper>
      )}
    </>
  )
}

AdvancedSearchFields.propTypes = {
  translations: PropTypes.object.isRequired,
  formValues: PropTypes.object.isRequired,
  setFormValues: PropTypes.func.isRequired,
  formFields: PropTypes.object.isRequired
}

export default AdvancedSearchFields
