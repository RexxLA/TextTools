# TextTools

Set of Text Tools supporting different RexxLA implementations.

To use this in your document build process:

- git submodule add 

in a repository that has this submodule defined but not checked out:

- git submodule init

- git submodule update

If you the cd into TextTools and you get the message (after doing a git status)

```
➜  TextTools git:(eab7367) git status
HEAD detached at eab7367
nothing to commit, working tree clean
```

Your head is detached. Switch to branch `main`
```
➜  TextTools git:(eab7367) git checkout main
Previous HEAD position was eab7367 add .gitignore to lose emacs backups
Switched to branch 'main'
Your branch is up to date with 'origin/main'.
```
