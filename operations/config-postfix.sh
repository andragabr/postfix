#!/bin/bash

mkdir -p /etc/postfix

kaigara render main.cf > /etc/postfix/main.cf
kaigara render virtual > /etc/postfix/virtual
