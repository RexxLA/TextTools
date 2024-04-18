/* write the sourcefile that is between the three backticks */
/* the filename is given in an html comment                 */
/* writeSourceFile: procedure */
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
