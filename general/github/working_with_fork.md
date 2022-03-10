# About forks

A fork is a copy of a repository that you manage. Forks let you make changes to a project without affecting the original repository. You can fetch updates from or submit changes to the original repository with pull requests.

## Fork repository

1. On Github, click `fork` button on the top of menu of target upstream repository

2. On Terminal, clone repository
```
git clone {remote repository}
```

## Configuration a remote

1. As it has already set up for remote repositry, so move to your cloned project & check current configured remote repository
```
$ git remote -v
d
> origin	git@github.com:YOUR_USERNAME/YOUR_FORK.git (fetch)
> origin	git@github.com:YOUR_USERNAME/YOUR_FORK.git (push)
```

2. Specify a new remote upstream repository
```
$ git remote add upstream https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git

eg. git remote add upstream git@github.com:hha-m/team_study.git
```

3. Then, verify your remote configuration
```
$ git remote -v

> origin    https://github.com/YOUR_USERNAME/YOUR_FORK.git (fetch)
> origin    https://github.com/YOUR_USERNAME/YOUR_FORK.git (push)
> upstream  https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git (fetch)
> upstream  https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git (push)

```

ref:

https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks

https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/configuring-a-remote-for-a-fork
