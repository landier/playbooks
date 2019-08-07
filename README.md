# Install OS
## Core OS
Boot on a Linux Live then, in a terminal type:
```
curl https://raw.githubusercontent.com/landier/playbooks/master/bootstrap.sh | sh
```
or
```
curl -L http://boot.landier.net/ | sh
```

## Ubuntu - seed-based unattended install
Via [Netboot](https://netboot.xyz/) or [Ubuntu ISO](https://www.ubuntu.com/download/server), trigger a seeded install using the *unattended.seed* config file: https://raw.githubusercontent.com/landier/playbooks/master/unattended.seed

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

## Gateway
```
ansible-playbook -i inventory.ini gateway.yml --ask-pass --ask-become-pass
```

## HTPC
```
ansible-playbook -i inventory.ini htpc.yml --ask-pass --ask-become-pass
```

## Optiplex
### First run - no SSH key deployed yet
```
ansible-playbook -i inventory.ini optiplex.yml --ask-pass --ask-become-pass
```

### Following runs
```
ansible-playbook -i inventory.ini optiplex.yml
```

# Ansible roles
## password role
To set password hash:
```
sudo pip install passlib
python -c "from passlib.hash import sha512_crypt; import getpass; print sha512_crypt.encrypt(getpass.getpass())"
```
