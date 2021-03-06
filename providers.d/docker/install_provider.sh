#!/usr/bin/env bash

main() {

  local bin_name="docker";
  local dep_check_failed="false";

  for dep in \
             ${bin_name} \
             ; do
    which ${dep} &>/dev/null \
    || {
         echo "[FAIL] Can not proceed until ${dep} is installed and accessible in path.";
         local dep_check_failed="true";
       };
  done;
  if [[ "${dep_check_failed}" == "true" ]]; then
    echo "[FAIL] ${bin_name} provider can not be installed until missing dependencies are installed; exiting." \
    && exit 1;
  fi;
  echo "[INFO] ${bin_name} provider successfully installed.";
}

main
