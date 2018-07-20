msg() { echo -e "--- $@ ---" ; }
err() { echo -e "ERROR >> ### $@ ###" 1>&2; }
exit_err() {
  err ${1}
  err "Aborting..."
  exit 1
}

check_exist() {
  local not_exist=()
  for prg; do
    if ! command -v ${prg} >/dev/null 2>&1; then
      not_exist+=("${prg}")
    fi
  done
  echo ${not_exist[@]}
  return ${#not_exist[@]}
}