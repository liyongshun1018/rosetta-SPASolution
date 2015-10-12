reducers = require './reducers'
{createStore, applyMiddleware} = require 'redux'


thunkMiddleware = ({ dispatch, getState })->
    console.log('Enter thunkMiddleware');
    return (next) ->
        console.log('Function "next" provided:', next);
        return (action) ->
            console.log('Handling action:', action);
            return (if typeof action is "function" then action(dispatch, getState) else next(action))


finalCreateStore = applyMiddleware(thunkMiddleware)(createStore)
module.exports = finalCreateStore(reducers)
