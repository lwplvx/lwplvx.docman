<#assign layout="shared/_layout.ftl"/>
<#assign title="doc"/>


<#assign renderBody>

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
                    <div >
                        <h4 class="form-inline">${doc.documentname}
                            <small class="ml-auto">
                                <a class="btn btn-outline-danger btn-sm"
                                   href="${request.contextPath}/${project.projectName}/${app.appName}/docs/${doc.documentname}/test"
                                   target="_test">
                                    测试
                                </a>
                            </small>
                        </h4>
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

</#assign>




<!-- page specific plugin scripts -->
<#assign specificScripts>

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
    <script src="${request.contextPath}/static/js/angular.min.js"></script>
    <script src="${request.contextPath}/static/js/angular-route.min.js"></script>
    <script src="${request.contextPath}/static/js/app/app.js"></script>
    <script src="${request.contextPath}/static/js/app/controller.js"></script>
    </#if>

</#assign>