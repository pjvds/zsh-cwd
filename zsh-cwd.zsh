emulate -L zsh

local -a cmd
cwd=${ZSH_CWD_LOCATION:-$HOME/.cwd}

function cwd::record {
  pwd > $cwd
}
