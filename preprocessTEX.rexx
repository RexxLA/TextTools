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
  if ixpos>0 then line="replaceIndices"(line)
  ixpos=pos('\%indexm\%',line)
  if ixpos>0 then line="replaceMultiIndices"()
  ixpos=pos('\%cite\%',line)
  if ixpos>0 then line="replaceCites"(line)
  ixpos=pos('\hyperlink',line)
  if ixpos>0 then line="replaceHyperlink"(line)
  ixpos=pos('\%includesource',line)
  if ixpos>0 then line="includelisting"(line)
  ixpos=pos('\%listasm',line)
  if ixpos>0 then line="includeasm"(line)
  ixpos=pos('\%splice\%',line)
  if ixpos>0 then line="replaceSplice"(line)
  do while wordpos("Rexx", line) > 0
    p = wordpos("Rexx", line)
    line = subword(line,1,p-1) "\rexx{}" subword(line,p+1)
  end
  do while wordpos("Rexx-", line) > 0
    p = wordpos("Rexx-", line)
    line = subword(line,1,p-1) "\rexx{}-" subword(line,p+1)
  end

  do while wordpos("cRexx", line) > 0
    p = wordpos("cRexx", line)
    line = subword(line,1,p-1) "\crexx{}" subword(line,p+1)
  end
  call lineout outfile,line
end
call lineout outfile /* close the file */
return

