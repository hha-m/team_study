# Merging
```
$ git checkout feature/abc

$ git merge develop

or

$ git merge feature/abc develop
```

# Rebasing
```
$ git checkout feature/abc

$ git rebase develop
```

- `git rebase -i develop` lists all commits that are about to be moved

 
# Git Rebase vs. Git Merge
### Similarities
- Both integrate changes from one branch into another

### Differences
- Git rebase moves a feature branch into a master/develp(specified default branch).

- Git merge adds a new commit, preserving the history.

### Is it Better to Rebase or Merge?
- If you're working alone or on a small team, use rebase. If you're working with a big team, use merge.

ref: https://www.perforce.com/blog/vcs/git-rebase-vs-git-merge-which-better