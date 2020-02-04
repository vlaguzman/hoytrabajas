import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import uuidv4 from 'uuid/v4'
import Paper from '@material-ui/core/Paper'
import styled from 'styled-components'

import SelectChip from '../../../../../components/FormsLayout/Fields/SelectChip'
import FormRow from '../../../../../components/FormsLayout/Fields/FormRow'
import FormLabel from '../../../../../components/FormsLayout/FormLabel'
import SelectFindOrCreate from '../../../../../components/FormsLayout/Fields/SelectFindOrCreate'

import {
  handleDeleteChip,
  handleChange
} from '../../../../../components/FormsLayout/handleFunctions'

const StyledCol = styled(Col)`
  display: flex;
  align-items: flex-end;
  margin: ${props => (props.marginAuto ? 'auto 0' : 0)};

  @media only screen and (max-width: 576px) {
    margin-top: 20px;
  }

  & .MuiFormControl-root {
    flex: 1;
  }

  .MuiFormLabel-root.MuiInputLabel-shrink {
    position: relative;
  }
`
const FormFields = props => {
  const { formFields, placeholders, tooltip_description } = props
  const {
    soft_skill_ids = null,
    technical_skills = null,
    to_learn_skills = null,
    languages = null
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
        level_id: '',
        language_id: ''
      }
    ]
  }

  const [formValues, setFormValues] = useState({
    [soft_skill_ids.name]: soft_skill_ids.current_value || [],
    [technical_skills.name]:
      setDefaultRowIDs(technical_skills.current_values) || [],
    [to_learn_skills.name]:
      setDefaultRowIDs(to_learn_skills.current_values) || [],
    [languages.name]: setDefaultRowIDs(languages.current_values) || []
  })

  const addRow = ({ rowName }) => {
    const newTechnicalSkill = {
      rowID: uuidv4(),
      job_category_id: '',
      technical_skill_id: '',
      level_id: '',
      language_id: ''
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

  const railsFieldNameBuilder = (formKeys, fieldKey) => {
    const principalFormKey = formKeys[0]
    const formSecuence = formKeys
      .slice(1, formKeys.leght)
      .map(key => `[${key}]`)
      .join('')
    return `${principalFormKey}${formSecuence}[][${fieldKey}]`
  }

  const inputClassname = 'my-30 animated fadeIn inputField'

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
      <>
        {technical_skills.main_label && (
          <FormLabel>{technical_skills.main_label}</FormLabel>
        )}
        <Paper id="techicalSkillsRowsWrapper" className="FormRowWrapper">
          {formValues[technical_skills.name].map(
            (technicalSkillObject, index) => (
              <Col
                key={technicalSkillObject.rowID}
                className={inputClassname}
                xs={12}
                style={{ margin: '20px 0', padding: '0 20px' }}
              >
                <>
                  {technical_skills.field_keys.map(fieldKey => (
                    <input
                      key={uuidv4()}
                      type="hidden"
                      name={railsFieldNameBuilder(
                        technical_skills.form_keys,
                        fieldKey
                      )}
                      value={
                        formValues[technical_skills.name].length > 0
                          ? formValues[technical_skills.name][index][fieldKey]
                          : ''
                      }
                    />
                  ))}
                </>
                <div className="rowContainer">
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
                            label={placeholders['job_category_id']}
                            inputValue={rowValue.job_category_id}
                            handleChange={handleRowChanges}
                            handleDeleteChip={handleRowDeleteChip}
                            selectOptions={
                              technical_skills.list_values.job_category_id
                            }
                          />
                        </StyledCol>

                        <Col xs={12} lg={3}>
                          <SelectFindOrCreate
                            label={placeholders['technical_skill_description']}
                            name="technical_skill_description"
                            input_value={
                              rowValue['technical_skill_description']
                            }
                            test={rowValue}
                            options={
                              technical_skills.list_values
                                .technical_skill_description
                            }
                            tooltip_description={
                              tooltip_description['press_enter']
                            }
                            handleOnChange={handleRowChanges}
                          />
                        </Col>

                        <StyledCol xs={12} lg={3}>
                          <SelectChip
                            name="level_id"
                            label={placeholders['level_id']}
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
                </div>
              </Col>
            )
          )}
        </Paper>
      </>
    ),
    [formValues[technical_skills.name]]
  )

  const toLearnSkillsRows = useMemo(
    () => (
      <>
        {to_learn_skills.main_label && (
          <FormLabel>{to_learn_skills.main_label}</FormLabel>
        )}

        <Paper id="toLearnSkillsRowsWrapper" className="FormRowWrapper">
          {formValues[to_learn_skills.name].map((toLearnSkillObject, index) => (
            <Col
              key={toLearnSkillObject.rowID}
              className={inputClassname}
              xs={12}
              style={{ margin: '20px 0', padding: '0 20px' }}
            >
              <>
                {to_learn_skills.field_keys.map(fieldKey => (
                  <input
                    key={uuidv4()}
                    type="hidden"
                    name={railsFieldNameBuilder(
                      to_learn_skills.form_keys,
                      fieldKey
                    )}
                    value={
                      formValues[to_learn_skills.name].length > 0
                        ? formValues[to_learn_skills.name][index][fieldKey]
                        : null
                    }
                  />
                ))}
              </>
              <div className="rowContainer">
                <FormRow
                  allRows={formValues[to_learn_skills.name]}
                  rowName={to_learn_skills.name}
                  currentRow={toLearnSkillObject}
                  addRow={addRow}
                  removeRow={removeRow}
                  updateAllRows={updateAllRows}
                >
                  {({ rowValue, handleRowChanges, handleRowDeleteChip }) => (
                    <>
                      <StyledCol xs={12} lg={4}>
                        <SelectChip
                          name="job_category_id"
                          label={placeholders['job_category_id']}
                          inputValue={rowValue.job_category_id}
                          handleChange={handleRowChanges}
                          handleDeleteChip={handleRowDeleteChip}
                          selectOptions={
                            to_learn_skills.list_values.job_category_id
                          }
                        />
                      </StyledCol>

                      <Col xs={12} lg={6}>
                        <SelectFindOrCreate
                          label={placeholders['technical_skill_description']}
                          name="technical_skill_description"
                          input_value={rowValue['technical_skill_description']}
                          test={rowValue}
                          options={
                            to_learn_skills.list_values
                              .technical_skill_description
                          }
                          tooltip_description={
                            tooltip_description['press_enter']
                          }
                          handleOnChange={handleRowChanges}
                        />
                      </Col>
                    </>
                  )}
                </FormRow>
              </div>
            </Col>
          ))}
        </Paper>
      </>
    ),
    [formValues[to_learn_skills.name]]
  )

  const languagesRows = useMemo(
    () => (
      <>
        {languages.main_label && <FormLabel>{languages.main_label}</FormLabel>}

        <Paper id="languagesRowsWrapper" className="FormRowWrapper">
          {formValues[languages.name].map((toLearnSkillObject, index) => (
            <Col
              key={toLearnSkillObject.rowID}
              className={inputClassname}
              xs={12}
              style={{ margin: '20px 0', padding: '0 20px' }}
            >
              <>
                {languages.field_keys.map(fieldKey => (
                  <input
                    key={uuidv4()}
                    type="hidden"
                    name={railsFieldNameBuilder(languages.form_keys, fieldKey)}
                    value={
                      formValues[languages.name].length > 0
                        ? formValues[languages.name][index][fieldKey]
                        : null
                    }
                  />
                ))}
              </>
              <div className="rowContainer">
                <FormRow
                  allRows={formValues[languages.name]}
                  rowName={languages.name}
                  currentRow={toLearnSkillObject}
                  addRow={addRow}
                  removeRow={removeRow}
                  updateAllRows={updateAllRows}
                >
                  {({ rowValue, handleRowChanges, handleRowDeleteChip }) => (
                    <>
                      <StyledCol xs={12} lg={4}>
                        <SelectChip
                          name="language_id"
                          label={placeholders['language_id']}
                          inputValue={rowValue.language_id}
                          handleChange={handleRowChanges}
                          handleDeleteChip={handleRowDeleteChip}
                          selectOptions={languages.list_values.language_id}
                        />
                      </StyledCol>

                      <StyledCol xs={12} lg={6}>
                        <SelectChip
                          name="level_id"
                          label={placeholders['level_id']}
                          inputValue={rowValue.level_id}
                          handleChange={handleRowChanges}
                          handleDeleteChip={handleRowDeleteChip}
                          selectOptions={languages.list_values.level_id}
                        />
                      </StyledCol>
                    </>
                  )}
                </FormRow>
              </div>
            </Col>
          ))}
        </Paper>
      </>
    ),
    [formValues[languages.name]]
  )

  return (
    <Row className="HT__FormGenerator">
      {softSkillIDsField}
      {techicalSkillsRows}
      {toLearnSkillsRows}
      {languagesRows}
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  placeholders: PropTypes.object,
  tooltip_description: PropTypes.object,
  formFields: PropTypes.shape({
    soft_skill_ids: PropTypes.object,
    technical_skills: PropTypes.object,
    to_learn_skills: PropTypes.object,
    languages: PropTypes.object
  })
}
