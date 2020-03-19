import produce from 'immer'
import INIT_STATE from '../store/initialStates/forms'

import {
  LOAD_INFO,
  UNLOAD_ALL,
  UNLOAD_ONE,
  UPDATE_FIELD,
  UPDATE_FIELD_ARRAY,
  UPDATE_ERRORS,
  PUSH_FIELD_ARRAY,
  UPDATE_FORM_ID,
  RESET_ALL
} from '../actions/types'

export default (state = INIT_STATE, action) =>
  produce(state, draftState => {
    const { payload } = action

    let index
    if (payload && payload.formID && payload.formSection)
      index = draftState[payload.formName][payload.formSection][
        'fields'
      ].findIndex(item => item.id === payload.formID)

    switch (action.type) {
      case UPDATE_FIELD:
        draftState[payload.formName][payload.formSection] = {
          ...draftState[payload.formName][payload.formSection],
          ...payload.value
        }
        return draftState
      case UPDATE_FIELD_ARRAY:
        if (index !== -1) {
          draftState[payload.formName][payload.formSection]['fields'][index] = {
            ...draftState[payload.formName][payload.formSection]['fields'][
              index
            ],
            ...payload.value
          }
        } else {
          draftState[payload.formName][payload.formSection]['fields'][0] = {
            ...draftState[payload.formName][payload.formSection]['fields'][0],
            ...payload.value
          }
        }
        return draftState
      case UPDATE_ERRORS:
        draftState[payload.formName][payload.formSection]['validation'][
          payload.fieldName
        ] = {
          ...draftState[payload.formName][payload.formSection]['validation'][
            payload.fieldName
          ],
          ...payload.value
        }
        return draftState
      case PUSH_FIELD_ARRAY:
        draftState[payload.formName][payload.formSection]['fields'].push({
          ...INIT_STATE[payload.formName][payload.formSection]['fields'][0],
          id: payload.formID
        })
        return draftState
      case UPDATE_FORM_ID:
        draftState[payload.formName][payload.formSection]['fields'][0].id =
          payload.formID
        return draftState
      case RESET_ALL:
        return INIT_STATE
      default:
        return draftState
    }
  })
