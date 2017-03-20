<html>
<head>
    <title>lwplvx.docman</title>

    <link href="${request.contextPath}/static/css/main.css" rel="stylesheet" type="text/css"/>
    <!-- Bootstrap core CSS -->
    <link href="${request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

</head>

<body class="main-body">


<#include "../nav.ftl"/>

<div class="container-fluid ">
    <section>

    <#if projectList??>
        <#list projectList as pro>
            <div>
                <span>${pro.id}</span>
                <span>${pro.describes}</span>
                <span>${pro.projectName}</span>
                <a href="${pro.projectName}/apps/">App projectName 管理</a>
            </div>
        </#list>
    </#if>

    </section>
</div>

<script>
    var serverPath ="${request.contextPath}";
</script>
<script src="${request.contextPath}/static/js/angular.min.js"></script>
<script src="${request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
<script src="${request.contextPath}/static/js/bootstrap.min.js"></script>
</body>
</html>