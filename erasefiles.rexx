/* rexx eraseFiles: procedure */
parse lower arg filename
'rm' filename'.md'
'rm' filename'.texin'
'rm' filename'.tex'
return
