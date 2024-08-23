/* rexx build the pdf */
/* normally we are in a tex/book (two level) subdir of the project */
say 'Rexx Texttools 0.2 started'
/* arg the options */
parse arg commandline
if wordpos(commandline,'-show') > 0 then show=1
else show=0

chapters = "getMarkdownFilenames"('../..')
dir = directory()
say 'Current working directory is' dir
ird = reverse(dir)
parse var ird .'/'.'/'title'/'.
title=reverse(title)
say 'Publication file is' title

/*
 * Every chapter is a markdown file. Precompile the changed chapters,
 * make-style
 */
do i=1 to words(chapters)
  file=word(chapters,i)
  orgfile='../../'file
  if newer(orgfile file) then do
    call "eraseFiles" file
    call "preprocessMD"(file'.md')
    say time() 'converting' file
    'pandoc -f markdown+latex_macros -t latex --top-level-division=chapter 'file'.md -o' file'.texin'
    say time() 'preprocessing' file
    call "preprocessTEX"(file)
  end
end
-- exit -- uncomment to debug the preprocessing
call "copyassets" title

call "builddocument" title

if show then
  do
    out=.array~new
    address system 'uname -s' with output using (out)
    if out~firstItem = 'Darwin' then
      do
	'open 'title'.pdf'
      end
  end
exit



