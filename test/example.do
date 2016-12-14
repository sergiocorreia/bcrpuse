discard
adopath + "c:/git/bcrpuse/source"

cls
clear
set more off
set trace off

clear

bcrpuse PN01288PM PN01289PM, verbose range(2001m1 2012m12)

bcrpuse PN01288PM PN01289PM, verbose clear


clear

bcrpuse PN01288PM, verbose range(2001m1 2012m12) savepath(c:\git\borrar)

clear


bcrpuse PN01288PM, verbose range(2001m1 2012m12) usepath(c:\git\borrar)

exit
