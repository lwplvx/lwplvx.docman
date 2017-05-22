<#assign layout="shared/_layout.ftl"/>
<#assign title="docs"/>

<#assign renderBody>

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
                    <label class="col-sm-2">GroupName：</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="groupname"
                               ng-model="document_add.groupname"
                               placeholder="GroupName" required=""
                        /></div>
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

        <#if groups??>

            <#list groups as group>
                <#if docList??>
                    <div class="card">
                        <div class="card-header bg-success">${group}</div>
                        <div class="row card-block">
                            <#list docList as doc>
                                <#if doc.groupname==group>
                                    <div class="col-sm-4 mb-1">
                                        <div class="card-block card">
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
                                                    <small style="word-wrap:break-word">${doc.requestpath}</small>
                                                </h6>
                                            </div>
                                            <div class="form-inline">

                                                <#if user??>
                                                    <button class="btn btn-outline-danger btn-sm "
                                                            ng-click="deleteDocument('${doc.id}','${doc.documentname}')">
                                                        删除
                                                    </button>
                                                </#if>
                                                <a class="ml-auto"
                                                   href="${request.contextPath}/${project.projectName}/${app.appName}/docs/${doc.documentname}">
                                                    查看
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </#if>
                            </#list>
                        </div>
                    </div>
                </#if>
            </#list>
        </#if>
    </section>

    <#include "deleteModal.ftl"/>
</div>

</#assign>


<!-- page specific plugin scripts -->
<#assign specificScripts>

    <#if user??>
    <script>
        var serverPath = "${request.contextPath}";
    </script>
    <script src="${request.contextPath}/static/js/angular.min.js"></script>
    <script src="${request.contextPath}/static/js/angular-route.min.js"></script>
    <script src="${request.contextPath}/static/js/app/app.js"></script>
    <script src="${request.contextPath}/static/js/app/controller.js"></script>
    </#if>

</#assign>