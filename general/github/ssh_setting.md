# SSH setting for github (When `git@github.com: Permission denied (publickey)` is occured and cannot push to github)

## 1. generate public key for your github email address
```
$ ssh-keygen -t rsa -C "your_email@example.com"

Enter file in which to save the key (/home/vagrant/.ssh/id_rsa):
  -> press enter to let it save in dafault path
Enter passphrase (empty for no passphrase):
  -> press enter
Enter same passphrase again:
  -> press enter

```
. `ssh-keygen` is a command for generating certification key

. `-t rsa` is for creating RSA type encryption key

## 2. add key to ssh-agent
```
ssh-add -K ~/.ssh/github
```
What is the SSH agent?
`ssh-agent` is a key manager for SSH.
It holds your keys and certificates in memory, unencrypted, and ready for use by ssh.
It saves you from typing a passphrase every time you connect to a server.
It runs in the background on your system, separately from ssh, and it usually starts up the first time you run ssh after a reboot.

The SSH agent keeps private keys safe because of what it doesn’t do:

1. It doesn’t write any key material to disk.
2. It doesn’t allow your private keys to be exported.
Private keys stored in the agent can only be used for one purpose: signing a message.
ref: https://smallstep.com/blog/ssh-agent-explained/

## 3. confirm
```
$ ssh-add -l
```

## 4. copy created key
```
$ ls ~/.ssh/

id_rsa id_rsa.pub

$ less ~/.ssh/id_rsa.pub

ssh-rsa xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx mail@mail.com

```
. `id_rsa` is private key
. `id_rsa.pub` is public key

## 5. add to github
ref here: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

## 6. confirm connecting
```
ssh -T git@github.com
```
