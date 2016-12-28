#!/bin/bash

mkdir -p /etc/postfix

kaigara render main.cf > /etc/postfix/main.cf
kaigara render master.cf > /etc/postfix/master.cf
kaigara render virtual > /etc/postfix/virtual

if [[ ! -f /etc/postfix/sasl_passwd.db ]]; then
  kaigara render sasl_passwd >> /etc/postfix/sasl_passwd
  postmap /etc/postfix/sasl_passwd
  rm /etc/postfix/sasl_passwd
  chmod 600 /etc/postfix/sasl_passwd.db
  ls -la /etc/postfix/sasl_passwd.db
fi
