#!/bin/bash

for file in "$@"
do
  FILE_NAME=($basename $file)
  echo "================" && echo "File = ${FILE_NAME}"

  WIN_COUNT=0
  LIN_COUNT=0
  OTHER_OS_COUNT=0
  PROD_COUNT=0
  DEV_COUNT=0
  OTHER_ENV_COUNT=0

  while read -r line; do
    ENV=${line:5:1}
    OS=${line:6:1}
    case $ENV in
      d)
        ((DEV_COUNT++))
        ;;
      p)
        ((PROD_COUNT++))
        ;;
      *)
        ((OTHER_ENV_COUNT++))
        ;;
    esac

    case $OS in
      w)
        ((WIN_COUNT++))
        ;;
      l)
        ((LIN_COUNT++))
        ;;
      *)
        ((OTHER_OS_COUNT++))
        ;;
    esac
  done < $file
  cat <<EOF
OS Windows = $WIN_COUNT
OS Linux   = $LIN_COUNT
OS Other   = $OTHER_OS_COUNT
Environment Production  = $DEV_COUNT
Environment Development = $PROD_COUNT
Environment Other       = $OTHER_ENV_COUNT
EOF
done
