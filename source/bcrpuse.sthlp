{smcl}
{* *! version 1.0.0 14dec2016}{...}
{vieweralsosee "use" "help use"}{...}
{vieweralsosee "freduse" "help freduse"}{...}
{title:Title}

{p2colset 5 16 20 2}{...}
{p2col :{cmd:bcrpuse} {hline 2}}Import data from the Peruvian Central Bank BCRP){p_end}
{p2colreset}{...}

{title:Syntax}

{p 8 16 2}
{cmd:bcrpuse}
{it:series1} [... {it:series10}]
[{cmd:,}
{opt range(start_date end_date)}
{opt savepath(string)}
{opt usepath(string)}
{opt clear}
{opt v:erbose}
]

{title:Description}

{pstd}
{cmd:bcrpuse} imports data from the Peruvian Central Bank's statistical database.

{pstd}
The IDs for each time series can be located {browse "https://estadisticas.bcrp.gob.pe/estadisticas/series/index":here}

{pstd}
Start and end dates must be in {cmd:tm()} format. Example:

{pstd}
{inp:bcrpuse PN01288PM PN01289PM, range(2013m1 2016m9)}


{title:Notes}

{pstd}
It follows the API described at
{browse "https://estadisticas.bcrp.gob.pe/estadisticas/series/ayuda/api"}.

{pstd}
Since the HTTPS/SSL negociation is
{browse "https://www.ssllabs.com/ssltest/analyze.html?d=estadisticas.bcrp.gob.pe":broken} at that website,
we need to update the list of certificates used by Stata

{pstd}
1. Download the PEM file for
{browse "https://knowledge.geotrust.com/support/knowledge-base/index?page=content&id=SO26895#lightbox-07":GeoTrust SSL CA - G3}

{pstd}
2.
