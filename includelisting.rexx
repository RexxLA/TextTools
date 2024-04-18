/* rexx includelisting: procedure */
parse arg line
outline=''
parse var line . 'includesource='fn'\%'
parse var line . 'includesource='fn':'language'\%'
outline='\lstinputlisting[language='language',label='fn',caption='fn']{'fn'}'
return outline
