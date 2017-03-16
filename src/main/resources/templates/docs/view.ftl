<html>
<head>
    <title>lwplvx.docman</title>

    <link href="${request.contextPath}/static/css/main.css" rel="stylesheet" type="text/css"/>
    <!-- Bootstrap core CSS -->
    <link href="${request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

</head>

<body class="main-body">

<nav class="navbar navbar-toggleable-sm navbar-light bg-info fixed-top ">
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="${request.contextPath}">Docman</a>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link text-uppercase" href="#">About</a>
            </li>
        </ul>
        <ul class="navbar-nav ">

        <#if user??>
            <li class="nav-item">
                <a class="nav-link" href="#"> ${user.username}</a>
            </li>
            <li class="nav-item">
                <a class="btn btn-outline-danger my-2 my-sm-0 text-uppercase rounded-0"
                   href="${request.contextPath}/users/logout">Logout</a>
            </li>
        <#else>
            <li class="nav-item">
                <a class="nav-link text-uppercase " href="${request.contextPath}/login">Login <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-uppercase" href="${request.contextPath}/register">Register</a>
            </li>
        </#if>
        </ul>

    </div>
</nav>
<div class="container-fluid pb-5" <#if user??> ng-app="docmanApp" ng-controller="documentCtrl"</#if>>

    <div class="row">
        <div class="col-sm-3">

            <div class="list-group">

            <#if docList??>
                <#list docList as item>
                    <#if doc.documentname==item.documentname>
                        <a href="#"
                           title="${item.httpmethod},${item.requestpath}"
                           class="list-group-item active disabled">
                        ${item.documentname}
                        </a>
                    <#else>
                        <a href="${item.documentname}"
                           title="${item.httpmethod},${item.requestpath}"
                           class="list-group-item list-group-item-action list-g">
                        ${item.documentname}
                        </a>
                    </#if>
                </#list>
            </#if>

            </div>
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


            <section>

                <h5>请求参数：</h5>
                <form name="request_form">
                    <table class="table table-striped table-bordered table-hover ">
                    <#--<thead class="thead-inverse">  -->
                        <thead class="thead-inverse">
                        <tr>
                            <th>Name</th>
                            <th>Type</th>
                            <th>IsRequired</th>
                            <th>Describe</th>
                            <th>DefaultValue</th>
                        <#if user??>
                            <th>
                                编辑
                            </th>
                        </#if>
                        </tr>
                        </thead>
                        <tbody id="request_${doc.id}_tbody">
                        <#if fieldList??>
                            <#list fieldList as item>
                                <#if item.parametertype=="Request">
                                <tr>
                                    <td>${item.fieldname}</td>
                                    <td>${item.fieldtypename}</td>
                                    <td>
                                    ${item.isrequired?string("true","flase")}
                                    </td>
                                    <td>${item.describes}</td>
                                    <td>
                                        <#if item.defaultvalue??>${item.defaultvalue}</#if>
                                    </td>
                                    <#if user??>
                                        <td>
                                            <div class="btn-group">
                                                <button class="btn btn-outline-info btn-sm"
                                                        ng-click="updateField($event)">
                                                    修改
                                                </button>
                                                <button class="btn btn-outline-danger btn-sm"
                                                        ng-click="deleteField(request_form,'${item.id}',$event)">删除
                                                </button>
                                            </div>
                                        </td>
                                    </#if>
                                </tr>
                                </#if>
                            </#list>
                        </#if>
                        <#if user??>
                        <tr ng-show="is_request_field_add" class="ng-cloak" ng-cloak>
                            <td class="p-0">
                                <input class="form-control" name="fieldName" type="text"
                                       placeholder="FieldName" ng-change="change(request_form)"
                                       ng-model="requestField_add.fieldname" required="">

                                </input>
                            </td>
                            <td class="p-0">
                                <input class="form-control" type="text" name="fieldTypeName"
                                       placeholder="FieldTypeName" ng-change="change(request_form)"
                                       ng-model="requestField_add.fieldtypename" required="">
                                </input>
                            </td>

                            <td class="p-0">
                                <select class="form-control" name="isRequired"
                                        ng-model="requestField_add.isrequired">
                                    <option value="0">false</option>
                                    <option value="1">true</option>
                                </select></td>
                            <td class="p-0">
                            <textarea class="form-control m-0" name="describe"
                                      placeholder="Describe"
                                      ng-model="requestField_add.describes"></textarea></td>

                            <td class="p-0">
                            <textarea class="form-control m-0" name="defaultValue"
                                      placeholder="DefaultValue"
                                      ng-model="requestField_add.defaultvalue"></textarea></td>
                            <td>
                                <div class="btn-group">
                                    <button class="btn btn-outline-success btn-sm" type="button"
                                            ng-click="addRequestField(request_form,$event)">确定
                                    </button>
                                    <button class="btn btn-outline-warning btn-sm" type="button"
                                            ng-click="is_request_field_add = false">取消
                                    </button>
                                </div>
                            </td>
                        </tr>
                        </#if>
                        </tbody>
                    </table>

                    <div ng-show="is_request_sample_add " class="ng-cloak" ng-cloak>

                        <div class="form-group row">
                            <label class="col-sm-2">标题：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="title"
                                       ng-model="requestSample_add.title" ng-change="change(request_form)"
                                       placeholder="Title" required=""/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2">内容：</label>
                            <div class="col-sm-10">
                        <textarea class="form-control" name="content"
                                  ng-model="requestSample_add.content" ng-change="change(request_form)"
                                  placeholder="Content" required="">
                        </textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-10 ml-auto">
                                <button class="btn btn-success" type="button"
                                        ng-click="addRequestSample(request_form,$event)">确定添加
                                </button>

                                <button class="btn btn-danger" type="button"
                                        ng-click="is_request_sample_add = false">取消添加
                                </button>

                            </div>
                        </div>
                    </div>

                </form>
            <#if user??>
                <div class="ng-cloak  m-0 p-0" ng-cloak
                     ng-hide="!request_form.$errors">
                    <div class="alert alert-danger fade show rounded-0" role="alert">
                        <button type="button" class="close" ng-click="change(request_form)">
                            <span aria-hidden="true">&times;</span>
                            <span class="sr-only">Close</span>
                        </button>
                        <strong>Message!</strong>
                        {{request_form.$errors}}
                    </div>

                </div>

                <div>
                    <button class="btn btn-outline-success"
                            ng-click="is_request_field_add = true">添加字段
                    </button>

                    <button class="btn btn-outline-warning"
                            ng-click="is_request_sample_add = true">添加示例
                    </button>
                </div>
            </#if>

            </section>

            <section>

            <#if sampleList??>
                <div class="card mt-1">
                    <div class="card-header">请求示例：</div>
                    <div class="card-block">
                        <div id="request-sampleList-tab">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <#list sampleList as item>
                                    <#if item.sampletype=="Request">
                                        <li class="nav-item">
                                            <a class="nav-link" data-toggle="tab" href="#tab-${item.id}"
                                               role="tab">${item.title}</a>
                                        </li>
                                    </#if>
                                </#list>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <#list sampleList as item>
                                    <#if item.sampletype=="Request">
                                        <div class="tab-pane fade" id="tab-${item.id}" role="tabpanel">
                                            <textarea class="form-control" rows="15" readonly> ${item.content}</textarea>
                                        </div>
                                    </#if>
                                </#list>
                            </div>

                        </div>
                    </div>
                </div>
            </#if>
            </section>

            <hr/>


            <section>

                <h5>返回参数：</h5>
                <form name="response_form">
                    <table class="table table-striped table-bordered table-hover ">
                    <#--<thead class="thead-inverse">  -->
                        <thead class="bg-info">
                        <tr>
                            <th>Name</th>
                            <th>Type</th>
                            <th>Describe</th>
                            <th>DefaultValue</th>
                        <#if user??>
                            <th>
                                编辑
                            </th>
                        </#if>
                        </tr>
                        </thead>
                        <tbody id="response_${doc.id}_tbody">
                        <#if fieldList??>
                            <#list fieldList as item>
                                <#if item.parametertype=="Response">
                                <tr>
                                    <td>${item.fieldname}</td>
                                    <td>${item.fieldtypename}</td>
                                    <td>${item.describes}</td>
                                    <td>
                                        <#if item.defaultvalue??>${item.defaultvalue}</#if>
                                    </td>
                                    <#if user??>
                                        <td>
                                            <div class="btn-group">
                                                <button class="btn btn-outline-info btn-sm"
                                                        ng-click="updateField(response_form,$event)">
                                                    修改
                                                </button>
                                                <button class="btn btn-outline-danger btn-sm"
                                                        ng-click="deleteField(response_form,'${item.id}',$event)">
                                                    删除
                                                </button>
                                            </div>
                                        </td>
                                    </#if>
                                </tr>
                                </#if>
                            </#list>
                        </#if>
                        <#if user??>
                        <tr ng-show="is_response_field_add" class="ng-cloak" ng-cloak>
                            <td class="p-0">
                                <input class="form-control" name="fieldName" type="text"
                                       placeholder="FieldName" ng-change="change(response_form)"
                                       ng-model="responseField_add.fieldname" required="">

                                </input>
                            </td>
                            <td class="p-0">
                                <input class="form-control" type="text" name="fieldTypeName"
                                       placeholder="FieldTypeName" ng-change="change(response_form)"
                                       ng-model="responseField_add.fieldtypename" required="">
                                </input>
                            </td>


                            <td class="p-0">
                            <textarea class="form-control m-0" name="describe"
                                      placeholder="Describe"
                                      ng-model="responseField_add.describes"></textarea></td>

                            <td class="p-0">
                            <textarea class="form-control m-0" name="defaultValue"
                                      placeholder="DefaultValue"
                                      ng-model="responseField_add.defaultvalue"></textarea></td>
                            <td>
                                <div class="btn-group">
                                    <button class="btn btn-outline-success btn-sm" type="button"
                                            ng-click="addResponseField(response_form,$event)">确定
                                    </button>
                                    <button class="btn btn-outline-warning btn-sm" type="button"
                                            ng-click="is_response_field_add = false">取消
                                    </button>
                                </div>
                            </td>
                        </tr>
                        </#if>
                        </tbody>
                    </table>
                    <div ng-show="is_response_sample_add " class="ng-cloak" ng-cloak>

                        <div class="form-group row">
                            <label class="col-sm-2">标题：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="title"
                                       ng-model="responseSample_add.title" ng-change="change(response_form)"
                                       placeholder="Title" required=""/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2">内容：</label>
                            <div class="col-sm-10">
                        <textarea class="form-control" name="content"
                                  ng-model="responseSample_add.content" ng-change="change(response_form)"
                                  placeholder="Content" required="">
                        </textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-10 ml-auto">
                                <button class="btn btn-success " type="button"
                                        ng-click="addResponseSample(response_form,$event)">确定添加
                                </button>

                                <button class="btn btn-danger" type="button"
                                        ng-click="is_response_sample_add = false">取消添加
                                </button>
                            </div>
                        </div>
                    </div>

                </form>
            <#if user??>

                <div class="ng-cloak  m-0 p-0" ng-cloak
                     ng-hide="!response_form.$errors">
                    <div class="alert alert-danger fade show rounded-0" role="alert">
                        <button type="button" class="close" ng-click="change(response_form)">
                            <span aria-hidden="true">&times;</span>
                            <span class="sr-only">Close</span>
                        </button>
                        <strong>Message!</strong>
                        {{response_form.$errors}}
                    </div>

                </div>

                <div>
                    <button class="btn btn-outline-info"
                            ng-click="is_response_field_add = true">添加字段
                    </button>

                    <button class="btn btn-outline-primary"
                            ng-click="is_response_sample_add = true">添加示例
                    </button>
                </div>

            </#if>

            </section>
            <section>
            <#if sampleList??>
                <div class="card mt-1">
                    <div class="card-header">返回示例：</div>
                    <div class="card-block">
                        <div id="response-sampleList-tab">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <#list sampleList as item>
                                    <#if item.sampletype=="Response">
                                        <li class="nav-item">
                                            <a class="nav-link" data-toggle="tab" href="#tab-${item.id}"
                                               role="tab">${item.title}</a>
                                        </li>
                                    </#if>
                                </#list>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <#list sampleList as item>
                                    <#if item.sampletype=="Response">
                                        <div class="tab-pane fade" id="tab-${item.id}" role="tabpanel">
                                            <textarea class="form-control" rows="15" readonly> ${item.content}</textarea>
                                        </div>
                                    </#if>
                                </#list>
                            </div>

                        </div>
                    </div>
                </div>
            </#if>
            </section>

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