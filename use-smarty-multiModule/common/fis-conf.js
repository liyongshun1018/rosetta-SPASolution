
fis.require('smarty')(fis);
fis.set('namespace', 'common');


// node_modules 默认被添加到了 ignore 列表中，所以不做处理也不会被发布


fis.match('*', {
    useHash: false // md5 都关掉
});

fis.match('*.json', {
    release: '$0' // md5 都关掉
});

fis.match('*.php', {
    release: '$0'
});

fis.match('/smarty/{*,**/*}', {
    release: '$0'
});

fis.match('/(widget/{*,**/*}.tpl)', {
    useMap: true,
    url: '$1' // 这个比较重要
});

fis.match('map.json', {
    release: '/config/$0'
});

fis.match('*/Rosetta.js', {
    isMod: false,
    standard: false
});

fis.match('/widget/{*,**/*}.js', {
    isMod: true,
    postprocessor: fis.plugin('mod.js-define-wrapper') // 未发布 NPM
    // fis3 是可以加载项目里面的 node_modules 下的插件的，但是这个对理解 fis3 有帮助
    // 不建议在生产环境中这么干，不然维护起来会比较麻烦，fis 依然推荐全局做安装
});


fis
    .match('*.{html,tpl}', {
        parser: fis.plugin('rosetta', {
            compileUsage: false
        })
    })


    .match('/elements/r-*.html', {
        rExt: '.js',
        packTo: '/static/aio.js'
    })
    .match('/elements/*.*', {
        release: '/static/$0'
    })

    .match('/components/**/r-*.html', {
        rExt: '.js',
        packTo: '/static/aio.js'
    })

    .match('/components/(**/*.*)', {
        useMap: true,
        release: '/static/$1'
    })

    .match('*.{tpl,html,js}', {
      preprocessor: fis.plugin('rosetta-import')
    })

    .match('*.tpl', {
        useMap: true,
        preprocessor: [
            fis.plugin('rosetta-import'),
            fis.plugin('extlang')
        ]
    })

    // .match('::packager', {
    //     postpackager: fis.plugin('rosetta', {
    //         allInOne: false,
    //         left_delimiter: '{%',
    //         right_delimiter: '%}'
    //     })
    // });

// 在 dev 环境下关闭文件 md5 hash
fis
    .media('dev')
    .match('*.{css,js,html}', {
        useHash: false
    });
    // .set('deploy', {
    //   receiver: 'http://dbl-dev-rd22.vm.baidu.com:8343/receiver',
    //   from: '/',
    //   subOnly: true,
    //   to: '/home/work/webroot/templates/templates/eva_zhidaorder_gao'
    // })


// fis3 release production
fis
    .media('production')
    // 压缩 js 通过 uglify
    .match('*.js', {
        optimizer: fis.plugin('uglify-js')
    })

    // 这里面也是 js
    .match('/elements/*.html', {
        optimizer: fis.plugin('uglify-js')
    })

    // 压缩 css
    .match('*.css', {
        optimizer: fis.plugin('clean-css')
    })

    // 压缩 png
    .match('*.png', {
        optimizer: fis.plugin('png-compressor')
    });


fis.match(/.*\.partial\.js$/, {
    isMod: false
});



fis.match('/plugin/test/{*,**/*}', {
    release: false
});

