
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
