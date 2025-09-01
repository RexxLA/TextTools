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
    /* if fn = '' then do */
      
    /* end */
    do
      call writeSourceFile filename fn
    line='%includesource='fn':'language'%'
  end
  end
  if left(line,10)='<!--splice' then do
    parse var line '<!--splice--'program'-->'
    line = '%splice%'program
  end
  call lineout outfile,line
end
call lineout outfile /* close the file */
return

