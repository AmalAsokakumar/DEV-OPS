To pull changes from the remote main branch to a local branch called new-branch, you can use the following command:

```
git pull origin main:new-branch
```
This command will fetch the latest changes from the remote main branch and merge them into your local new-branch branch.

If the local branch does not exist yet, you can create it and set it to track the remote branch with the following command:

```
git branch new-branch origin/main
```
then you can use

```
git pull 
```
to pull the changes from the remote branch to your local branch.