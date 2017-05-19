



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

                                </tr>
                                </#if>
                            </#list>
                        </#if>

                        </tbody>
                    </table>

                </form>


            </section>
