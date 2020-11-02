emulate -L zsh
alias cwd="_cwd::cd"
alias rwd="_cwd::record"

function _cwd::record {
  local state=${ZSH_CWD_LOCATION:-$HOME/.cwd}
  pwd > "$state"
}

function _cwd::cd {
  local state=${ZSH_CWD_LOCATION:-$HOME/.cwd}
  if [ -f $state ];
  then
    cd $(cat "$state")
  fi
}

function _cwd::init {
  chpwd_functions=(${chpwd_functions[@]} _cwd::record)
}

_cwd::init
