# Unescaped Data
A repository of samples demonstrating insecure injection of data into web templates that lead to XSS or in some cases server crash (see PHP example 2)

In all cases the insecure data injection happens with
- Use of web template to inject server data
- Disabling or not using html escaping of the data passed

The purpose of the samples is to 
-  demostrate how this applies to various templates
-  provide simple test samples to evaluate how effectively SAST and DAST tools detect this anti-pattern.

The samples are grouped by language/app runtime and include:
- Python with **Django** 
- PHP both plain **PHP** and using **twig**
- SpringBoot with **ThemeLeaf**, **Mustache**, **Freemarker**, and **Groovy templates**
- Node.js with **handlebars**, **jade**, and **pug**
- ASP.NET with **razor** 

A summary table of how each template engine allows unescaping is below:


|Template |Look for  | Comments|
|--- | --- | ---
|**django**| {{data &#124; **_safe_**}} or  {{data &#124; _**datasafeseq**_}} for sequence items  - Alternatively,   auto-escape off can be turned off for a section using {% autoescape off %}{{ title:escape }}{% endautoescape %} |[Documentation entries](https://docs.djangoproject.com/en/3.0/ref/templates/builtins/#std:templatefilter-safe)|
|**Plain PHP**|unsescaped by default.|jsonencode is used to encode data passed|
|**twigg**|||
|**ThemeLeaf**|**_th:utext_**=${..}||
|**Mustache**|**_{{{_**.._**}}}**_ or {{**_&_**..}}||
|**Freemarker**|**<#noautoesc>**..${data}..**</#noautoesc>**|applies to a block|
|**Groovy Templates**|_**yieldUnescaped**_||
|**handlebars**|mustache-compatible, custom filters||
|**pug**|_**!**_{data}||
|**Ejs**|**_<%-_**data%_**>**_ instead of <%=data%>||
|**razor**|||



