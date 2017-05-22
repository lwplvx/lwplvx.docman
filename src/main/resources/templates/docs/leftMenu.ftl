<div id="accordion" role="tablist">

<#if groups??>
    <#if docList??>

        <#list groups as group>
            <#if group??>

                <div class="card rounded-0 border-bottom-0">

                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-${group}"
                       aria-expanded="true" class="card-header rounded-0" role="tab" id="heading-${group}"
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
                                             class="list-group-item text-success rounded-0 border-0">

                                            <small class="ml-3"> ${item.documentname}</small>

                                        </div>

                                    <#else>
                                        <a href="${item.documentname}"
                                           title="${item.httpmethod},${item.requestpath}"
                                           class="list-group-item list-group-item-action rounded-0 border-0">

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
                                             class="list-group-item text-success rounded-0 border-0">

                                            <small class="ml-3"> ${item.documentname}</small>

                                        </div>

                                    <#else>
                                        <a href="${item.documentname}"
                                           title="${item.httpmethod},${item.requestpath}"
                                           class="list-group-item list-group-item-action rounded-0 border-0">

                                            <small class="ml-3"> ${item.documentname}</small>

                                        </a>

                                    </#if>

                                </#if>
                            </#list>
                        </div>
                    </#if>

                </div>


            </#if>

        </#list>

    </#if>
</#if>


</div>


