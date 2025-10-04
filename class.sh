#integerb33, 
#string,  devops,or anything no special chars
#boolean true/false
#float 10.5
#array  arr=(val1 val2 val3) list of names
#dictionary  declare -A dict=(["key1"]="value1" ["key2"]="value2")
#class  class_name(){...}  #not in bash but in other languages  
#function  func_name(){...}
#script  ./script.sh
#environment variable  export VAR_NAME=value
#special variable  $0,$1,$2,$@,$*, $$, $!, $#, etc
#system variable  PATH, HOME, PWD, USER, SHELL, etc

#types of variables in shell scripting
#1. local variable  #defined inside a script or function and accessible only within that script or function
#2. global variable  #defined outside any function and accessible anywhere in the script
#3. environment variable  #defined using export command and accessible to any child process or script
#4. special variable  #predefined variables that have special meaning in shell scripting  

==============================================
# $?  #exit status of last command
# $0  #name of the script
# 0 = success
# non-zero = failure

# 1-127 #general errors

# process to write a shell script
# 1 check root shebang line #!/bin/bash
# 2 check if root access or not
# 3 if root access then proceed else exit , otherwise stop and tell user to run as root


scripting / programming
==============================================
#keep it simple and less lines more performance
#reusable code
#DRY - don't repeat yourself

#FUNCTION
==============================================
#TAKE SOME INPUT= 
#1 CALL FUNCTION it 
#2 provide input to required function
#3 get output from function