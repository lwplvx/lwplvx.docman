<div id="accordion" role="tablist">

<#if groups??>
    <#if docList??>

        <#list groups as group>

            <div class="card">

                <a data-toggle="collapse" data-parent="#accordion" href="#collapse-${group}"
                   aria-expanded="true" class="card-header" role="tab" id="heading-${group}"
                   aria-controls="${group}">
                ${group}
                </a>

                <#if doc.groupname==group>
                    <div id="collapse-${group}" class="collapse show" role="tabpanel"
                         aria-labelledby="heading-${group}">

                        <#list docList as item>
                            <#if item.groupname==group>
                                <#if doc.documentname==item.documentname>
                                    <div title="${item.httpmethod},${item.requestpath}"
                                         class="list-group-item text-success rounded-0">

                                        <small class="ml-3"> ${item.documentname}</small>

                                    </div>

                                <#else>
                                    <a href="${item.documentname}"
                                       title="${item.httpmethod},${item.requestpath}"
                                       class="list-group-item list-group-item-action">

                                        <small class="ml-3"> ${item.documentname}</small>

                                    </a>

                                </#if>

                            </#if>
                        </#list>
                    </div>

                <#else>
                    <div id="collapse-${group}" class="collapse" role="tabpanel"
                         aria-labelledby="heading-${group}">

                        <#list docList as item>
                            <#if item.groupname==group>
                                <#if doc.documentname==item.documentname>
                                    <div title="${item.httpmethod},${item.requestpath}"
                                         class="list-group-item text-success rounded-0">

                                        <small class="ml-3"> ${item.documentname}</small>

                                    </div>

                                <#else>
                                    <a href="${item.documentname}"
                                       title="${item.httpmethod},${item.requestpath}"
                                       class="list-group-item list-group-item-action">

                                        <small class="ml-3"> ${item.documentname}</small>

                                    </a>

                                </#if>

                            </#if>
                        </#list>
                    </div>
                </#if>

            </div>



        </#list>

    </#if>
</#if>


</div>


