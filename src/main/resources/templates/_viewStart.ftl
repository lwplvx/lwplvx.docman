

<#if viewName??>
    <#include "${viewName}.ftl"/>
</#if>

<#if layout??>
    <#include "${layout}"/>
<#else>
    <#include "shared/_layout.ftl"/>
</#if>



<#--

<#if !Layout??>
    <#assign Layout="shared/_layout.ftl">
</#if>

@{
Layout = "~/Views/Shared/_Layout.cshtml";
}

@*@{
WebMail.SmtpServer = "mailserver.example.com";
WebMail.EnableSsl = true;
WebMail.UserName = "username@example.com";
WebMail.Password = "your-password";
WebMail.From = "your-name-here@example.com";
}*@-->
