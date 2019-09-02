import uuidv4 from 'uuid/v4'
import { createSelector } from 'reselect'

const excludedFormSections = ['has_experience']
const getFormField = (state, props) => {
  const {
    formSection,
    formName,
    name,
    rowName,
    ownSection = null,
    extra = null,
    item = null
  } = props
  let itemExtra
  if (item) itemExtra = item.extra
  if (
    (!name && !rowName) ||
    excludedFormSections.includes(ownSection || formSection) ||
    (itemExtra && itemExtra.ignoreState) ||
    (extra && extra.ignoreState)
  ) {
    return null
  }
  if (name) return state.forms[formName][ownSection || formSection][name]
  if (rowName) return state.forms[formName][ownSection || formSection][rowName]
  return null
}

const getDisplayFields = (state, { formSection, formName, fields }) => {
  let displayFields = {}

  fields.forEach(field => {
    const { pro, ownSection = null, displayOptions = null } = field
    if (displayOptions && displayOptions.shouldDisplay && pro.name) {
      displayFields = {
        ...displayFields,
        [pro.name]: state.forms[formName][ownSection || formSection][pro.name]
      }
    }
  })

  return displayFields
}

const getFormRow = (state, { formSection, formName, formRow, rowName }) => {
  if (!rowName || !formRow) return null
  const { id } = formRow
  const rowArray = state.forms[formName][formSection][rowName]
  const index = rowArray.findIndex(row => row.id === id)
  return rowArray[index]
}

const getAllFormRows = (state, { formSection, formName, rowName }) => {
  if (!rowName) return null
  const rowArray = state.forms[formName][formSection][rowName]

  if (!rowArray[0] || !rowArray[0]['id']) {
    const newRowArray = [...rowArray]
    if (!rowArray[0])
      newRowArray.push({
        id: uuidv4()
      })
    else if (!rowArray[0]['id']) newRowArray[0]['id'] = uuidv4()

    return newRowArray
  }

  return rowArray
}

const getMultiFormID = (state, { formSection, formName }) => {
  const multiFormsArray = state.forms[formName][formSection]['fields']
  const singleArray = multiFormsArray[multiFormsArray.length - 1]

  if (!singleArray || !singleArray.id) {
    const newId = uuidv4()
    return newId
  }

  return singleArray.id
}

const getMultiFormField = (
  state,
  { formSection, formName, singleFormID, item: { pro } }
) => {
  const { name } = pro
  if (!singleFormID || !name) return null

  const multiFormsArray = state.forms[formName][formSection]['fields']
  const index = multiFormsArray.findIndex(form => form.id === singleFormID)
  if (index === -1) {
    return null
  }
  return multiFormsArray[index][name]
}

const getMultiForm = (state, { formSection, formName, singleFormID }) => {
  if (!singleFormID) return null
  const multiFormsArray = state.forms[formName][formSection]['fields']
  const index = multiFormsArray.findIndex(form => form.id === singleFormID)
  if (index === -1) {
    return null
  }
  return multiFormsArray[index]
}

const getAllMultiForms = (state, { formSection, formName }) =>
  state.forms[formName][formSection]['fields']

const getControlled = (
  state,
  { pro: { mainField, fields }, formSection, formName }
) => {
  if (!mainField || !fields) return null
  const allowedNames = fields.map(field => field.pro.name)
  allowedNames.push(mainField.pro.name)
  const rawValues = state.forms[formName][formSection]

  const filteredValues = Object.keys(rawValues)
    .filter(key => allowedNames.includes(key))
    .reduce((obj, key) => {
      obj[key] = rawValues[key]
      return obj
    }, {})

  return filteredValues
}

const getValidationField = (
  state,
  { formSection, formName, name, rowName, extra, item }
) => {
  let itemExtra
  if (item) itemExtra = item.extra
  if (
    (!name && !rowName) ||
    excludedFormSections.includes(formSection) ||
    (itemExtra && itemExtra.ignoreState) ||
    (extra && extra.ignoreState)
  ) {
    return null
  }

  const { validation } = state.forms[formName][formSection]

  if (name) return validation[name]
  if (rowName) return validation[rowName]
  return null
}

export const makeGetField = () =>
  createSelector(
    getFormField,
    (field = null) => field
  )

export const makeGetDisplayFields = () =>
  createSelector(
    getDisplayFields,
    (fields = null) => fields
  )

export const makeGetFormRow = () =>
  createSelector(
    getFormRow,
    (row = null) => row
  )

export const makeGetAllRows = () =>
  createSelector(
    getAllFormRows,
    (allRows = null) => allRows
  )

export const makeGetMultiFormID = () =>
  createSelector(
    getMultiFormID,
    (id = null) => id
  )

export const makeGetMultiFormField = () =>
  createSelector(
    getMultiFormField,
    (formField = null) => formField
  )

export const makeGetMultiForm = () =>
  createSelector(
    getMultiForm,
    (multiForm = null) => multiForm
  )

export const makeGetMultiFormInfo = () =>
  createSelector(
    [getMultiFormID, getAllMultiForms],
    (id = null, allForms) => ({ currentFormID: id, allForms })
  )

export const getControlledInput = createSelector(
  getControlled,
  (filteredValues = null) => filteredValues
)

export const makeGetValidationField = () =>
  createSelector(
    getValidationField,
    (validationField = null) => validationField
  )
