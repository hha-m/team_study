# Add project to github
## 1. Create a folder(eg: team_project) for this project on your local
```
$ mkdir team_project
```

## 2. change into created folder and initialize a new, empty git repository
```
$ cd team_project
$ git init
```


## 3. create readme file, then add all changes to the next (= first) commit
```
$ git add .

or

$ git add {specific file}
```

## 4. create this first commit
```
$ git commit -m "Initial commit"
```

## 5. Create a new repository on GitHub.com

ref here:
https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository


## 6. add repository to local project using ssh, then, push to github
```
$ git remote add origin git@github.com:{account name}/{project name}.git

eg. git remote add origin git@github.com:hha-m/team_project.git

$ git push origin master
```


## If you want to remove a remote, use
```
git remote remove origin
```

## You can get all the information about a remote, including the configured URL
```
git remote show origin
```