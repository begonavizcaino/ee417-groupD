# ee417-groupD

## Installing and launching the project

todo...

## Git Workflow

To ensure to keep a clean github repo, I suggest that we create one branch per ~person~feature, and to merge said branch into the main branch once the developpers responsible for it are satisfied.

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
