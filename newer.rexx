/* rexx newer: procedure */
arg origfile genfile
origfile=lower(origfile)'.md'
genfile=lower(genfile)'.md'
ts1 = stream(origfile,'c','QUERY TIMESTAMP')
ts2 = stream(genfile,'c','QUERY TIMESTAMP')
if ts2="" then return 1
if ts1 > ts2 then return 1
else return 0
