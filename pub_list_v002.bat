rem Generate Publication list from BibTex file
rem uses the program Bibtex2html in C:\Program Files\Bibtex2html\
rem Main Bibtex file bk_all_groups.bib ( I use Jabref to edit this)
Rem in V002 reversed the order on each category so it counts down
rem Journal publications are type Article - > a1.bib and a1_bib.html
rem Conference papers are are type Conference - > c1.bib and c1_bib.html
rem Thesis are type Mastersthesis or Phdthesis - > t1.bib and t1_bib.html
rem Patents are type Patent- > p1.bib and p1_bib.html
rem
rem combined publication list -> crk_pubs.html
rem @echo off

set PATH=%PATH%;C:\Program Files\Bibtex2html

rem The Journal articles
bib2bib -oc a1_citefile -ob a1.bib -c "$type : 'article'" bk_all_groups.bib
bibtex2html -d -r  --revkeys --nodoc --header "<h2>Journal</h2>" --no-footer --no-keywords -noabstract -citefile a1_citefile a1.bib

rem The Conference papers
bib2bib -oc c1_citefile -ob c1.bib -c "$type : 'conference'" bk_all_groups.bib
bibtex2html -d -r --revkeys --nodoc --header "<h2>Conference</h2>" --no-footer --no-keywords -noabstract -citefile c1_citefile c1.bib

rem Theses
bib2bib -oc t1_citefile -ob t1.bib -c "$type : 'Mastersthesis' or $type : 'Phdthesis'" bk_all_groups.bib
bibtex2html -d -r --revkeys --nodoc --header "<h2>Theses</h2>" --no-footer --no-keywords -noabstract -citefile t1_citefile t1.bib

rem Patents
bib2bib -oc p1_citefile -ob p1.bib -c "$type : 'Patent'" bk_all_groups.bib
bibtex2html -d -r --revkeys --nodoc --header "<h2>Patents</h2>" --no-footer --no-keywords -noabstract -citefile p1_citefile p1.bib

Rem Combine into one publication list: crk_pubs.html <- pub_header.html+a1.html+c1.html+t1.html+p1.html+pub_footer.html
copy pub_header.html+a1.html+c1.html+t1.html+p1.html+pub_footer.html crk_pubs.html

Rem copy all needed files to website
copy ?1_bib.html  \h\admin\misc\v5_homepage
copy crk_pubs.html  \h\admin\misc\v5_homepage
rem first generate in Jabref and update the header
copy *_tab.html \h\admin\misc\v5_homepage