emulate -L zsh
alias cwd="_cwd::cd"
alias rwd="_cwd::record"

readonly no_state=1
readonly dir_gone=2

function _cwd::set_state
{
  local state=${ZSH_CWD_LOCATION:-$HOME/.cwd}
  echo "$1" > "$state"
}

function _cwd::get_state
{
  local state=${ZSH_CWD_LOCATION:-$HOME/.cwd}
  if [ ! -f $state ];
  then
    return $no_state
  fi

  local wd=$(cat "$state")
  if [ ! -d $wd ];
  then
    return $dir_gone
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
