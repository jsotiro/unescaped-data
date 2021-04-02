# Unescaped Data
A repository of samples demonstrating insecure injection of data into web templates that lead to XSS and a simple shell script to grep them using regular expressions.

In all cases the insecure data injection happens with
- Use of web template to inject server data
- Disabling or not using html escaping of the data passed

This can either be in HTML output directly or to inline scripts. 

The purpose of the samples is to 
-  demonstrate how this applies to various templates
-  provide simple test samples to evaluate how effectively SAST and DAST tools detect this anti-pattern.

The samples are grouped by language/app runtime and include:
- Python with **Django** 
- PHP both plain **PHP** and using **twig**
- SpringBoot with **ThemeLeaf**, **Mustache**, **Freemarker**, and **Groovy templates**
- Node.js with **handlebars**, **jade**, and **pug**
- (TBA) ASP.NET with **razor** 

Some early tests with SonarCube shows that the community edition will not detect any whereas the developer edition (in sonarcloud) will only detect the plain PHP and not Twig or any other template

The bash script wts.sh uses regular expressions to grep and show files and line numbers for a  directory and its sub-directories. You need to make it executable first.

usage
**.\wts.sh <root_folder>**

e.g.

**.\wts.sh .**  
**.\wts.sh ~/src/myproject/templates**


Summary of how each template engine allows unescaping:

|Template |Look for  | Comments|
|--- | --- | ---
|**django**| {{data &#124; **_safe_**}} or  {{data &#124; _**datasafeseq**_}} for sequence items  - Alternatively,   auto-escape off can be turned off for a section using {% autoescape off %}{{ title:escape }}{% endautoescape %} |[Documentation](https://docs.djangoproject.com/en/3.0/ref/templates/builtins/#std:templatefilter-safe)|
|**Plain PHP**|unsescaped by default. Look for _echo $var_. Using json_encode not always safe, e.g. '<?php $output = '<!--<script>'; echo json_encode($output); ?> Solution to Use JSON_HEX_TAG to escape < and > (requires PHP 5.3.0).   |See discussion on [StackOverflow](https://stackoverflow.com/questions/23740548/how-do-i-pass-variables-and-data-from-php-to-javascript) |
|**twig**|a|[Documentation](https://twig.symfony.com/doc/3.x/tags/autoescape.html)|
|**ThemeLeaf**|**_th:utext_**=${..}|[Documentation](https://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html#unescaped-text)|
|**Mustache**|**_{{{_**.._**}}}**_ or {{**_&_**..}}|[Documentation](https://mustache.github.io/mustache.5.html)|
|**Freemarker**|<#ftl output_format="XML" **auto_esc=false**> /  **<#noautoesc>**..${data}..**</#noautoesc>**|applies to template / block [Documentation](https://freemarker.apache.org/docs/ref_directive_noautoesc.html)|
|**Groovy Templates**|_**yieldUnescaped**_|[Documentation](https://spring.io/blog/2014/05/28/using-the-innovative-groovy-template-engine-in-spring-boot)|
|**handlebars**|mustache-compatible, custom filters|[Documentation](https://handlebarsjs.com/guide/#html-escaping)|
|**pug/jade**|_**!**_{data}|[Documentation](https://pugjs.org/language/interpolation.html)|
|**Ejs**|**_<%-_**data%_**>**_ instead of <%=data%>|[Documentation](https://ejs.co/index.html#docs)|
|**razor**|html.raw() and @{ var myHtmlString = new HtmlString(mystring);}@myHtmlString|[More info](https://www.xspdf.com/resolution/21307806.html) |



