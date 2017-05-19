


   <section>

        <h5>请求参数：</h5>
        <form name="request_form">
            <table class="table table-striped table-bordered table-hover ">
            <#--<thead class="thead-inverse">  -->
                <thead class="bg-info">
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

