{smcl}
{* *! version 1.0.0 15dec2016}{...}
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
{opt cache:path(string)}
{opt clear}
{opt v:erbose}
{opt sleep(seconds)}
]

{title:Description}

{pstd}
{cmd:bcrpuse} imports data from the Peruvian Central Bank's statistical database.

{pstd}
The IDs for each time series can be located {browse "https://estadisticas.bcrp.gob.pe/estadisticas/series/index":here} (by category)

{pstd}By frequency:

{p 8 8 2} - {browse "https://estadisticas.bcrp.gob.pe/estadisticas/series/diarias":daily} (85 series){p_end}
{p 8 8 2} - {browse "https://estadisticas.bcrp.gob.pe/estadisticas/series/mensuales":monthly} (5270 series){p_end}
{p 8 8 2} - {browse "https://estadisticas.bcrp.gob.pe/estadisticas/series/trimestrales":quarterly} (847 series){p_end}
{p 8 8 2} - {browse "https://estadisticas.bcrp.gob.pe/estadisticas/series/anuales":annually} (1636 series){p_end}

{pstd}
Start and end dates must be in Stata format. Examples:

{pstd}{inp:bcrpuse PN01288PM PN01289PM, range(2013m1 2016m9)}{p_end}
{pstd}{inp:bcrpuse PN03492MQ, range(2013q1 2016q4)}{p_end}
{pstd}{inp:bcrpuse PD04658MD, clear range(1jan1999 31dec2002)}{p_end}
{pstd}{inp:bcrpuse PM06069MA, clear range(2007 2009)}{p_end}


{title:Technical Notes}

{pstd}
It follows the API described at
{browse "https://estadisticas.bcrp.gob.pe/estadisticas/series/ayuda/api"}.

{pstd}
Since the HTTPS/SSL negociation is
{browse "https://www.ssllabs.com/ssltest/analyze.html?d=estadisticas.bcrp.gob.pe":broken} at that website
(due to an incomplete certificate chain),
we need to update the list of certificates used by Stata

{pstd}
1. Download the PEM file for
{browse "https://knowledge.geotrust.com/support/knowledge-base/index?page=content&id=SO26895#lightbox-07":GeoTrust SSL CA - G3}
{p_end}
{pstd}
2. Navigate to the Stata {stata `"di "`c(sysdir_stata)'" "':path}
and then to the Java security path (e.g. "java\windows-x64\jre1.8.0_31\lib\security")
{p_end}
{pstd}
3. On the shell, run something like
{inp:..\..\bin\keytool -import -alias bcrp -keystore cacerts -file c:\Git\bcrpuse\source\bcrp.pem}
(the pasword is "changeit")
{p_end}

{pstd}
2.
