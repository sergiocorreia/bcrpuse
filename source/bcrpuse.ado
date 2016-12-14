capture program drop bcrpuse
program define bcrpuse
	syntax namelist(name=series max=10), [ ///
		RANGE(string) CLEAR Verbose ///
		SAVEpath(string) USEpath(string) ///
		]
	
	loc verbose = ("`verbose'" != "")
	loc baseurl "https://estadisticas.bcrp.gob.pe/estadisticas/series/api"
	mata: st_local("series", invtokens(tokens("`series'"), "-"))

	if (`c(changed)' & "`clear'"=="") error 4
	clear

	if ("`range'"!="") {
		gettoken t0 t1 : range
		loc t0 = string(tm(`t0'), "%tmCCYY!-nn")
		loc t1 = string(tm(`t1'), "%tmCCYY!-nn")
		loc suffix "`t0'/`t1'"
	}
	loc url "`baseurl'/`series'/txt/`suffix'"
	mata: st_local("hash", "bcrp" + strofreal(hash1("`url'"), "%30.0g"))
	if (`verbose') di as text "[URL] `url'"
	if (`verbose') di as text "[HASH] `hash'"


	loc download 1
	if ("`usepath'" != "") {
		loc fn "`usepath'/`hash'.csv"
		cap findfile "`hash'.csv", path("`usepath'")
		if (c(rc)==0) loc download 0
	}

	if (`download') {
		if ("`savepath'" != "") {
			loc fn "`savepath'/`hash'.csv"
		}
		else {
			tempfile fn
		}
		if (`verbose') di as text " - downloading series"
		copy "`url'" "`fn'"
	}
	else {
		if (`verbose') di as text " - using cache"
	}

	// Load CSV
	// insheet using "`fn'",  names double tab
	import delimited using "`fn'", delim("\t") varnames(nonames) case(preserve) asdouble
	sleep 500

	// Sanitize dataset

	// Use series list as varnames
	// Use first row as labels
end


