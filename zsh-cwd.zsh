emulate -L zsh

local -a cmd
cwd=${ZSH_CWD_LOCATION:-$HOME/.cwd}

function cwd::record {
  pwd > $cwd
}

function cwd::init {
  chpwd_functions=(${chpwd_functions[@]} cwd::record_cwd)
}
