<html>
<head>
    <title>lwplvx.docman</title>

    <link href="${request.contextPath}/static/css/main.css" rel="stylesheet" type="text/css"/>
    <!-- Bootstrap core CSS -->
    <link href="${request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

</head>

<body class="main-body">


<#include "../nav.ftl"/>

<div class="container-fluid " <#if user??> ng-app="docmanApp" ng-controller="documentAddCtrl"</#if>>


<#if user??>
    <section class="ng-cloak" ng-cloak="">

        <form ng-show="is_document_add" name="document_add_form">
            <div class="form-group row">
                <label class="col-sm-2">接口名称：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="documentName"
                           ng-model="document_add.documentname"
                           placeholder="DocumentName" required=""
                    />
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">httpMethod：</label>

                <div class="col-sm-10 ">
                    <select class="form-control"
                            ng-model="document_add.httpmethod" name="httpMethod"
                            placeholder="httpMethod" required="">
                        <option value="POST">
                            POST
                        </option>
                        <option value="GET">
                            GET
                        </option>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">requestPath：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="requestPath"
                           ng-model="document_add.requestpath"
                           placeholder="requestPath" required=""
                    /></div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">describes：</label>
                <div class="col-sm-10">
                <textarea class="form-control" name="describes"
                          ng-model="document_add.describes"
                          placeholder="describes" required=""
                ></textarea>
                </div>
            </div>

        </form>

        <div class="row">
            <div class="col-sm-2">
                <button ng-show="!is_document_add" class="btn btn-primary btn-sm"
                        ng-click="is_document_add=true">添加接口
                </button>
            </div>
            <div class="col-sm-10">
                <button ng-show="is_document_add" class="btn btn-success btn-sm"
                        ng-click="addDocument(document_add_form,$event)">确定添加
                </button>

                <button ng-show="is_document_add" class="btn btn-danger btn-sm"
                        ng-click="is_document_add=false">取消添加
                </button>

            </div>
        </div>
    </section>
</#if>

    <section>

    <#if docList??>
        <div class="row">
            <#list docList as doc>
                <div class="col-sm-3 card m-2 p-3">
                    <h5>${doc.documentname}
                        <small>${doc.httpmethod}</small>
                    </h5>

                    <div>
                        <h6>说明:
                            <small>${doc.describes}</small>
                        </h6>
                    </div>
                    <div>
                        <h6>请求路径:
                            <small style="word-wrap:break-word" >${doc.requestpath}</small>
                        </h6>
                    </div>
                    <div class="form-inline">

                        <#if user??>
                            <button class="btn btn-outline-danger btn-sm "
                                    ng-click="deleteDocument('${doc.id}','${doc.documentname}')">删除
                            </button>
                        </#if>
                        <a class="ml-auto" href="docs/${doc.documentname}">
                            查看
                        </a>
                    </div>
                </div>
            </#list>
        </div>
    </#if>

    </section>

<#include "deleteModal.ftl"/>
</div>

<script src="${request.contextPath}/static/js/angular.min.js"></script>
<script src="${request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
<script src="${request.contextPath}/static/js/bootstrap.min.js"></script>

<#if user??>
<script>
    var serverPath ="${request.contextPath}";
</script>
<script src="${request.contextPath}/static/js/angular.min.js"></script>
<script src="${request.contextPath}/static/js/angular-route.min.js"></script>
<script src="${request.contextPath}/static/js/app/app.js"></script>
<script src="${request.contextPath}/static/js/app/controller.js"></script>
</#if>
</body>
</html>