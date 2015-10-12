{combineReducers} = require 'redux'

listReducer = (state = {pulling: false, pageNo: 1, list: []}, action) ->
    switch action.type
        when 'PULLUPSTART'
            state.pulling = true
            state.pageNo = ++state.pageNo
            state.list = state.list.concat(action.data)
            state

        else
            state.pulling = false
            state


reducers = combineReducers({
    list: listReducer
})


module.exports = reducers