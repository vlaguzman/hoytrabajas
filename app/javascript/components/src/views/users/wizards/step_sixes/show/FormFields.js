import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import uuidv4 from 'uuid/v4'
import Paper from '@material-ui/core/Paper'
import styled from 'styled-components'

import SelectChip from '../../../../../components/FormsLayout/Fields/SelectChip'
import FormRow from '../../../../../components/FormsLayout/Fields/FormRow'
import {
  handleDeleteChip,
  handleChange
} from '../../../../../components/FormsLayout/handleFunctions'

const StyledRow = styled(Row)`
  width: 100%;
  flex: 1 1 0%;
  display: flex;
  margin: 0px;
`

const StyledCol = styled(Col)`
  display: flex;
  align-items: flex-end;
  margin: ${props => (props.marginAuto ? 'auto 0' : 0)};

  & .MuiFormControl-root {
    flex: 1;
  }
`
const FormFields = props => {
  const { formFields } = props
  const { soft_skill_ids = null } = formFields

  const tecnical_skills_example = {
    name: 'technical_skills',
    form_keys: ['curriculum_vitae', 'tecnical_sills'],
    field_keys: ['job_category_id', 'technical_skill_id', 'level_id'],
    main_label: 'Define técnicas de acuerdo a tu perfil*',
    list_values: {
      job_category_id: [
        { description: 'job 1', id: 1 },
        { description: 'job 2', id: 2 },
        { description: 'job 3', id: 3 }
      ],
      technical_skill_id: [
        { description: 'techskil 1', id: 1 },
        { description: 'techskil 2', id: 2 },
        { description: 'techskil 3', id: 3 }
      ],
      level_id: [
        { description: 'levl 1', id: 1 },
        { description: 'levl 2', id: 2 },
        { description: 'levl 3', id: 3 }
      ]
    },
    current_values: [
      {
        job_category_id: {
          current_value: 1
        },
        technical_skill_id: {
          current_value: 1
        },
        level_id: {
          current_value: 1
        }
      },
      {
        job_category_id: {
          current_value: 1
        },
        technical_skill_id: {
          current_value: 2
        },
        level_id: {
          current_value: 3
        }
      },
      {
        job_category_id: {
          current_value: 3
        },
        technical_skill_id: {
          current_value: 3
        },
        level_id: {
          current_value: 3
        }
      }
    ]
  }

  const setDefaultRowIDs = defaultValue => {
    if (defaultValue && defaultValue.length > 0) {
      return defaultValue.map(rowContent => ({
        ...rowContent,
        rowID: uuidv4()
      }))
    }
    return [
      {
        rowID: uuidv4()
      }
    ]
  }

  const [formValues, setFormValues] = useState({
    [soft_skill_ids.name]: soft_skill_ids.current_value || [],
    [tecnical_skills_example.name]:
      setDefaultRowIDs(tecnical_skills_example.current_values) || []
  })

  const addRow = ({ rowName }) => {
    const newTechnicalSkill = {
      rowID: uuidv4(),
      job_category_id: { current_value: null },
      technical_skill_id: { current_value: null },
      level_id: { current_value: null }
    }
    const merged = [...formValues[rowName], newTechnicalSkill]
    setFormValues(prevFormValues => ({ ...prevFormValues, [rowName]: merged }))
  }

  const removeRow = ({ rowName, rowID }) => {
    if (formValues[rowName].length > 1) {
      const filteredRows = formValues[rowName].filter(
        row => row.rowID !== rowID
      )
      setFormValues(prevFormValues => ({
        ...prevFormValues,
        [rowName]: filteredRows
      }))
    }
  }

  const updateAllRows = ({ updatedRow, rowName, rowID }) => {
    const currentRows = formValues[rowName]
    const rowIndex = currentRows.findIndex(row => row.rowID === rowID)

    if (rowIndex !== -1) {
      const newRows = [...currentRows]
      newRows[rowIndex] = updatedRow
      setFormValues(prevFormValues => ({
        ...prevFormValues,
        [rowName]: newRows
      }))
    }
  }

  const railsFieldNameBuilder = (formKey, fieldKey, index = 0) => {
    const principalFormKey = formKey[0]
    const formSecuence = formKey.map(key => `[${key}]`).join('')
    return `${principalFormKey}${formSecuence}[${index}][${fieldKey}]`
  }

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

  const techicalSkillsRows = useMemo(
    () => (
      <Paper className="FormRowWrapper">
        {formValues[tecnical_skills_example.name].map(
          (technicalSkill, index) => (
            <Col
              key={technicalSkill.rowID}
              className={inputClassname}
              xs={12}
              style={{ margin: '20px 0', padding: '0 20px' }}
            >
              <>
                {tecnical_skills_example.field_keys.map(fieldKey => (
                  <input
                    key={uuidv4()}
                    type="hidden"
                    name={railsFieldNameBuilder(
                      tecnical_skills_example.form_keys,
                      fieldKey,
                      index
                    )}
                    value={
                      formValues[tecnical_skills_example.name][index][fieldKey]
                        .current_value || ''
                    }
                  />
                ))}
              </>
              <StyledRow style={{ height: '55px' }}>
                <FormRow
                  allRows={formValues[tecnical_skills_example.name]}
                  rowName={tecnical_skills_example.name}
                  currentRow={technicalSkill}
                  addRow={addRow}
                  removeRow={removeRow}
                  updateAllRows={updateAllRows}
                >
                  {({ rowValue, handleRowChanges, handleRowDeleteChip }) => (
                    <>
                      <StyledCol xs={12} lg={4}>
                        <SelectChip
                          name="select-job_category_id"
                          inputValue={
                            rowValue.job_category_id
                              ? rowValue.job_category_id.current_value
                              : ''
                          }
                          handleChange={handleRowChanges}
                          handleDeleteChip={handleRowDeleteChip}
                          selectOptions={
                            tecnical_skills_example.list_values.job_category_id
                          }
                        />
                      </StyledCol>

                      <StyledCol xs={12} lg={3}>
                        <SelectChip
                          name="select-technical_skill_id"
                          inputValue={
                            rowValue.technical_skill_id
                              ? rowValue.technical_skill_id.current_value
                              : ''
                          }
                          handleChange={handleRowChanges}
                          handleDeleteChip={handleRowDeleteChip}
                          selectOptions={
                            tecnical_skills_example.list_values
                              .technical_skill_id
                          }
                        />
                      </StyledCol>

                      <StyledCol xs={12} lg={3}>
                        <SelectChip
                          name="select-level_id"
                          inputValue={
                            rowValue.level_id
                              ? rowValue.level_id.current_value
                              : ''
                          }
                          handleChange={handleRowChanges}
                          handleDeleteChip={handleRowDeleteChip}
                          selectOptions={
                            tecnical_skills_example.list_values.level_id
                          }
                        />
                      </StyledCol>
                    </>
                  )}
                </FormRow>
              </StyledRow>
            </Col>
          )
        )}
      </Paper>
    ),
    [formValues[tecnical_skills_example.name]]
  )

  return (
    <Row className="HT__FormGenerator">
      {softSkillIDsField}
      {techicalSkillsRows}
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  formFields: PropTypes.shape({
    soft_skill_ids: PropTypes.object
    // range_type: PropTypes.object,
    // from: PropTypes.object,
    // to: PropTypes.object,
    // currency_id: PropTypes.object,
    // salary_period_id: PropTypes.object,
    // available_work_day_ids: PropTypes.object,
    // working_day_ids: PropTypes.object
  })
}
