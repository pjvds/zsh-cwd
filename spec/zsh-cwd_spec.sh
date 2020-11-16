Describe "cwd"
  Include "./zsh-cwd.zsh"

  Describe "set_state"
    It "stores wd state"
      set_state() {
        export ZSH_CWD_LOCATION=$(mktemp)
        _cwd::set_state "state"
      }

      When call set_state
      The file "$ZSH_CWD_LOCATION" should be exist
      The status should be success
    End
  End

  Describe "get_state"
    It "retrieves wd state"
      get_state() {
        export ZSH_CWD_LOCATION=$(mktemp)
        _cwd::set_state "$PWD"
        echo $(_cwd::get_state)
      }


      When call get_state
      The output should equal "$PWD"
    End
  End

End
