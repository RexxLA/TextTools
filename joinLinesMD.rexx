/* rexx joinLinesMD: procedure */
parse lower arg filename

outfile=filename'o'
filename='../../'filename
call lineout outfile,'<!--joined lines md-->',1

line = ''
output_line = ''
do while lines(filename) > 0
    line = linein(filename)
    if strip(line) = '' then do
        if output_line <> '' then
            call lineout outfile, output_line
        call lineout outfile, ''
        output_line = ''
    end
    else do
        if output_line = '' then
            output_line = line
        else
            output_line = output_line || ' ' || line
    end
end

if output_line <> '' then
    call lineout outfile, output_line

call lineout outfile /* close the file */

