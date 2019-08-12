import React, {useCallback} from 'react'
import PropTypes from 'prop-types'
import { useSelector, useDispatch } from 'react-redux'
import SigninComponent from '../components/Signin'
import { changeText } from '../actions/Signin'

/** Signin page container **/
const Signin = () => {
  const {userId, password} = useSelector(state => state.Signin)
  const dispatch = useDispatch()
  const changeUserIdHandle = useCallback((event) =>
    dispatch(changeText('userId', event.target.value)), [])
  const changePasswordHandle = useCallback((event) =>
    dispatch(changeText('password', event.target.value)), [])
  return (
    <SigninComponent
      userId={userId}
      password={password}
      onChangeUserId={changeUserIdHandle}
      onChangePassword={changePasswordHandle}
    />
  )
}

Signin.propTypes = {}

export default Signin
