emulate -L zsh
alias cwd="_cwd::cd"
alias rwd="_cwd::record"

function _cwd::record {
  local state=${ZSH_CWD_LOCATION:-$HOME/.cwd}
  pwd > "$state"
}

function _cwd::cd {
  local state=${ZSH_CWD_LOCATION:-$HOME/.cwd}
  if [ ! -f $state ];
  then
    return 1
  fi

  local cwd=$(cat "$state")
  if [ ! -d $cwd ];
  then
    return 2
  fi

  cd $cwd
}

function _cwd::init {
  chpwd_functions=(${chpwd_functions[@]} _cwd::record)
}
