import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import SelectChip from '../../../../../components/FormsLayout/Fields/SelectChip'
// import Select from '../../../../../components/FormsLayout/Fields/Select'
// import StandardInput from '../../../../../components/FormsLayout/Fields/StandardInput'
import {
  handleDeleteChip,
  handleChange
} from '../../../../../components/FormsLayout/handleFunctions'

const FormFields = props => {
  const { formFields } = props
  const { soft_skill_ids = null } = formFields

  const [formValues, setFormValues] = useState({
    [soft_skill_ids.name]: soft_skill_ids.current_value || []
  })

  const inputClassname = 'my-30 animated fadeIn'

  const softSkillIDsField = useMemo(
    () => (
      <Col key={soft_skill_ids.name} className={inputClassname} xs={12} lg={12}>
        <SelectChip
          inputValue={formValues[soft_skill_ids.name]}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={soft_skill_ids.name}
          label={soft_skill_ids.label}
          selectOptions={soft_skill_ids.values}
          isMultiple
        />
      </Col>
    ),
    [formValues[soft_skill_ids.name]]
  )

  // const controlledInputsClassname =
  //  'animated fadeIn controlledInputs inputField mt-20'

  return <Row className="HT__FormGenerator">{softSkillIDsField}</Row>
}

export default FormFields

FormFields.propTypes = {
  formFields: PropTypes.shape({
    soft_skill_ids: PropTypes.object,
    range_type: PropTypes.object,
    from: PropTypes.object,
    to: PropTypes.object,
    currency_id: PropTypes.object,
    salary_period_id: PropTypes.object,
    available_work_day_ids: PropTypes.object,
    working_day_ids: PropTypes.object
  }).isRequired
}
