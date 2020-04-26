import React from 'react'
import { BrowserRouter, Route, Switch } from 'react-router-dom'

import Initial from './screens/Initial'
import NewDpt from './screens/department/NewDpt'

export default function Routes() {

    return (
        <BrowserRouter>
            <Switch>
                <Route path="/" exact component={Initial} />
                <Route path="/dptregister" component={NewDpt} />
            </Switch>
        </BrowserRouter>
    )
}
