# ee417-groupD

## Installing and launching the project

todo...

## Git Workflow

To ensure to keep a clean github repo, I suggest that we create one branch per ~person~feature, and to merge said branch into the main branch once the developpers responsible for it are satisfied.

### Git recap

#### Cloning the repo

To get the repo on your computer, you can use:

```
git clone https://github.com/begonavizcaino/ee417-groupD
```

Which will download the repo and put it into the ee417-groupD directory. You might be asked to login to do so, in which case you are expected to input your github connection in formations.

#### Creating a commit

A commit is a group of file changes. To create one, you need to stage the files, and then create the commit. To do so:

```
git add *
git commit -m "my message explaining what I did"
git pull
git push
```

The git pull will get the changes made by anyone else on the repo. Using ```git pull``` might create conflicts, which are markers in your files indicating where both your version and the online version contains changes contradicting one another. If some conflicts arises, you need to fix them, commit them (```git add *```, `git commit -m "..."`), before pushing it back on the server (`git push`).

#### Viewing the pending changes

Using `git status`, you can see all the files where you made some local changes. In red will be the unstaged files, which will not be included in your next commit, and in green are your staged files which will be.

#### Navigating between branches

You can see all the branches using `git branch`. To get onto a branch, you can use `git checkout branchname`. To create a new branch from the branch you're currently on, use `git branch newbranchname`.

#### Merging branches back together

There is multiple ways to merge branches together. In our case, wev'e decided to go on with pull requests to allow everyone to have a look at the modifications made to the code by someone before they get merged onto the main project.

### Starting a new branch

Each branch should be created starting from the main branch :

```
git pull
git checkout main
git branch feature-html
git checkout feature-html
```

You can then develop the feature, while the main branch will always contain a 100% tested and working website.

### Merging back into main

Once you are done with your features, you can commit all your changes, integrate the changes made into the main branch since you've created yours, and then create a pull request:

```
git add .
git commit -m "Here's the changes I made"
git pull
git merge main
```

The `git merge main` command is likely to generate some conflicts. In which case, you can use `git status` to know which files have conflicts, go to those files and choose which modification you want to keep. Once you fixed all conflicts, you can commit (`git add .` and `git commit -m "merged main into feature-html"`) and move to the next step.

#### Creating the pull request

Once your branch is even with the main branch, you can push it (`git push`), and then go to [github's compare page](https://github.com/begonavizcaino/ee417-groupD/compare), specify which branch you want to merge into main, and create a pull request. Once this is done, just notify the rest of us, so that we can validate your work or suggest modifications before merging it. From this point on, any modification to the feature branch will appear into the pull request screen.

### Reviewing pull requests

Once someone creates a pull request, it will appear in [github's pull request page](https://github.com/begonavizcaino/ee417-groupD/pulls). From there, everyone can leave a comment or suggest a modification. Once everyone is satisfied, we can merge it and close the pull request and the branch.

### Notes

Using this system, we can work on multiple features at the same time, without stopping someone else from working on it, which usually happens when multiple people work on different features on the same branch.

This also gives us better control when trying to understand what modification stopped the website from working.
