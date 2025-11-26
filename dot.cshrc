#!/bin/csh
#####################################################################
#                                                                   #
#  DO NOT CHANGE THIS FILE                                          #
#                                                                   #
#  If you want to set various csh features (ie, 'set' commands,     #
#  and aliases), put them into a .cshrc.aliases file in your home   #
#  directory.  Be sure and do 'chmod +x .cshrc.aliases' when you    #
#  create it.                                                       #
#                                                                   #
#####################################################################
setenv OS `uname`
if ( "$OS" != "Linux" ) then
  alias ps 'ps -o ruser,pid,pcpu,pmem,vsz,nice,s,stime,time,args'
endif
if ($?prompt) then
  set filec
  set notify
  #set prompt="`/bin/hostname | sed 's/\..*//'`% "
  #set prompt="[%m] %/ % "
  set prompt="[%{\033[1;36m%}%m%{\033[0m%}] %{\033[1;37m%}%/ \%%{\e[0m%} "
  set history   = 100
  set savehist  = $history
#  alias rm     rm -i
#  alias mv     mv -i
#  alias cp     cp -i
  alias cd      'cd \!*;echo $cwd'
endif

#####################################################################
#                                                                   #
#  This is where your ~/.cshrc.aliases file gets invoked.  See      #
#  above for things to put in it.                                   #
#                                                                   #
#####################################################################

set DEPARTMENT=goncalo
#   Check for DEPARTMENT script on any kind of system
if ( -e /usr/cluster/etc/$DEPARTMENT.csh ) then
  source /usr/cluster/etc/$DEPARTMENT.csh
else if ( -e /group/boehnke/etc/$DEPARTMENT.csh ) then
  source /group/boehnke/etc/$DEPARTMENT.csh
else if ( -e /group/csg/etc/$DEPARTMENT.csh ) then
  source /group/csg/etc/$DEPARTMENT.csh
else
  if ($?prompt) then
    echo "CSH unable to source DEPARTMENT script ($DEPARTMENT)"
  endif
endif

if ( -e ~/.cshrc.aliases ) source ~/.cshrc.aliases

