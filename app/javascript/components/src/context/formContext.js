import React, { createContext, useReducer } from 'react'
import PropTypes from 'prop-types'
import formState from '../hooks/formState'

// const formReducer = (state, action) => {
//   return state
// }

// import formReducer from 'Reducers/formReducer'

export const FormContext = createContext()
export const FormNameContext = createContext()
export const DispatchContext = createContext()
export const FormChangeContext = createContext()

export const FormProvider = ({ children, allForms, formName, singleForm }) => {
  const defaultForm = (allForms && allForms[0]) || (singleForm && singleForm[0])

  console.log('defaultForm, formContext')
  console.log(defaultForm)

  const formReducer = (state, action) => {
    if (singleForm) return allForms
    return (
      (allForms && allForms[action.type]) ||
      (singleForm && singleForm[0]) ||
      state
    )
  }

  const changeReducer = (state, action) => {
    switch (action.type) {
      case 'CHANGED':
        return true
      case 'SAVED':
        return false
      default:
        return null
    }
  }

  const [formHasChanged, dispatchFormChange] = useReducer(changeReducer, null)

  const [forms, dispatch] = useReducer(formReducer, defaultForm)

  return (
    <FormContext.Provider value={forms}>
      <FormNameContext.Provider value={formName}>
        <DispatchContext.Provider value={dispatch}>
          <FormChangeContext.Provider value={formHasChanged}>
            {children}
          </FormChangeContext.Provider>
        </DispatchContext.Provider>
      </FormNameContext.Provider>
    </FormContext.Provider>
  )
}

FormProvider.propTypes = {
  formName: PropTypes.string.isRequired,
  allForms: PropTypes.array,
  singleForm: PropTypes.bool,
  children: PropTypes.node
}
