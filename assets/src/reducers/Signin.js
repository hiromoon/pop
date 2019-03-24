import { CHANGE_TEXT } from '../actions/Signin'

const initialState = {
  userId: '',
  password: '',
}

export default (state = initialState, action) => {
  switch (action.type) {
    case CHANGE_TEXT:
      return {
        ...state,
        ...action.payload,
      }
    default:
      return state
  }
}
