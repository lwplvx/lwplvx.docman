<section>

<#if sampleList??>
    <div class="card mt-1">
        <div class="card-header">请求示例：</div>
        <div class="card-block">
            <div id="request-sampleList-tab">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <#list sampleList as item>
                        <#if item.sampletype=="Request">
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tab-${item.id}"
                                   role="tab">${item.title}
                                    <#if user??>
                                        <button type="button" class="close ml-2" aria-label="Close"
                                                ng-click="deleteSample(response_form,'${item.id}','${item.title}')">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </#if>
                                </a>
                            </li>
                        </#if>
                    </#list>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                    <#list sampleList as item>
                        <#if item.sampletype=="Request">
                            <div class="tab-pane fade" id="tab-${item.id}" role="tabpanel">
                                            <textarea class="form-control" rows="15"
                                                      readonly> ${item.content}</textarea>
                            </div>
                        </#if>
                    </#list>
                </div>

            </div>
        </div>
    </div>
</#if>
</section>