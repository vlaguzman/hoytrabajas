import { useReducer } from 'react'

export default (defaultVal, reducer) => {
  return useReducer(reducer, defaultVal)
}
