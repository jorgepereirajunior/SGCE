import React from 'react'
import { BrowserRouter, Route, Switch } from 'react-router-dom'

import Initial from './screens/Initial'

export default function Routes() {

    return (
        <BrowserRouter>
            <Switch>
                <Route path="/" component={Initial} />
            </Switch>
        </BrowserRouter>
    )
}
