import { createStore, applyMiddleware } from 'redux'
import promiseMiddleware from 'redux-promise'
import reducer from './reducers'

const configureStore = initialState =>
  createStore(reducer, initialState, applyMiddleware(promiseMiddleware))

export default configureStore
