/* replaceSplice: procedure */
arg line
outline=''
parse lower var line '\%splice\%'program
outline='\begin{shaded} \fontspec{IBM Plex Mono}[Scale=0.8] \obeylines \parskip=0pt \parindent=0pt \splice{stdbuf -o0 'program'} \end{shaded}'
return outline
