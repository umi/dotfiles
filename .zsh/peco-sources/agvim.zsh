function agvim () {
	print -z vim $(ag "$@" | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}


