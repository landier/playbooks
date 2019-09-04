[![Build Status](https://travis-ci.com/landier/playbooks.svg?branch=master)](https://travis-ci.com/landier/playbooks)

# Install OS
## Core OS
Boot on a Linux Live then, in a terminal type:
```
curl https://raw.githubusercontent.com/landier/playbooks/master/boot/bootstrap.sh | sh
```
or
```
curl -L http://boot.landier.net/ | sh
```

# Provision machines
## Requirements
- sshpass:
  - Mac OS X:
  ```
  brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb
  ```

## Workstation - locally
```
ansible-playbook local-desktop.yml -c localhost --ask-become-pass
```

## LAN
```
ansible-playbook -i inventory.ini lan.yml
```

# Dev
## Local testing
```
make test [PLAYBOOK=lan.yml] [LIMIT=workstation] [TAGS=all] [OPTS=-vvvv]
```
