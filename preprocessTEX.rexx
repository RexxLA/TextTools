/* rexx preprocessTEX: procedure */
parse lower arg filename
outfile=filename'.tex'
filename=filename'.texin'
call lineout outfile,'%preprocessed texin',1
do while lines(filename)
  line=linein(filename)
  tbidpos=pos('\{\#tbl:id\}',line)
  if tbidpos>0 then do
    line=changestr('\{\#tbl:id\}',line,'')
  end
  ixpos=pos('\%index\%',line)
  if ixpos>0 then line=replaceIndices(line)
  ixpos=pos('\%indexm\%',line)
  if ixpos>0 then line=replaceMultiIndices()
  ixpos=pos('\%cite\%',line)
  if ixpos>0 then line=replaceCites(line)
  ixpos=pos('\hyperlink',line)
  if ixpos>0 then line=replaceHyperlink(line)
  ixpos=pos('\%includesource',line)
  if ixpos>0 then line=includelisting(line)
  ixpos=pos('\%splice\%',line)
  if ixpos>0 then line=replaceSplice(line)

  /* ixpos=pos('Rexx',line) */
  /* if ixpos>0 then line=changestr('Rexx',line,'\\Rexx{}') */
  /* ixpos=pos('REXX',line) */
  /* if ixpos>0 then line=changestr('REXX',line,'\\Rexx{}') */
  /* ixpos=pos('rexx',line) */
  /* if ixpos>0 then line=changestr('rexx',line,'\\Rexx{}') */
  call lineout outfile,line
end
call lineout outfile /* close the file */
return

