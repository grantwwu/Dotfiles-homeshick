if [ $(df $HOME | tail -n 1 | awk '{print $1}') = "AFS" ]
then
  source $HOME/.zshenv_andrew
fi
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"
