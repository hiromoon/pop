import React from 'react';
import { connect } from 'react-redux';
import Router from './Router';

const mapStateToProps = state => ({});

class App extends React.Component {
  render() {
    return <Router />;
  }
}

export default connect(mapStateToProps)(App);
