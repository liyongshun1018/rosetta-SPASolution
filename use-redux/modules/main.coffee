listChangeStore = require './store'
actions = require './actions'
{bindActionCreators} = require 'redux'



dispatch = listChangeStore.dispatch
realAction = bindActionCreators(actions, listChangeStore.dispatch)



root = document.querySelector('.container')
listRElement = Rosetta.render(Rosetta.create('r-list-disease'), root)
pullupRElement = Rosetta.render(Rosetta.create('r-pullupdata', {
    startPullUp: realAction.pullup
}), root)

listChangeStore.subscribe(() ->
    cstate = listChangeStore.getState()
    console.log(cstate)

    listRElement.update({
        list: cstate.list.list
    })
)