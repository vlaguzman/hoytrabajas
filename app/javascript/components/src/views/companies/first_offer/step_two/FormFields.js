import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import StandardInput from '../../../../components/FormsLayout/Fields/StandardInput'

const FormFields = props => {
  const { formFields, type } = props
  const { description = null } = formFields

  const [formValues, setFormValues] = useState({
    [description.name]: ''
  })

  const handleChange = (e, inputName, isMultiple = false) => {
    e.persist()
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

  const inputClassname = 'my-30 animated fadeIn'

  const descriptionField = useMemo(
    () => (
      <Col key={description.name} className={inputClassname} xs={12} lg={12}>
        <StandardInput
          isTextArea
          inputValue={formValues[description.name]}
          inputName={description.name}
          handleChange={handleChange}
          name={description.name}
          label={description.label}
        />
      </Col>
    ),
    [formValues[description.name]]
  )

  return <Row className="HT__FormGenerator">{descriptionField}</Row>
}

export default FormFields

FormFields.propTypes = {
  type: PropTypes.oneOf(['user', 'company']),
  formFields: PropTypes.shape({
    description: PropTypes.object
  }).isRequired
}
