-- rexx copy the assets for the latex compilation process
parse arg title
'mkdir -p charts'
'mkdir -p images'
/* 'cp ../../'title'.tex .' */
'cp ../../bibliography.bib .'
'cp ../../* .'
'cp ../../charts/*.pdf ./charts'
'cp ../../images/*.pdf ./images'
'cp ../../images/*.png ./images'
'cp ../../images/*.PNG ./images'
'cp ../../images/*.jpg ./images'
'cp ../../images/*.jpeg ./images'
'cp ../../images/*.tiff ./images'
'cp ../../images/*.svg ./images'
/* 'cp ../../recursion/\*.svg ./images' */
