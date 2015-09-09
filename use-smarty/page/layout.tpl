<!DOCTYPE html>
{%html%}
<head>
    <meta charset="UTF-8">
    <title>Smarty TEST</title>
    <!--[FIS_CSS_LINKS_HOOK]-->
    <!--[FIS_JS_SCRIPT_HOOK]-->
</head>
<body>

    {%widget_block pagelet_id="pager"%}
        {%block name="pagelet_center"%}{%/block%}
    {%/widget_block%}

    <script type="text/javascript" src="/static/mod.js" data-framework></script>
    <script type="text/javascript" src="/static/js/jquery_2.1.4.js" data-framework></script>
    <script type="text/javascript" src="/static/js/BigPipe.js" data-framework></script>
    <script type="text/javascript" src="/static/js/page.js" data-framework></script>
    <script type="text/javascript" src="/components/rosetta/Rosetta.js" data-framework></script>

    <script type="text/javascript">
        appPage.start({
            containerId: 'pager',
            pagelets: 'pager',
            validate: /^[\w\W]*/,
            cache: true
        });

        appPage.on('onpagerendercomplete', function(e) {
            Rosetta.render();
        });
    </script>

</body>
{%/html%}