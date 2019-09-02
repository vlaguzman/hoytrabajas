import {
  UPDATE_FIELD,
  UPDATE_FIELD_ARRAY,
  UPDATE_ERRORS,
  PUSH_FIELD_ARRAY,
  UPDATE_FORM_ID,
  UPDATE_VALID_FORM,
  LOAD_INFO,
  UNLOAD_ALL,
  UNLOAD_ONE
} from './types'

export const loadInfo = value => ({
  type: LOAD_INFO,
  payload: value
})
export const unloadAll = value => ({
  type: UNLOAD_ALL,
  payload: value
})
export const unloadOne = () => ({
  type: UNLOAD_ONE
})

export const updateField = value => ({
  type: UPDATE_FIELD,
  payload: value
})

export const updateFieldArray = value => ({
  type: UPDATE_FIELD_ARRAY,
  payload: value
})

export const updateErrors = value => ({
  type: UPDATE_ERRORS,
  payload: value
})

export const pushFieldArray = value => ({
  type: PUSH_FIELD_ARRAY,
  payload: value
})

export const updateFormID = value => ({
  type: UPDATE_FORM_ID,
  payload: value
})

export const updateValidForm = value => ({
  type: UPDATE_VALID_FORM,
  payload: value
})
