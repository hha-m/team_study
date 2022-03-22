# Installing Golang on MacOS

1. Check whether `go` is already installed or not.
```
$ go version
```

2. If there is already installed but you want to update version or you have no `go` on your pc, download specific version from the following site and install on your machine.

   https://go.dev/dl/

or, you can install using homebrew

```
$ brew update

$ brew install golang
```

3. After completing ther installation process, check go version on terminal.

```
$ go version
```

# Set up `Go` Workspace
1. Make a folder with `go` in somewhere you like. (I created in the workspace folder under my home directory)

> /Users/UserName/workspace/go

2. Add Environment variables into your shell config
```
$ echo "export GOPATH={YOUR_GO_FOLDER_PATH}" >> .bash_profile

eg. echo "export GOPATH=$HOME/workspace/go/" >> .bash_profile
```

3. Then, check your configured GOPATH
```
$ cat ~/.bash_profile
```
or, check with echo
```
$ source ~/.bash_profile
$ echo $GOPATH
```

4. Create your workspace
Create the workspace directories tree:
```
$ mkdir -p $GOPATH $GOPATH/src $GOPATH/pkg $GOPATH/bin
```
- $GOPATH/src : Where your Go projects / programs are located
- $GOPATH/pkg : contains every package objects
- $GOPATH/bin : The compiled binaries home

exercies for go:
- https://www.w3schools.com/go/exercise.php
- https://golangr.com/exercises/
