$latex  = 'platex -kanji=utf8 -src-specials -interaction=nonstopmode';
#$latex  = 'platex -kanji=utf8 -src-specials -interaction=nonstopmode -shell-escape';
#$latex  = 'pdflatex -kanji=utf8 -src-specials -interaction=nonstopmode';
$bibtex = 'pbibtex -kanji=utf8';
$dvi_previewer ='xdvi';
$dvipdf  = 'dvipdfmx %O -o %D %S';
$makeindex = 'mendex %O -U -o %D %S';
$pdf_previewer = 'evince %O %S';
$pdf_mode = 0;                  #  0 = don't create pdf file
#$pdf_mode = 3;                  #  3 = create pdf file by dvipdf
#$pdf_mode = 2;                  #  2 = create pdf file by ps2pdf
#$pdf_mode = 1;                  #  1 = create pdf file by pdftex
$pdf_update_method = 0;         #  0 =  auto update
