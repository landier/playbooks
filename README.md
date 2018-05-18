# playbooks
Ansible playbooks and roles

## optiplex.yml
```
ansible-playbook -i inventory.ini optiplex.yml --ask-pass --ask-become-pass
```

## password role
'''
sudo pip install passlib
python -c "from passlib.hash import sha512_crypt; import getpass; print sha512_crypt.encrypt(getpass.getpass())"
'''
