/* rexx build the pdf */
/* normally we are in a tex/book (two level) subdir of the project */
say 'Rexx Texttools 0.1 started'

chapters = getMarkdownFilenames('../..')
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
    call eraseFiles file
    call preprocessMD(file'.md')
    say time() 'converting' file
    'pandoc -f markdown+latex_macros -t latex --top-level-division=chapter 'file'.md -o' file'.texin'
    say time() 'preprocessing' file
    call preprocessTEX(file)
  end
end
-- exit -- uncomment to debug the preprocessing

call copyassets title

-- build the document. at least 2 passes needed for coherence of contents and index
xelatexrc=1
do i=1 to 2
  'xelatex -output-driver="xdvipdfmx -i dvipdfmx-unsafe.cfg -q -E" -shell-esc 'title'.tex'
  xelatexrc=RC
  say 'xelatex return code:' xelatexrc
  'makeindex' title
  say 'makeindex return code:' RC
    'bibtex8 --wolfgang' title
  say 'bibtex return code:' RC
end

'open 'title'.pdf'
exit

preprocessMD: procedure
parse lower arg filename
outfile=filename
 filename='../../'filename
call lineout outfile,'<!--preprocessed md-->',1
do while lines(filename)
  line=linein(filename)
  line=changestr('<!--index-->',line,'%index%')
  line=changestr('<!--index:',line,'%indexm%')
  line=changestr('<!--cite-->',line,'%cite%')
  if left(line,3)='```' then do
    parse var line '<!--'fn'-->'
    parse var line '```'language' <!--'
    call writeSourceFile filename fn
    line='%includesource='fn':'language'%'
  end
  call lineout outfile,line
end
call lineout outfile /* close the file */
return

/* write the sourcefile that is between the three backticks */
/* the filename is given in an html comment                 */
writeSourceFile: procedure
parse arg filename fnout
call lineout fnout,'/* rexx */',1
i=0
do while src<>'```'
  i=i+1
  src=linein(filename)
  if src='```' then leave
  call lineout fnout,src,i
end
call lineout fnout /* close the file */
return


