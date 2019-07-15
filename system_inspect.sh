#!/bin/bash

function print_line {
  echo "================================"
}

function print_status {
  for SERVICE in $@
  do
    systemctl status --full $SERVICE
  done
}

print_line

print_status "ntpd" "sshd" "snmpd"

print_line

yum -y install cowsay &> /dev/null

yum info cowsay

print_line

journalctl -n 10
