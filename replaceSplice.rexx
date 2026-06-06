/* replaceSplice: procedure */
arg line
outline=''
parse lower var line '\%splice\%'program
outline='\begin{terminaloutput} \fontspec{IBM Plex Mono}[Scale=0.7] \obeylines \parskip=0pt \parindent=0pt \splice{stdbuf -o0 'program'} \end{terminaloutput}'
return outline
