/* replaceHyperlink: procedure */
arg line
outline=''
parse var line start '\hyperlink{'link'}{'text'}' rest
outline=start'\hyperlink{'link'}{'text'} on page \pageref{'link'}' rest
return outline
