import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import StandardInput from '../../../../../components/FormsLayout/Fields/StandardInput'
import { handleChange } from '../../../../../components/FormsLayout/handleFunctions'

const FormFields = ({ formFields }) => {
  const { description = null } = formFields

  const [formValues, setFormValues] = useState({
    [description.name]: description.current_value || ''
  })

  const inputClassname = 'my-30 animated fadeIn inputField'

  const descriptionField = useMemo(
    () => (
      <Col key={description.name} className={inputClassname} xs={12} lg={12}>
        <StandardInput
          inputValue={formValues[description.name]}
          inputName={description.name}
          handleChange={handleChange(formValues, setFormValues)}
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
  formFields: PropTypes.shape({
    description: PropTypes.object
  }).isRequired
}
