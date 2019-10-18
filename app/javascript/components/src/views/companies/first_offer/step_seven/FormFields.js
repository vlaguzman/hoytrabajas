import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import Paper from '@material-ui/core/Paper'
import styled from 'styled-components'
import Select from '../../../../components/FormsLayout/Fields/Select'
import SelectChip from '../../../../components/FormsLayout/Fields/SelectChip'
import StandardInput from '../../../../components/FormsLayout/Fields/StandardInput'

const StyledRow = styled(Row)`
  width: 100%;
  flex: 1 1 0%;
  display: flex;
  align-items: center;
  margin: 0px;
`

const StyledCol = styled(Col)`
  display: flex;
  align-items: center;
  margin: 0px;
`

const FormFields = props => {
  const { formFields, type } = props
  const {
    offer_location = null,
    offer_education = null,
    offer_experience_number = null,
    offer_experience_unit = null,
    offer_skills_ids = null,
    offer_skills_level = null,
    offer_languages_id = null,
    offer_languages_level = null
  } = formFields

  const [formValues, setFormValues] = useState({
    [offer_location.name]: offer_location.current_value || '',
    [offer_education.name]: offer_education.current_value || '',
    [offer_experience_number.name]: offer_experience_number.current_value || '',
    [offer_experience_unit.name]: offer_experience_unit.current_value || '',
    [offer_skills_ids.name]: offer_skills_ids.current_value || '',
    [offer_skills_level.name]: offer_skills_level.current_value || '',
    [offer_languages_id.name]: offer_languages_id.current_value || '',
    [offer_languages_level.name]: offer_languages_level.current_value || ''
  })

  const handleChange = (e, inputName, isMultiple = false) => {
    if (e.persist) e.persist()
    if (isMultiple) {
      const isArray = Array.isArray(formValues[inputName])
      if (isArray) {
        const arrayHasItem = formValues[inputName].includes(e.target.value)
        if (!arrayHasItem) {
          const merged = [...formValues[inputName], e.target.value]
          setFormValues(prevFormValues => ({
            ...prevFormValues,
            [inputName]: merged
          }))
        }
      } else {
        setFormValues(prevFormValues => ({
          ...prevFormValues,
          [inputName]: [e.target.value]
        }))
      }
    } else {
      setFormValues(prevFormValues => ({
        ...prevFormValues,
        [inputName]: e.target.value
      }))
    }
  }

  const handleDeleteChip = (id, inputName, isMultiple) => {
    if (isMultiple) {
      const newChips = [...formValues[inputName]]
      newChips.splice(newChips.indexOf(id), 1)
      setFormValues(prevFormValues => ({
        ...prevFormValues,
        [inputName]: newChips
      }))
    } else {
      setFormValues(prevFormValues => ({
        ...prevFormValues,
        [inputName]: ''
      }))
    }
  }

  const inputClassname = 'my-30 animated fadeIn inputField'

  const inputStyles = {
    width: `100%`,
    flex: 1,
    display: 'flex',
    alignItems: 'center',
    margin: 0
  }

  const offerLocationField = useMemo(
    () => (
      <Col className={inputClassname} xs={12}>
        <Paper className="SimpleRowWrapper" style={{ padding: '20px' }}>
          <StyledRow>
            <StyledCol>
              {offer_location.beforeLabel && offer_location.beforeLabel}
              <SelectChip
                inputValue={formValues[offer_location.name]}
                handleChange={handleChange}
                handleDeleteChip={handleDeleteChip}
                name={offer_location.name}
                selectOptions={offer_location.values}
                isRequired={offer_location.isRequired || false}
                isMultiple={offer_location.isMultiple || false}
                formControlStyle={inputStyles}
              />
              {offer_location.afterLabel && offer_location.afterLabel}
            </StyledCol>
          </StyledRow>
        </Paper>
      </Col>
    ),
    [formValues[offer_location.name]]
  )

  return <Row className="HT__FormGenerator StepSeven">{offerLocationField}</Row>
}

export default FormFields

FormFields.propTypes = {
  type: PropTypes.oneOf(['user', 'company']),
  formFields: PropTypes.shape({
    offer_location: PropTypes.object,
    offer_education: PropTypes.object,
    offer_experience_number: PropTypes.object,
    offer_experience_unit: PropTypes.object,
    offer_skills_ids: PropTypes.object,
    offer_skills_level: PropTypes.object,
    offer_languages_id: PropTypes.object,
    offer_languages_level: PropTypes.object
  }).isRequired
}
