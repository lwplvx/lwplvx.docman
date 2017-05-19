<#assign layout="shared/_layout.ftl"/>
<#assign title="Testing"/>


<#assign renderBody>

<div class="container-fluid pb-5" ng-app="docmanApp" ng-controller="documentTestCtrl">

    <div class="row">
        <div class="col-sm-11 m-auto">
            <section>
                <#if doc??>
                    <div>
                        <h4>${doc.documentname}

                        </h4>
                        <p>
                        <h6>说明：
                        ${doc.describes}</h6></p>
                        <p>
                        <h6>接口地址：
                            <small>${doc.requestpath}</small>
                            <input class="form-control" ng-model="url" type="text">

                            </input>
                        </h6>

                        </p>
                        <p>
                        <h6>Method：
                            <small>${doc.httpmethod}</small>
                            <input class="form-control" ng-model="method" type="text">
                            </input>
                        </h6>

                        </p>
                    </div>
                </#if>
            </section>

            <div>
<textarea class="form-control" rows="5"
          ng-change="change()" name="requestData" ng-model="testData.request">

</textarea>

            </div>


            <div class="ng-cloak  m-0 p-0" ng-cloak
                 ng-hide="!errorMessage">
                <div class="alert alert-danger fade show rounded-0" role="alert">
                    <button type="button" class="close" ng-click="change()">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only">Close</span>
                    </button>
                    <strong>Message!</strong>
                    {{errorMessage}}
                </div>

            </div>


            <div class="form-group">
                <hr/>
                <button ng-click="test($event)"
                        class="btn btn-outline-primary">发送
                </button>

                <hr/>
            </div>


            <div>

<textarea class="form-control" rows="5" name="responseData" ng-model="testData.response">


</textarea>


            </div>


            <hr/>

            <div>
                <#include "requestFieldTest.ftl"/>
            </div>
            <hr/>
            <div>

                <#include "responseFieldTest.ftl"/>

            </div>

        </div>
    </div>
</div>

</#assign>




<!-- page specific plugin scripts -->
<#assign specificScripts>

<script>

    var requestpath = '${doc.requestpath}';
    var httpmethod = '${doc.httpmethod}';

</script>

<script src="${request.contextPath}/static/js/angular.min.js"></script>
<script src="${request.contextPath}/static/js/angular-route.min.js"></script>
<script src="${request.contextPath}/static/js/app/app.js"></script>
<script src="${request.contextPath}/static/js/app/controller.js"></script>

</#assign>