# Unattended Ubuntu install
Via [Netboot](https://netboot.xyz/) or [Ubuntu ISO](https://www.ubuntu.com/download/server), trigger a seeded install using the *unattended.seed* config file.

# Ansibble playbooks
After OS is installed, execute following playbooks:

## optiplex.yml
```
ansible-playbook -i inventory.ini optiplex.yml --ask-pass --ask-become-pass
```
# Ansible roles
## password role
To set password hash:
```
sudo pip install passlib
python -c "from passlib.hash import sha512_crypt; import getpass; print sha512_crypt.encrypt(getpass.getpass())"
```
