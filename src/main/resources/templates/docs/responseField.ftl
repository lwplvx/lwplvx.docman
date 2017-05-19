



 <section>

                <h5>返回参数：</h5>
                <form name="response_form">
                    <table class="table table-striped table-bordered table-hover ">
                    <#--<thead class="thead-inverse">  -->
                        <thead class="bg-success">
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
