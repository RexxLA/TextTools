/* rexx replaceIndices
 * replace a single <!--index--> tag with the indexable word
 * following the tag; no duplication but only a single index word
 * which is passed through to the .tex file 
 */  
parse arg line
outline=''
do until line=''
  parse var line start '\%index\%' rest
  ixword=word(rest,1)
  if ixword='' then do
    outline=outline||start
    leave
  end
  outline=outline||start||ixword'\index{'ixword'} '
  line=subword(rest,2)
end -- do until
if pos('footnote',outline) >0 then
  do
    footnotepos = pos('footnote', outline)
    restofsentence = substr(outline,footnotepos)
    if countstr('}',restofsentence) < 2 then
      outline = left(outline,footnotepos-1)||changestr('}',restofsentence,'}}')
  end
return outline
