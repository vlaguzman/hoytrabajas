import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import uuidv4 from 'uuid/v4'
import { Row, Col } from 'reactstrap'
import Paper from '@material-ui/core/Paper'
import styled from 'styled-components'
import Checkbox from '../../../../../components/FormsLayout/Fields/Checkbox'
import SelectChip from '../../../../../components/FormsLayout/Fields/SelectChip'
import FormRow from '../../../../../components/FormsLayout/Fields/FormRow'
import TextChip from '../../../../../components/FormsLayout/Fields/TextChip'

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
    offer_skills = null,
    technical_skills_id = null,
    technical_skills_level_id = null,
    offer_languages = null,
    language_id = null,
    language_level_id = null
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
    [city_id.name]: city_id.current_value || '',
    [educational_degree_id.name]: educational_degree_id.current_value || '',
    [duration.name]: duration.current_value || '',
    [duration_type_id.name]: offer_experience_unit.current_value || '',
    [required_experience.name]: required_experience.current_value || false,
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
                handleChange={handleChange}
                handleDeleteChip={handleDeleteChip}
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
                handleChange={handleChange}
                handleDeleteChip={handleDeleteChip}
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
              <SelectChip
                inputValue={formValues[duration.name]}
                handleChange={handleChange}
                handleDeleteChip={handleDeleteChip}
                name={duration.name}
                selectOptions={duration.values}
                isDisabled={formValues[required_experience.name] || false}
              />
            </StyledCol>
            <StyledCol xs={12} lg={4}>
              <SelectChip
                inputValue={formValues[duration_type_id.name]}
                handleChange={handleChange}
                handleDeleteChip={handleDeleteChip}
                name={duration_type_id.name}
                selectOptions={duration_type_id.values}
                isDisabled={formValues[required_experience.name] || false}
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
                handleBoolean={handleBoolean}
                name={required_experience.name}
                label={required_experience.label}
                description={required_experience.description}
              />
              <AfterLabel marginAuto>
                {required_experience.label}
              </AfterLabel>
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
                name={`offer[skill_id][${index}]`}
                value={currentRow.id || ''}
              />
              <input
                type="hidden"
                name={`offer[skill_level_id][${index}]`}
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
                        {technical_skills_id.beforeLabel &&
                          technical_skills_id.beforeLabel}
                      </BeforeLabel>
                      <TextChip
                        inputValue={rowValue.id}
                        description={rowValue.description}
                        handleChange={handleTextChip}
                        selectOptions={technical_skills_id.values}
                        newItemDescription={
                          technical_skills_id.new_item_description
                        }
                      />
                    </StyledCol>
                    <StyledCol xs={12} lg={4}>
                      <BeforeLabel marginAuto>
                        {technical_skills_level_id.beforeLabel &&
                          technical_skills_level_id.beforeLabel}
                      </BeforeLabel>
                      <SelectChip
                        name="level_id"
                        inputValue={rowValue.level_id || ''}
                        handleChange={handleRowChanges}
                        handleDeleteChip={handleRowDeleteChip}
                        selectOptions={technical_skills_level_id.values}
                        isRequired={technical_skills_level_id.isRequired || false}
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
              name={`${offer_languages.name}[language_id][${index}]`}
              value={currentRow.language_id || ''}
            />
            <input
              type="hidden"
              name={`${offer_languages.name}[language_level_id][${index}]`}
              value={currentRow.language_level_id || ''}
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
                        {language_id.beforeLabel && languages_id.beforeLabel}
                      </BeforeLabel>
                      <SelectChip
                        name="language_id"
                        inputValue={rowValue.language_id || ''}
                        handleChange={handleRowChanges}
                        handleDeleteChip={handleRowDeleteChip}
                        selectOptions={language_id.values}
                        isRequired={language_id.isRequired || false}
                      />
                    </StyledCol>
                    <StyledCol xs={12} lg={4}>
                      <BeforeLabel marginAuto>
                        {language_level_id.beforeLabel &&
                          language_level_id.beforeLabel}
                      </BeforeLabel>
                      <SelectChip
                        name="language_level_id"
                        inputValue={rowValue.language_level_id || ''}
                        handleChange={handleRowChanges}
                        handleDeleteChip={handleRowDeleteChip}
                        selectOptions={language_level_id.values}
                        isRequired={language_level_id.isRequired || false}
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
      {cityIdField}
      {educationalDegreeIdField}
      {experienceFields}
      {offerSkillsRows}
      {offerLanguagesRows}
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
    offer_skills: PropTypes.object.isRequired,
    technical_skills_id: PropTypes.object.isRequired,
    technical_skills_level_id: PropTypes.object.isRequired,
    offer_languages: PropTypes.object.isRequired,
    language_id: PropTypes.object.isRequired,
    language_level_id: PropTypes.object.isRequired
  }).isRequired
}
