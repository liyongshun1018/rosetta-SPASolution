<!DOCTYPE html>
{%html framework="static/mod.js" mode="noscript"%}
{%head%}
    <meta charset="UTF-8">
    <title>Smarty TEST</title>
    {%require name='static/js/jquery_2.1.4.js' %}
    {%require name='static/js/lazyload.js' %}
    {%require name='static/js/page.js' %}
    {%require name='static/js/BigPipe.js' %}
    {%require name='static/js/rosetta/Rosetta.js' %}
{%/head%}

{%body%}
    {%widget_block pagelet_id="pager"%}
        {%block name="pagelet_center"%}{%/block%}
    {%/widget_block%}



    {%script%}
    appPage.start({
        containerId: 'pager',
        pagelets: 'pager',
        validate: /^[\w\W]*/,
        cache: true
    });

    appPage.on('onpagerendercomplete', function(e) {
        Rosetta.render();
    });
    {%/script%}
{%/body%}
{%/html%}
