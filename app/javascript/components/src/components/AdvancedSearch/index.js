import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import Popper from '@material-ui/core/Popper'
import MenuIcon from '@material-ui/icons/Menu'
import CloseIcon from '@material-ui/icons/Close'
import IconButton from '@material-ui/core/IconButton'
import Fields from './Fields'

const temporaryFields = {
  city: {
    name: 'city',
    multiple: true,
    values: [
      {
        id: 23,
        description: 'Bogotá'
      },
      {
        id: 24,
        description: 'Medellín'
      },
      {
        id: 25,
        description: 'Antioquia'
      }
    ]
  },
  experience: {
    name: 'experience',
    multiple: true,
    values: [
      {
        id: 233,
        description: 'Gestión administrativa'
      },
      {
        id: 2445,
        description: 'Ventas'
      },
      {
        id: 23435,
        description: 'Operario'
      },
      {
        id: 25535,
        description: 'Tecnología y programación'
      },
      {
        id: 3343435,
        description: 'Cocina, bar y meseros'
      },
      {
        id: 35536,
        description: 'Belleza, bienestar y salud'
      },
      {
        id: 353538,
        description: 'Servicios generales y limpieza'
      },
      {
        id: 3532521,
        description: 'Construcción y mantenimiento'
      },
      {
        id: 34324320,
        description: 'Eventos y protocolo'
      }
    ]
  },
  age: {
    name: 'age',
    values: [
      {
        id: 1,
        description: '18-25'
      },
      {
        id: 2,
        description: '26-40'
      },
      {
        id: 3,
        description: '41+'
      }
    ]
  },
  job_category: {
    name: 'job_category',
    values: []
  },
  work_mode: {
    name: 'work_mode',
    values: []
  },
  legal_agreement: {
    name: 'legal_agreement',
    values: []
  },
  offer_type: {
    name: 'offer_type',
    values: []
  },
  working_days: {
    name: 'working_days',
    values: []
  },
  working_hours: {
    name: 'working_hours',
    values: []
  },
  offer_aux: {
    name: 'offer_aux',
    values: []
  },
  offer_salary: {
    name: 'offer_salary',
    values: []
  },
  offer_date: {
    name: 'offer_date',
    values: []
  },
  offer_language: {
    name: 'offer_language',
    values: []
  }
}

const AdvancedSearch = ({
  open,
  onClose,
  translations,
  formFields = temporaryFields,
  responsive = false
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
    working_hours = null,
    offer_aux = null,
    offer_salary = null,
    offer_date = null,
    offer_language = null
  } = formFields

  const defaultValues = {
    [city.name]: [],
    [experience.name]: [],
    [age.name]: [],
    [job_category.name]: [],
    [work_mode.name]: [],
    [legal_agreement.name]: [],
    [offer_type.name]: [],
    [working_days.name]: [],
    [working_hours.name]: [],
    [offer_aux.name]: [],
    [offer_salary.name]: [],
    [offer_date.name]: [],
    [offer_language.name]: []
  }

  const [formValues, setFormValues] = useState(defaultValues)

  const handleClean = () => setFormValues(defaultValues)

  useEffect(() => {
    if (open) {
      document.body.style.overflowY = 'scroll'
      document.body.style.position = 'fixed'
    } else {
      document.body.removeAttribute('style')
    }
    return () => document.body.removeAttribute('style')
  }, [open])

  return (
    <Popper
      style={{ backgroundColor: '#F5F5F5' }}
      onClose={onClose}
      open={open}
      className={`m-advancedSearch ${
        responsive
          ? 'm-advancedSearch--responsive'
          : 'm-advancedSearch--desktop'
      }`}
    >
      <form className="advancedSearch__form" action="/">
        <div className="advancedSearch__topBar">
          <div className="advancedSearch__container advancedSearch__responsiveContainer d-flex">
            <div className="advancedSearch__titleWrapper">
              <MenuIcon />
              <h6 className="advancedSearch__title">{translations.title}</h6>
            </div>
            <div className="advancedSearch__optionsWrapper">
              <button
                type="button"
                className="a-button advancedSearch__cleanSearch"
                onClick={handleClean}
              >
                {translations.clean_search}
              </button>
              <button
                type="submit"
                className="a-button --primary advancedSearch__searchOffer"
              >
                {translations.search_offer}
              </button>
              <IconButton
                className="advancedSearch__closeButton"
                onClick={onClose}
              >
                <CloseIcon />
              </IconButton>
            </div>
            <div className="advancedSearch__searchBar w-100">
              <input
                type="text"
                name="q[title_cont]"
                placeholder={translations.search_offer_input}
                className="advancedSearch__searchInput"
              />
            </div>
          </div>
        </div>
        <div className="advancedSearch__content">
          <div className="advancedSearch__container">
            <Fields
              formValues={formValues}
              setFormValues={setFormValues}
              formFields={formFields}
              translations={translations.fields}
            />
          </div>
        </div>
      </form>
    </Popper>
  )
}

AdvancedSearch.propTypes = {
  open: PropTypes.bool.isRequired,
  onClose: PropTypes.func.isRequired,
  translations: PropTypes.object.isRequired,
  formFields: PropTypes.object.isRequired,
  responsive: PropTypes.bool
}

export default AdvancedSearch
