function peco-ssh() {
  local selected_server=$(cat ~/.ssh/server_list/* | \
	  peco --query "$LBUFFER")
  print -z "ssh ${selected_server}"
}
alias ss="peco-ssh"
