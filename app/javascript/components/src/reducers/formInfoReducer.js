import produce from 'immer'
// import { defaultInfo } from 'Context/formInfoContext'

export default (state, action) =>
  produce(state, draft => {
    const {
      payload: { formSection, formID, value }
    } = action

    let index = -1
    const hasMultipleForms = ['experiences', 'diplomas', 'education'].includes(
      formSection
    )

    if (hasMultipleForms && formID) {
      index = draft[formSection].findIndex(item => item.id === formID)
    }

    switch (action.type) {
      case 'ADD':
        draft[formSection] = {
          ...draft[formSection],
          ...value
        }
        return draft
      case 'ADD_TO_ARRAY':
        if (index !== -1) {
          draft[formSection][index] = {
            ...draft[formSection][index],
            ...value
          }
        }
        return draft
      case 'PUSH_NEW_ARRAY':
        const obj = { ...defaultInfo[formSection][0] }
        obj.id = formID
        draft[formSection].push(obj)
        return draft
      case 'SET_FORM_ID':
        draft[formSection][0].id = formID
        return draft
      case 'SET_VALID_FORM':
        if (index !== -1) {
          draft[formSection][index] = {
            ...draft[formSection][index],
            ...value
          }
        } else {
          draft[formSection] = {
            ...draft[formSection],
            ...value
          }
        }
        return draft
      case 'RESET':
        return draft
      default:
        return draft
    }
  })
