/* replaceSplice: procedure */
arg line
outline=''
parse lower var line '\%splice\%'program
outline='\begin{shaded} \fontspec{IBM Plex Mono}[Scale=0.8] \splice{crexx 'program'} \end{shaded}'
return outline
