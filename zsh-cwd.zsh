#!/bin/zsh
emulate -L zsh
alias cwd="_cwd::cd"
alias rwd="_cwd::record"

readonly NO_STATE=1
readonly DIR_GONE=2

function _cwd::loc_state
{
  echo "${ZSH_CWD_LOCATION:-$HOME/.cwd}"
}

function _cwd::set_state
{
  local state="$(_cwd::loc_state)"
  echo "$1" > "$state"
}

function _cwd::get_state
{
  local loc="$(_cwd::loc_state)"
  if [ ! -f $loc ]; 
  then
    return $NO_STATE
  fi

  local wd=$(cat "$loc")
  if [ ! -d $wd ];
  then
    return $DIR_GONE
  fi

  echo "$wd"
}

function _cwd::record 
{
  _cwd::set_state "$(pwd)"
}

function _cwd::cd 
{
  local wd="$(_cwd::get_state)"
  if [[ $? ]]
  then
    cd "$wd"
  fi
}

function _cwd::hook 
{
  chpwd_functions=(${chpwd_functions[@]} _cwd::record)
}

function _cwd::unhook 
{
  chpwd_functions=(${chpwd_functions:#_cwd::record})
}

function _cwd::init 
{
  _cwd::hook
}
