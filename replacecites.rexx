/* rexx replaceCites: procedure */
parse arg line
outline=''
do until line=''
  parse var line start '\%cite\%' rest '.'
  parse var rest '{[}'ixword'{]}'
  ixword=translate(ixword,'','[]{}')
  ixword=strip(ixword)
  if ixword='' then do
    outline=outline||start
    leave
  end
  outline=outline||start||'\cite{'ixword'} '
  lpos=lastpos('}',rest)
  line=substr(rest,lpos+1)
end -- do until

if pos('footnote',outline) >0 then
  do
    footnotepos = pos('footnote', outline)
    restofsentence = substr(outline,footnotepos)
    if countstr('}',restofsentence) < 2 then
      outline = left(outline,footnotepos-1)||changestr('}',restofsentence,'}}')
  end

return outline
