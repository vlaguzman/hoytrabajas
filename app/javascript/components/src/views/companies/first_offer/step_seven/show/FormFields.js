import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import uuidv4 from 'uuid/v4'
import Paper from '@material-ui/core/Paper'
import styled from 'styled-components'

import SelectChip from '../../../../../components/FormsLayout/Fields/SelectChip'
import FormRow from '../../../../../components/FormsLayout/Fields/FormRow'
import Checkbox from '../../../../../components/FormsLayout/Fields/Checkbox'
import StandardInput from '../../../../../components/FormsLayout/Fields/StandardInput'

import {
  handleDeleteChip,
  handleChange,
  handleBoolean
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

const BeforeLabel = styled.span`
  margin: ${props => (props.marginAuto ? `auto 20px auto 0` : `0 20px 0 0`)};
`

const AfterLabel = styled.span`
  margin: ${props => (props.marginAuto ? `auto 0 auto 20px` : `0 0 0 20px`)};
`

const FormFields = props => {
  const { formFields } = props
  const {
    city_id = null,
    educational_degree_id = null,
    duration = null,
    duration_type_id = null,
    required_experience = null,
    technical_skills = null,
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
        city_id: '',
        educational_degree_id: '',
        duration: '',
        duration_type_id: '',
        required_experience: '',
        technical_skill_id: '',
        language_id: '',
        level_id: ''
      }
    ]
  }

  const [formValues, setFormValues] = useState({
    [city_id.name]: city_id.current_value || '',
    [educational_degree_id.name]: educational_degree_id.current_value || '',
    [duration.name]: duration.current_value || '',
    [duration_type_id.name]: duration_type_id.current_value || '',
    [required_experience.name]: required_experience.current_value || false,
    [technical_skills.name]: setDefaultRowIDs(technical_skills.current_values) || [],
    [languages.name]: setDefaultRowIDs(languages.current_values) || []
  })

  const addRow = ({ rowName }) => {
    const newTechnicalSkill = {
      rowID: uuidv4(),
      city_id: '',
      educational_degree_id: '',
      duration: '',
      duration_type_id: '',
      required_experience: '',
      technical_skill_id: '',
      language_id: '',
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

  const railsFieldNameBuilder = (formKeys, fieldKey) => {
    const principalFormKey = formKeys[0]
    const formSecuence = formKeys
      .slice(1, formKeys.leght)
      .map(key => `[${key}]`)
      .join('')
    return `${principalFormKey}${formSecuence}[][${fieldKey}]`
  }

  const inputClassname = 'my-30 animated fadeIn inputField'

  const cityIdField = useMemo(
    () => (
      <Col className={`${inputClassname} p-0`} xs={12}>
        <Paper className="SimpleRowWrapper" style={{ padding: '20px' }}>
          <StyledRow>
            <StyledCol>
              <BeforeLabel>
                {city_id.label}
              </BeforeLabel>
              <SelectChip
                inputValue={formValues[city_id.name]}
                handleChange={handleChange(formValues, setFormValues)}
                handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
                name={city_id.name}
                selectOptions={city_id.values}
              />
            </StyledCol>
          </StyledRow>
        </Paper>
      </Col>
    ),
    [formValues[city_id.name]]
  )

  const educationalDegreeIdField = useMemo(
    () => (
      <Col className={`${inputClassname} p-0`} xs={12}>
        <Paper className="SimpleRowWrapper" style={{ padding: '20px' }}>
          <StyledRow>
            <StyledCol>
              <BeforeLabel>
                {educational_degree_id.label}
              </BeforeLabel>
              <SelectChip
                inputValue={formValues[educational_degree_id.name]}
                handleChange={handleChange(formValues, setFormValues)}
                handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
                name={educational_degree_id.name}
                selectOptions={educational_degree_id.values}
              />
            </StyledCol>
          </StyledRow>
        </Paper>
      </Col>
    ),
    [formValues[educational_degree_id.name]]
  )

  const experienceFields = useMemo(
    () => (
      <Col className={`${inputClassname} p-0`} xs={12}>
        <Paper className="SimpleRowWrapper" style={{ padding: '20px' }}>
          <StyledRow>
            <StyledCol xs={12} lg={4}>
              <BeforeLabel marginAuto>
                {duration.label}
              </BeforeLabel>
              <StandardInput
                inputValue={formValues[duration.name]}
                handleChange={handleChange(formValues, setFormValues)}
                name={duration.name}
                placeholder={duration.placeholder || 'ejem: 2'}
              />
            </StyledCol>
            <StyledCol xs={12} lg={4}>
              <SelectChip
                inputValue={formValues[duration_type_id.name]}
                handleChange={handleChange(formValues, setFormValues)}
                handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
                name={duration_type_id.name}
                selectOptions={duration_type_id.values}
              />
              <AfterLabel marginAuto>
                {duration_type_id.label}
              </AfterLabel>
            </StyledCol>
            <StyledCol xs={12} lg={4} marginAuto>
              <BeforeLabel marginAuto>
                {required_experience.label}
              </BeforeLabel>
              <Checkbox
                inputValue={formValues[required_experience.name]}
                handleBoolean={handleBoolean(setFormValues)}
                name={required_experience.name}
                description={required_experience.description}
              />
            </StyledCol>
          </StyledRow>
        </Paper>
      </Col>
    ),
    [
      formValues[duration.name],
      formValues[duration_type_id.name],
      formValues[required_experience.name]
    ]
  )

  const technicalSkillsRows = useMemo(
    () => (
      <Paper className="FormRowWrapper">
        {formValues[technical_skills.name].map((toLearnSkillObject, index) => (
          <Col
            key={toLearnSkillObject.rowID}
            className={`${inputClassname} p-0`}
            xs={12}
            style={{ margin: '20px 0', padding: '0 20px' }}
          >
            <>
              {technical_skills.field_keys.map(fieldKey => (
                <input
                  key={uuidv4()}
                  type="hidden"
                  name={railsFieldNameBuilder(technical_skills.form_keys, fieldKey)}
                  value={
                    formValues[technical_skills.name].length > 0
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
                currentRow={toLearnSkillObject}
                addRow={addRow}
                removeRow={removeRow}
                updateAllRows={updateAllRows}
              >
                {({ rowValue, handleRowChanges, handleRowDeleteChip }) => (
                  <>
                    <StyledCol xs={12} lg={4}>
                      <BeforeLabel marginAuto>
                        {technical_skills.main_label.skill}
                      </BeforeLabel>
                      <SelectChip
                        name="technical_skill_id"
                        inputValue={rowValue.technical_skill_id}
                        handleChange={handleRowChanges}
                        handleDeleteChip={handleRowDeleteChip}
                        selectOptions={technical_skills.list_values.technical_skill_id}
                      />
                    </StyledCol>

                    <StyledCol xs={12} lg={6}>
                      <BeforeLabel marginAuto>
                        {technical_skills.main_label.level}
                      </BeforeLabel>
                      <SelectChip
                        name="level_id"
                        inputValue={rowValue.level_id}
                        handleChange={handleRowChanges}
                        handleDeleteChip={handleRowDeleteChip}
                        selectOptions={technical_skills.list_values.level_id}
                      />
                    </StyledCol>
                  </>
                )}
              </FormRow>
            </StyledRow>
          </Col>
        ))}
      </Paper>
    ),
    [formValues[technical_skills.name]]
  )

  const languagesRows = useMemo(
    () => (
      <Paper className="FormRowWrapper">
        {formValues[languages.name].map((toLearnSkillObject, index) => (
          <Col
            key={toLearnSkillObject.rowID}
            className={`${inputClassname} p-0`}
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
            <StyledRow style={{ height: '55px' }}>
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
                      <BeforeLabel marginAuto>
                        {languages.main_label.language}
                      </BeforeLabel>
                      <SelectChip
                        name="language_id"
                        inputValue={rowValue.language_id}
                        handleChange={handleRowChanges}
                        handleDeleteChip={handleRowDeleteChip}
                        selectOptions={languages.list_values.language_id}
                      />
                    </StyledCol>

                    <StyledCol xs={12} lg={6}>
                      <BeforeLabel marginAuto>
                        {languages.main_label.level}
                      </BeforeLabel>
                      <SelectChip
                        name="level_id"
                        inputValue={rowValue.level_id}
                        handleChange={handleRowChanges}
                        handleDeleteChip={handleRowDeleteChip}
                        selectOptions={languages.list_values.level_id}
                      />
                    </StyledCol>
                  </>
                )}
              </FormRow>
            </StyledRow>
          </Col>
        ))}
      </Paper>
    ),
    [formValues[languages.name]]
  )

  return (
    <Row className="HT__FormGenerator StepSeven">
      {cityIdField}
      {educationalDegreeIdField}
      {experienceFields}
      {technicalSkillsRows}
      {languagesRows}
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  formFields: PropTypes.shape({
    city_id: PropTypes.object.isRequired,
    educational_degree_id: PropTypes.object.isRequired,
    duration: PropTypes.object.isRequired,
    duration_type_id: PropTypes.object.isRequired,
    required_experience: PropTypes.object,
    technical_skills: PropTypes.object.isRequired,
    languages: PropTypes.object.isRequired,
  }).isRequired
}
