# TextTools

Set of Text Tools supporting different publications which use a process to build from Markdown to XeTex.

Goals:

- bridge a change from Latex source to Markdown source
- enable different and future text toolchains to run on that Markdown source 

This toolset add some functionality to Markdown, using a comment escape mechanism. To limit the dependencies on `pandoc`, the latter is only used for straightforward conversion.

To use this in your document build process:

create a subdirectory `tex/book` into your document directory. The base directory can contain `.tex` and `.md` files.
It is advised to concentrate tex process metadata in a tex/boilerplate directory, and to build the publication in `book`.

run in the tex/book subdirectory:

```
rexx ~/apps/TextTools/build.rexx
```

It is also possible to check this out as a submodule of the git repo that contains your publication.
This way, you have more control over what works for a specific publication and can do controlled
upgrades and rollbacks for that publication only. To use as a submodule, do:

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
