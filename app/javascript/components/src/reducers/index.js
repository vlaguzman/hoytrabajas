/**
 * App Reducers
 */
import { combineReducers } from 'redux'
// import settings from './settings'
// import chatAppReducer from './ChatAppReducer'
// import emailAppReducer from './EmailAppReducer'
// import sidebarReducer from './SidebarReducer'
// import todoAppReducer from './TodoAppReducer'
// import authUserReducer from './AuthUserReducer'
// import feedbacksReducer from './FeedbacksReducer'
// import ecommerceReducer from './EcommerceReducer'
import formsInfoReducer from './FormsInfoReducer'

const reducers = combineReducers({
  forms: formsInfoReducer
})

export default reducers
