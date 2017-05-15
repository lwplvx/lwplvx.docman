<html ng-app="docmanApp">
<head>
    <title>
    <#if title??>
    ${title} -
    </#if>lwplvx.docman</title>

    <link href="${request.contextPath}/static/css/main.css" rel="stylesheet" type="text/css"/>
    <!-- Bootstrap core CSS -->
    <link href="${request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>


<#--子页面样式-->
<#if specificStyles??>
${specificStyles}
</#if>


</head>

<body class="main-body">

<#include "nav.ftl"/>

<section class="renderbody">
<#if renderBody??>
${renderBody}
<#else>
    renderBody
</#if>
</section>


<script src="${request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
<script src="${request.contextPath}/static/js/bootstrap.min.js"></script>




<script>
    var serverPath = "${request.contextPath}";
</script>

<!-- page specific plugin scripts -->
<#if specificScripts??>
${specificScripts}
</#if>

</body>
</html>