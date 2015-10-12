module.exports =
    pullup: () ->
        return (dispatch, getState) ->
            pageNo = getState().list.pageNo

            setTimeout(() ->
                console.log('enter action')
                if true
                    dispatch({
                        type: 'PULLUPSTART',
                        data: [{
                            images: '',
                            description: '测试' + pageNo,
                            name: pageNo
                        }]
                    })
            , 2000)
