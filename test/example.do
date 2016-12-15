discard
adopath + "c:/git/bcrpuse/source"

* Setup
	cls
	clear
	set more off
	set trace off


* Simplest usage
	bcrpuse PN01288PM

* Multiple series and time range
	clear
	bcrpuse PN01288PM PN01289PM, verbose range(2001m1 2012m12)

* Simple options
	bcrpuse PN01288PM PN01289PM, verbose clear sleep(0.6)

* Other frequencies
	bcrpuse PN03492MQ, clear range(2001q1 2010q4)
	bcrpuse PD04658MD, clear range(1jan1999 31dec2002)
	bcrpuse PM06069MA, clear range(2007 2009)

* Data cache
	bcrpuse PN01288PM PN01289PM, clear verbose range(2001m1 2012m12) cache(c:\git\borrar)
	bcrpuse PN01288PM PN01289PM, clear verbose range(2001m1 2012m12) cachepath(c:\git\borrar)
	bcrpuse PN01288PM PN01289PM, clear verbose range(2001m1 2010m12) cachep(c:\git\borrar)

exit
