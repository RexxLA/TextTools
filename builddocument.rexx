-- rexx build the document. at least 2 passes needed for coherence of contents and index
parse arg title
xelatexrc=1
do i=1 to 2
  'xelatex --no-pdf -shell-esc 'title'.tex'
  xelatexrc=RC
  say 'xelatex return code:' xelatexrc
  'makeindex' title
  say 'makeindex return code:' RC
    'bibtex8 --wolfgang' title
  say 'bibtex return code:' RC
end

/* 'xdvipdfmx -V 1.7 -output-driver="-dALLOWPSTRANSPARENCY" -i dvipdfmx-unsafe.cfg -q -E 'title'.xdv' */

'xdvipdfmx -V 1.7 'title'.xdv'
