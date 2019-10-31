import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import SelectChip from '../../../../../components/FormsLayout/Fields/SelectChip'
import Select from '../../../../../components/FormsLayout/Fields/Select'
import StandardInput from '../../../../../components/FormsLayout/Fields/StandardInput'
import {
  handleDeleteChip,
  handleChange
} from '../../../../../components/FormsLayout/handleFunctions'

const FormFields = props => {
  const { formFields } = props
  const {
    job_category_id = null,
    language_id = null,
    level_id = null,
    soft_skill_ids = null,
    technical_skill_id = null
  } = formFields

/*   const [formValues, setFormValues] = useState({
    [range_type.name]: 1,
    [from.name]: '',
    [to.name]: '',
    [currency_id.name]: '',
    [salary_period_id.name]: '',
    [available_work_day_ids.name]: '',
    [working_day_ids.name]: ''
  }) */

  const inputClassname = 'my-30 animated fadeIn'


  const controlledInputsClassname =
  'animated fadeIn controlledInputs inputField mt-20'

  return (
    <Row className="HT__FormGenerator">
      {}
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  formFields: PropTypes.shape({
    range_type: PropTypes.object,
    from: PropTypes.object,
    to: PropTypes.object,
    currency_id: PropTypes.object,
    salary_period_id: PropTypes.object,
    available_work_day_ids: PropTypes.object,
    working_day_ids: PropTypes.object
  }).isRequired
}
