/**
 * Redux Store
 */
import { createStore, applyMiddleware } from 'redux'
import createSagaMiddleware from 'redux-saga'
import { composeWithDevTools } from 'redux-devtools-extension'
import reducers from 'Reducers'
import { helloSaga } from '../sagas/async'

// create the saga middleware
const sagaMiddleware = createSagaMiddleware()

const middlewares = [sagaMiddleware]

function configureStore(initialStates = {}) {
  const store = createStore(
    reducers,
    initialStates,
    composeWithDevTools(applyMiddleware(...middlewares))
  )

  // sagaMiddleware.run(helloSaga)

  if (module.hot) {
    // Enable Webpack hot module replacement for reducers
    module.hot.accept('../reducers/index', () => {
      const nextRootReducer = require('../reducers/index') // eslint-disable-line 
      store.replaceReducer(nextRootReducer)
    })
  }
  return store
}

export default configureStore()
