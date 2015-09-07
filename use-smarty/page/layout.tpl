<!DOCTYPE html>
{html framework="static/mod.js"}
<head>
    <title>Smarty TEST</title>
    <!--[FIS_CSS_LINKS_HOOK]-->
    <!--[FIS_JS_SCRIPT_HOOK]-->
</head>
<body>
    {widget name="widget/header.tpl"}

    {widget_block pagelet_id="pagelet_center"}
        {block name="pagelet_center"}{/block}
    {/widget_block}

    {widget name="widget/footer.tpl"}
</body>
{/html}