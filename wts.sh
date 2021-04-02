#!/bin/sh
if [ -n "$1" ]; then
  PATH_VAR=$1
else
  echo This script uses grep and regex to locate recursively web templates allowing unsafe\/unescaped data injection
  echo usage  .\/wts.sh \<root folder\>
	echo e.g.  .\/wts.sh .   or  .\/wts.sh \/src\/myproject\/src\/templates
	echo it is recommended that you specify the directory with the templates, otherwise you may get many false positives from libraries, eg npm modules
	exit
fi
echo scanning  $PATH_VAR and its subdirectories

 # check for mustache / handlebars templates
 grep -r -n  -E ".*{{&.*}}.*" $PATH_VAR
 grep -r -n  -E ".*{{{.*}}}.*" $PATH_VAR

 # check for handlebars filters excluding any entries with escaping filters
 # you may need to customise to exclude/include custom filters you may have
 grep -r -v -E ".*{{.+escape.*}}" $PATH_VAR |grep -n  -E  ".*{{.*\|\s*safe.*}}"
 grep -r -n -E ".*<#noautoesc>.*" $PATH_VAR
 # check for themeleaf templates
 grep -r -n -E ".*th:utext.*" $PATH_VAR
 # check for django templates
 grep -r -n -E ".*{{.*\|\s*safe.*}}" $PATH_VAR
  # check for pug/jade templates
 grep -r  -v "{{" $PATH_VAR |grep -n -E ".*\!{.+"
  #check for ejs templates
 grep -r -n  -E ".*<%-.+%>.*" $PATH_VAR
 # check for twig templates
 grep -r -n  -E ".*\|\s*raw\s*}}.*" $PATH_VAR
 #checks autoescape off in Django and twig templates
 grep -r -n  -E ".*{%\s*autoescape\s*off\s*%}.*"  $PATH_VAR

