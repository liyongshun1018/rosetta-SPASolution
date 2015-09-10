<!DOCTYPE html>
{%html framework="common:static/mod.js" mode="noscript"%}
{%head%}
    <meta charset="UTF-8">
    <title>Smarty TEST</title>
    {%require name='common:static/js/jquery_2.1.4.js' %}
    {%require name='common:static/js/lazyload.js' %}
    {%require name='common:static/js/page.js' %}
    {%require name='common:static/js/BigPipe.js' %}
    {%require name='common:static/js/rosetta/Rosetta.js' %}
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
