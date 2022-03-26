# git & github

- git is a popular version control system (VCS)

- Difference Between Git and GitHub
see: https://www.geeksforgeeks.org/difference-between-git-and-github/

## 1. Installing Git

```
#Window
see: https://gitforwindows.org/

#Mac
brew install git
```

Ref: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

## 2. First-Time Git Setup

###  List configuration
```
$ git config --list --show-origin
```

### Setup
```
$ git config --global user.name 'user1'
$ git config --global user.email example_user@gmail.com
```

### Checking configuration file

```
#Window
C:\Users\$USER

or

[path]/etc/gitconfig

# Mac
$cat ~/.gitconfig
```

### Checking Your Settings
```
git config --list
```

ref: https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup

