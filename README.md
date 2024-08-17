# TextTools

Set of Text Tools supporting different publications which use a process to build from Markdown to XeTex.

Goals:

- bridge a change from Latex source to Markdown source
- enable different and future text toolchains to run on that Markdown source 

## Added functionality
This toolset add some functionality to Markdown, using a comment escape mechanism. To limit the dependencies on `pandoc`, the latter is only used for straightforward conversion.

- tags for bibliography and citation
- tags for index generation

Use of Latex tags is still valid and possible, these will pass through and will be used for print document generation; for use as online documentation this use is discouraged.

|Tag   |Use   |Example   |   |   |
|---|---|---|---|---|
| `<!--index-->`  | add index entry for next word  | `<!--index-->`Rexx  |   |   |
| `<--index:`word,word`>`  | add index entries with level   |   |   |   |
| `<!--cite-->`  | use citation from `bibliogßraphy.bib`  |   |   |   |
| ``` | inline source will be written to a file| ```rexx (to specify language to listings)
Table: Comment-hidden tags. {#tbl:id}

Note: {#tbl:id} signals to pandoc that this table goes into the list of tables.

## Use
To use this in your document build process:

create a subdirectory `tex/book` into your document directory. The base directory can contain `.tex` and `.md` files.
It is advised to concentrate tex process metadata in a tex/boilerplate directory, and to build the publication in `book`.

run in the tex/book subdirectory:

```
rexx ~/apps/TextTools/build.rexx
```

## Use as a git submodule
It is also possible to check this out as a submodule of the git repo that contains your publication.
This way, you have more control over what works for a specific publication and can do controlled upgrades and rollbacks for that publication only. You don't *have to* check that in, but generally when cooperation on a document that is the wa to go. 

To use as a submodule, do:

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
## Remove a git submodule

```
# Remove the submodule entry from .git/config
git submodule deinit -f path/to/submodule

# Remove the submodule directory from the superproject's .git/modules directory
rm -rf .git/modules/path/to/submodule

# Remove the entry in .gitmodules and remove the submodule directory located at path/to/submodule
git rm -f path/to/submodule
```
