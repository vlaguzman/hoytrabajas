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
  const {
    soft_skill_ids = null,
    technical_skills = null
  } = formFields

  const setDefaultRowIDs = defaultValue => {
    if (defaultValue && defaultValue.length > 0) {
      return defaultValue.map(rowContent => ({
        ...rowContent,
        rowID: uuidv4()
      }))
    }
    return [
      {
        rowID: uuidv4(),
        job_category_id: '',
        technical_skill_id: '',
        level_id: ''
      }
    ]
  }

  const [formValues, setFormValues] = useState({
    [soft_skill_ids.name]: soft_skill_ids.current_value || [],
    [technical_skills.name]: setDefaultRowIDs(technical_skills.current_values)
  })

  console.log(formValues[technical_skills.name])

  const addRow = ({ rowName }) => {
    const newTechnicalSkill = {
      rowID: uuidv4(),
      job_category_id: '',
      technical_skill_id: '',
      level_id: ''
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
        {formValues[technical_skills.name].map(
          (technicalSkillObject, index) => (
            <Col
              key={technicalSkillObject.rowID}
              className={inputClassname}
              xs={12}
              style={{ margin: '20px 0', padding: '0 20px' }}
            >
              <>
                { technical_skills.field_keys.map(fieldKey => (
                  <input
                    key={uuidv4()}
                    type="hidden"
                    name={railsFieldNameBuilder(
                      technical_skills.form_keys,
                      fieldKey,
                      index
                    )}
                    value={
                      (formValues[technical_skills.name].length > 0)
                      ? formValues[technical_skills.name][index][fieldKey]
                      : null
                    }
                  />
                ))}
              </>
              <StyledRow style={{ height: '55px' }}>
                <FormRow
                  allRows={formValues[technical_skills.name]}
                  rowName={technical_skills.name}
                  currentRow={technicalSkillObject}
                  addRow={addRow}
                  removeRow={removeRow}
                  updateAllRows={updateAllRows}
                >
                  {({ rowValue, handleRowChanges, handleRowDeleteChip }) => (
                    <>
                      <StyledCol xs={12} lg={4}>
                        <SelectChip
                          name="job_category_id"
                          inputValue={rowValue.job_category_id}
                          handleChange={handleRowChanges}
                          handleDeleteChip={handleRowDeleteChip}
                          selectOptions={
                            technical_skills.list_values.job_category_id
                          }
                        />
                      </StyledCol>

                      <StyledCol xs={12} lg={3}>
                        <SelectChip
                          name="technical_skill_id"
                          inputValue={rowValue.technical_skill_id}
                          handleChange={handleRowChanges}
                          handleDeleteChip={handleRowDeleteChip}
                          selectOptions={
                            technical_skills.list_values
                              .technical_skill_id
                          }
                        />
                      </StyledCol>

                      <StyledCol xs={12} lg={3}>
                        <SelectChip
                          name="level_id"
                          inputValue={rowValue.level_id}
                          handleChange={handleRowChanges}
                          handleDeleteChip={handleRowDeleteChip}
                          selectOptions={
                            technical_skills.list_values.level_id
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
    [formValues[technical_skills.name]]
  )

  return (
    <Row className="HT__FormGenerator">
      {softSkillIDsField}
      <label>{technical_skills.main_label}</label>
      {techicalSkillsRows}
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  formFields: PropTypes.shape({
    soft_skill_ids: PropTypes.object,
    tecnical_skills_example: PropTypes.object
  })
}
