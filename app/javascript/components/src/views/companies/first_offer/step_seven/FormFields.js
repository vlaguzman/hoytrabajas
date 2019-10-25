import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import uuidv4 from 'uuid/v4'
import { Row, Col } from 'reactstrap'
import Paper from '@material-ui/core/Paper'
import styled from 'styled-components'
import Checkbox from '../../../../components/FormsLayout/Fields/Checkbox'
import SelectChip from '../../../../components/FormsLayout/Fields/SelectChip'
import FormRow from '../../../../components/FormsLayout/Fields/FormRow'
import TextChip from '../../../../components/FormsLayout/Fields/TextChip'

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
    offer_location = null,
    offer_education = null,
    offer_experience_number = null,
    offer_experience_unit = null,
    offer_experience_boolean = null,
    offer_skills = null,
    offer_skills_ids = null,
    offer_skills_level_id = null,
    offer_languages = null,
    languages_id = null,
    languages_level_id = null
  } = formFields

  const rowsDefault = defaultValue => {
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
    [offer_location.name]: offer_location.current_value || '',
    [offer_education.name]: offer_education.current_value || '',
    [offer_experience_number.name]: offer_experience_number.current_value || '',
    [offer_experience_unit.name]: offer_experience_unit.current_value || '',
    [offer_experience_boolean.name]:
      offer_experience_boolean.current_value || false,
    [offer_skills.name]: rowsDefault(offer_skills.current_value) || [],
    [offer_languages.name]: rowsDefault(offer_languages.current_value) || []
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

  const addRow = ({ rowName }) => {
    const merged = [...formValues[rowName], { rowID: uuidv4() }]
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

  const handleBoolean = (e, inputName) => {
    if (e.persist) e.persist()
    setFormValues(prevFormValues => ({
      ...prevFormValues,
      [inputName]: e.target.checked
    }))
  }

  const inputClassname = 'my-30 animated fadeIn inputField'

  const offerLocationField = useMemo(
    () => (
      <Col className={`${inputClassname} p-0`} xs={12}>
        <Paper className="SimpleRowWrapper" style={{ padding: '20px' }}>
          <StyledRow>
            <StyledCol>
              <BeforeLabel>
                {offer_location.beforeLabel && offer_location.beforeLabel}
              </BeforeLabel>
              <SelectChip
                inputValue={formValues[offer_location.name]}
                handleChange={handleChange}
                handleDeleteChip={handleDeleteChip}
                name={offer_location.name}
                selectOptions={offer_location.values}
                isRequired={offer_location.isRequired || false}
                isMultiple={offer_location.isMultiple || false}
              />
            </StyledCol>
          </StyledRow>
        </Paper>
      </Col>
    ),
    [formValues[offer_location.name]]
  )

  const offerEducationField = useMemo(
    () => (
      <Col className={`${inputClassname} p-0`} xs={12}>
        <Paper className="SimpleRowWrapper" style={{ padding: '20px' }}>
          <StyledRow>
            <StyledCol>
              <BeforeLabel>
                {offer_education.beforeLabel && offer_education.beforeLabel}
              </BeforeLabel>
              <SelectChip
                inputValue={formValues[offer_education.name]}
                handleChange={handleChange}
                handleDeleteChip={handleDeleteChip}
                name={offer_education.name}
                selectOptions={offer_education.values}
                isRequired={offer_education.isRequired || false}
                isMultiple={offer_education.isMultiple || false}
              />
            </StyledCol>
          </StyledRow>
        </Paper>
      </Col>
    ),
    [formValues[offer_education.name]]
  )

  const offerExperienceFields = useMemo(
    () => (
      <Col className={`${inputClassname} p-0`} xs={12}>
        <Paper className="SimpleRowWrapper" style={{ padding: '20px' }}>
          <StyledRow>
            <StyledCol xs={12} lg={4}>
              <BeforeLabel marginAuto>
                {offer_experience_number.beforeLabel &&
                  offer_experience_number.beforeLabel}
              </BeforeLabel>
              <SelectChip
                inputValue={formValues[offer_experience_number.name]}
                handleChange={handleChange}
                handleDeleteChip={handleDeleteChip}
                name={offer_experience_number.name}
                selectOptions={offer_experience_number.values}
                isRequired={offer_experience_number.isRequired || false}
                isMultiple={offer_experience_number.isMultiple || false}
                isDisabled={formValues[offer_experience_boolean.name] || false}
              />
            </StyledCol>
            <StyledCol xs={12} lg={4}>
              <SelectChip
                inputValue={formValues[offer_experience_unit.name]}
                handleChange={handleChange}
                handleDeleteChip={handleDeleteChip}
                name={offer_experience_unit.name}
                selectOptions={offer_experience_unit.values}
                isRequired={offer_experience_unit.isRequired || false}
                isMultiple={offer_experience_unit.isMultiple || false}
                isDisabled={formValues[offer_experience_boolean.name] || false}
              />
              <AfterLabel marginAuto>
                {offer_experience_unit.afterLabel &&
                  offer_experience_unit.afterLabel}
              </AfterLabel>
            </StyledCol>
            <StyledCol xs={12} lg={4} marginAuto>
              <BeforeLabel marginAuto>
                {offer_experience_boolean.beforeLabel &&
                  offer_experience_boolean.beforeLabel}
              </BeforeLabel>
              <Checkbox
                inputValue={formValues[offer_experience_boolean.name]}
                handleBoolean={handleBoolean}
                name={offer_experience_boolean.name}
                label={offer_experience_boolean.label}
                description={offer_experience_boolean.description}
                isRequired={offer_experience_boolean.isRequired || false}
                isMultiple={offer_experience_boolean.isMultiple || false}
              />
              <AfterLabel marginAuto>
                {offer_experience_boolean.afterLabel &&
                  offer_experience_boolean.afterLabel}
              </AfterLabel>
            </StyledCol>
          </StyledRow>
        </Paper>
      </Col>
    ),
    [
      formValues[offer_experience_number.name],
      formValues[offer_experience_unit.name],
      formValues[offer_experience_boolean.name]
    ]
  )

  const offerSkillsRows = useMemo(
    () => (
      <Paper className="FormRowWrapper">
        {formValues[offer_skills.name].map((currentRow, index) => (
          <Col
            key={currentRow.rowID}
            className={inputClassname}
            xs={12}
            style={{ margin: '20px 0', padding: '0 20px' }}
          >
            <>
              <input
                type="hidden"
                name={`${offer_skills.name}[skill_id][${index}]`}
                value={currentRow.id || ''}
              />
              <input
                type="hidden"
                name={`${offer_skills.name}[skill_description][${index}]`}
                value={currentRow.description || ''}
              />
              <input
                type="hidden"
                name={`${offer_skills.name}[skill_level_id][${index}]`}
                value={currentRow.level_id || ''}
              />
            </>
            <StyledRow style={{ height: '55px' }}>
              <FormRow
                allRows={formValues[offer_skills.name]}
                rowName={offer_skills.name}
                currentRow={currentRow}
                addRow={addRow}
                removeRow={removeRow}
                updateAllRows={updateAllRows}
              >
                {({
                  rowValue,
                  handleRowChanges,
                  handleTextChip,
                  handleRowDeleteChip
                }) => (
                  <>
                    <StyledCol xs={12} lg={6}>
                      <BeforeLabel marginAuto>
                        {offer_skills_ids.beforeLabel &&
                          offer_skills_ids.beforeLabel}
                      </BeforeLabel>
                      <TextChip
                        inputValue={rowValue.id}
                        description={rowValue.description}
                        handleChange={handleTextChip}
                        selectOptions={offer_skills_ids.values}
                        newItemDescription={
                          offer_skills_ids.new_item_description
                        }
                      />
                    </StyledCol>
                    <StyledCol xs={12} lg={4}>
                      <BeforeLabel marginAuto>
                        {offer_skills_level_id.beforeLabel &&
                          offer_skills_level_id.beforeLabel}
                      </BeforeLabel>
                      <SelectChip
                        name="level_id"
                        inputValue={rowValue.level_id || ''}
                        handleChange={handleRowChanges}
                        handleDeleteChip={handleRowDeleteChip}
                        selectOptions={offer_skills_level_id.values}
                        isRequired={offer_skills_level_id.isRequired || false}
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
    [formValues[offer_skills.name]]
  )

  const offerLanguagesRows = useMemo(
    () => (
      <Paper className="FormRowWrapper">
        {formValues[offer_languages.name].map((currentRow, index) => (
          <Col
            key={currentRow.rowID}
            className={inputClassname}
            xs={12}
            style={{ margin: '20px 0', padding: '0 20px' }}
          >
            <input
              type="hidden"
              name={`${offer_languages.name}[languages_id][${index}]`}
              value={currentRow.languages_id || ''}
            />
            <input
              type="hidden"
              name={`${offer_languages.name}[languages_level_id][${index}]`}
              value={currentRow.languages_level_id || ''}
            />
            <StyledRow style={{ height: '55px' }}>
              <FormRow
                allRows={formValues[offer_languages.name]}
                rowName={offer_languages.name}
                currentRow={currentRow}
                addRow={addRow}
                removeRow={removeRow}
                updateAllRows={updateAllRows}
              >
                {({ rowValue, handleRowChanges, handleRowDeleteChip }) => (
                  <>
                    <StyledCol xs={12} lg={6}>
                      <BeforeLabel marginAuto>
                        {languages_id.beforeLabel && languages_id.beforeLabel}
                      </BeforeLabel>
                      <SelectChip
                        name="languages_id"
                        inputValue={rowValue.languages_id || ''}
                        handleChange={handleRowChanges}
                        handleDeleteChip={handleRowDeleteChip}
                        selectOptions={languages_id.values}
                        isRequired={languages_id.isRequired || false}
                      />
                    </StyledCol>
                    <StyledCol xs={12} lg={4}>
                      <BeforeLabel marginAuto>
                        {languages_level_id.beforeLabel &&
                          languages_level_id.beforeLabel}
                      </BeforeLabel>
                      <SelectChip
                        name="languages_level_id"
                        inputValue={rowValue.languages_level_id || ''}
                        handleChange={handleRowChanges}
                        handleDeleteChip={handleRowDeleteChip}
                        selectOptions={languages_level_id.values}
                        isRequired={languages_level_id.isRequired || false}
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
    [formValues[offer_languages.name]]
  )

  return (
    <Row className="HT__FormGenerator StepSeven">
      {offerLocationField}
      {offerEducationField}
      {offerExperienceFields}
      {offerSkillsRows}
      {offerLanguagesRows}
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  formFields: PropTypes.shape({
    offer_location: PropTypes.object.isRequired,
    offer_education: PropTypes.object.isRequired,
    offer_experience_number: PropTypes.object.isRequired,
    offer_experience_unit: PropTypes.object.isRequired,
    offer_experience_boolean: PropTypes.object,
    offer_skills: PropTypes.object.isRequired,
    offer_skills_ids: PropTypes.object.isRequired,
    offer_skills_level_id: PropTypes.object.isRequired,
    offer_languages: PropTypes.object.isRequired,
    languages_id: PropTypes.object.isRequired,
    languages_level_id: PropTypes.object.isRequired
  }).isRequired
}
