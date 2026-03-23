/* rexx includeasm: procedure */
parse arg line
outline=''
parse var line +11 fn
language='rxas'
outline='\lstinputlisting[language='language',label='fn',caption='fn']{'fn'}'
return outline
