# Requirements
- sshpass:
  - Mac OS X:
  ```
  brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb
  ```

# Unattended Ubuntu install
Via [Netboot](https://netboot.xyz/) or [Ubuntu ISO](https://www.ubuntu.com/download/server), trigger a seeded install using the *unattended.seed* config file.

# Ansibble playbooks
After OS is installed, execute following playbooks:

## optiplex.yml
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

# Not managed
## Install fonts
https://github.com/powerline/fonts
