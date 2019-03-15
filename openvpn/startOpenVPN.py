#!/usr/bin/env python

import pexpect
import yaml
import sys
import commands
import time

# Gathering credentials
PATH = "<path_on_filesystem>"
cred_file = open(PATH+"credentials.yaml", 'r')
auth_file = open(PATH+"auth.yaml", 'r')
credential = yaml.load(cred_file)
passcode = yaml.load(auth_file)
cred_file.close()
auth_file.close()
client_file = "<client_file>"

# Authenticating
user = credential["creds"]["username"]
passw = credential["creds"]["password"]
auth_key = passcode["auth"]["vpn"]
vpn_conn = pexpect.spawn("openvpn", ["--config", PATH+client_file])
vpn_conn.expect(".*Username.*")
time.sleep(1)
vpn_conn.send(user+'\r')
vpn_conn.expect(".*Password.*")
time.sleep(1)
vpn_conn.send(passw+'\r')
vpn_conn.expect(".*Google Authenticator Code.*")
time.sleep(1)
auth = commands.getoutput("oathtool --totp -b %s" % auth_key)
vpn_conn.send(auth+'\r')
vpn_conn.interact()
