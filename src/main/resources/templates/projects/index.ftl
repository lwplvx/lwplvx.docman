

<#assign layout="/shared/_layout.ftl"/>

<#assign title="Projects"/>

<#assign renderBody>

<div class="container-fluid ">
    <section>
        <#if projectList??>
            <#list projectList as pro>
                <div>
                    <span>${pro.id}</span>
                    <span>${pro.describes}</span>
                    <span>${pro.projectName}</span>
                    <a href="${pro.projectName}/apps/">App projectName 管理</a>
                </div>
            </#list>
        </#if>

    </section>
</div>

</#assign>

<!-- page specific plugin scripts -->
<#assign specificScripts>


</#assign>
