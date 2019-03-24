import React from 'react';
import { BrowserRouter, Route, Link } from 'react-router-dom';

import Signin from './Signin';

const Router = () => (
  <BrowserRouter>
    <Route path="/signin" component={Signin} />
  </BrowserRouter>
);

export default Router;
