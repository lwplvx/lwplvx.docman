


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

                        </tr>
                        </#if>
                    </#list>
                </#if>

                </tbody>
            </table>


        </form>

    </section>

