/* replaceMultiIndices
 * replace a <!--index:indexable words--> tag with the indexable words
 * within a tex \index tag; here duplication is necessary
 * and the words are filtered from passing through 
 */  
/* replaceMultiIndices: procedure expose line */
parse arg line
outline=''
do until line=''
  parse var line start '\%indexm\%' rest
  parse var rest ixwords '--\textgreater' rest
  if ixwords='' then do
    outline=outline||start
    leave
  end
  outline=outline||start||'\index{'ixwords'} '
  line=rest
end
return outline
