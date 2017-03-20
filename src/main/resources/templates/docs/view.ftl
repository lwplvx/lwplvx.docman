<html>
<head>
    <title>lwplvx.docman</title>

    <link href="${request.contextPath}/static/css/main.css" rel="stylesheet" type="text/css"/>
    <!-- Bootstrap core CSS -->
    <link href="${request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

</head>

<body class="main-body">

<#include "../nav.ftl"/>


<div class="container-fluid pb-5" <#if user??> ng-app="docmanApp" ng-controller="documentCtrl"</#if>>

    <div class="row">
        <div class="col-sm-3">
            <section>
            <#include "leftMenu.ftl"/>
            </section>
        </div>
        <div class="col-sm-9">
            <section>
            <#if doc??>
                <div>
                    <h4>${doc.documentname}</h4>
                    <p>
                    <h6>说明：
                    ${doc.describes}</h6></p>
                    <p>
                    <h6>接口地址：
                        <small>${doc.requestpath}</small>
                    </h6>

                    </p>
                    <p>
                    <h6>Method：
                        <small>${doc.httpmethod}</small>
                    </h6>

                    </p>
                </div>
            </#if>
            </section>
        <#include "requestField.ftl"/>
        <#include "requestSample.ftl"/>
            <hr/>
        <#include "responseField.ftl"/>
        <#include "responseSample.ftl"/>

        <#include "deleteModal.ftl"/>
        </div>
    </div>
</div>


<script src="${request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
<script src="${request.contextPath}/static/js/bootstrap.min.js"></script>
<script>

    $(function () {
        $('#response-sampleList-tab a').click(function (e) {
            e.preventDefault()
            $(this).tab('show')
        });

        $('#response-sampleList-tab a').first().trigger("click");

        $('#request-sampleList-tab a').click(function (e) {
            e.preventDefault()
            $(this).tab('show')
        });

        $('#request-sampleList-tab a').first().trigger("click");

    });

</script>
<#if user??>
<script>
    var serverPath = "${request.contextPath}";
</script>
<script src="${request.contextPath}/static/js/angular.min.js"></script>
<script src="${request.contextPath}/static/js/angular-route.min.js"></script>
<script src="${request.contextPath}/static/js/app/app.js"></script>
<script src="${request.contextPath}/static/js/app/controller.js"></script>
</#if>
</body>
</html>