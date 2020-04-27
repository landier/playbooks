[![Build Status](https://travis-ci.com/landier/playbooks.svg?branch=master)](https://travis-ci.com/landier/playbooks)

# Install OS
## Fedora CoreOS
Boot on a Fedora CoreOS Live then:
```
curl -LO https://raw.githubusercontent.com/landier/playbooks/master/boot/ignition.fcc
podman run -i --rm quay.io/coreos/fcct:release --pretty --strict < ignition.fcc > ignition.ign
sudo coreos-installer install /dev/sda -i ignition.ign
sudo reboot
```

Source: https://docs.fedoraproject.org/en-US/fedora-coreos/bare-metal/

# Provision machines
## Requirements
- sshpass:
  - Mac OS X:
  ```
  brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb
  ```

## Workstation - locally
```
ansible-playbook local.yml -c localhost --ask-become-pass
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
