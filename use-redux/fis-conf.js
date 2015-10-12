
// node_modules 默认被添加到了 ignore 列表中，所以不做处理也不会被发布

fis.hook('commonjs', {
    paths: {
        'redux': '/node_modules/redux/dist/redux.js'
    }
});


fis.match('*', {
    useHash: false, // md5 都关掉
    release: '/$0',
    optimizer: null
});


fis.match('map.json', {
    release: '/config/$0'
});

fis.match('*/Rosetta.js', {
    isMod: false,
    standard: false
});


fis
    .match('*.{html,tpl}', {
        parser: fis.plugin('rosetta', {
            compileUsage: false
        })
    })

    .match('/^\/dev', {
        release: false
    })
    .match('*.coffee', {
        parser: fis.plugin('coffee-script', {
            bare: true
        }),
        rExt: 'js',
        isMod: true,
        useMap: true
    })
    .match(/^\/node_modules\/(.+)\.js$/i, {
        isMod: true
    })
    .match(/^\/modules\/(.+)\.js$/, {
        isMod: true
    })
    .match(/main\.coffee|mod\.js/, {
        isMod: false
    })
    .match('**.md', {
        release: false
    })
    .match('*.less', {
        parser: fis.plugin('less'), // invoke `fis-parser-less`,
        rExt: '.css',
        useSprite: true,
        scale: 0.5
    })

    .match('*.html:less', {
        parser: fis.plugin('less'), // invoke `fis-parser-less`,
        release: false,
        rExt: '.css'
    })

    .match('package.json', {
        release: false
    })

    .match('/elements/r-*.html', {
        rExt: '.js',
        packTo: '/static/aio.js'
    })
    .match('::package', {
        prepackager: fis.plugin('csswrapper'),
        postpackager: [fis.plugin('loader', {
            resourceType: 'mod',
            useInlineMap: true // 资源映射表内嵌
        })]
    })
    .match('*.{tpl,html,js}', {
        preprocessor: fis.plugin('rosetta-import')
    })


