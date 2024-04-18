/* rexx preprocessMD: procedure */
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

