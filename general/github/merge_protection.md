# Creating a branch protection rule

1. on Github.com, navigate to the main page of the repository.

2. click `Settings`.

3. In the "Code and automation" section of the sidebar, click `Branches`

4. Next to "Branch protection rules", click `Add rule`.

5. Under "Branch name pattern", type the branch name or pattern you want to protect.

```
(if you want to do same setting for master and develop)

[master,develop]*
```

ref: https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/defining-the-mergeability-of-pull-requests/managing-a-branch-protection-rule