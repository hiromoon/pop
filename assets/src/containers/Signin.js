import React from 'react'
import PropTypes from 'prop-types'
import { connect } from 'react-redux'
import SigninComponent from '../components/Signin'
import { changeText } from '../actions/Signin'

/** Signin page container **/
class Signin extends React.Component {
  /**
   * @return {React.Element} Signin Page
   */
  render() {
    const {
      userId,
      password,
      changeUserIdHandle,
      changePasswordHandle,
    } = this.props
    return (
      <SigninComponent
        userId={userId}
        password={password}
        onChangeUserId={changeUserIdHandle}
        onChangePassword={changePasswordHandle}
      />
    )
  }
}

Signin.propTypes = {
  userId: PropTypes.string.isRequired,
  password: PropTypes.string.isRequired,
  changeUserIdHandle: PropTypes.func.isRequired,
  changePasswordHandle: PropTypes.func.isRequired,
}

const mapStateToProps = state => ({
  userId: state.Signin.userId,
  password: state.Signin.password,
})

const mapDispatchToProps = dispatch => ({
  changeUserIdHandle: event =>
    dispatch(changeText('userId', event.target.value)),
  changePasswordHandle: event =>
    dispatch(changeText('password', event.target.value)),
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Signin)
