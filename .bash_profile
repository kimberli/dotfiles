# if this is an interactive shell
if [[ $- == *i* ]]; then
   # if there is actually a zsh command available
   if [[ -x `which zsh 2>/dev/null` ]]; then
      # avoid spawning zsh every time bash is started...
      if [ -z $ZSH_STARTED ]; then
          export ZSH_STARTED="true"
          # if the call to zsh fails, scp a different conf there
          exec zsh
      fi
   fi
fi
