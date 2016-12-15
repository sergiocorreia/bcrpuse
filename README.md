# `bcrpuse` : download data from the Peruvian Central Bank into Stata

## Installation

```
cap ado uninstall bcrpuse
net install bcrpuse, from(https://github.com/sergiocorreia/bcrpuse/raw/master/source/)
```

## Usage

First, go [here](https://estadisticas.bcrp.gob.pe/estadisticas/series/mensuales) and pick a series (or up to 10). Then, run:

```stata
bcrpuse	PN00001MM, range(2001m1 2016m12)
```

## Advanced Usage

- Use a folder as cache, to avoid downloading the dataset every time: `bcrpuse	PN00001MM, range(2001m1 2016m12) cache(c:/somepath)`
- Can also manage different frequencies (daily, monthly, quarterly, annual).


## Issues: SSL Fix

As of Dec15, 2016, there is a bug in the website SSL auth, so you need a workaround. Download the `.pem` file, navigate to the Java security folder, and run:

```
..\..\bin\keytool -import -alias bcrp -keystore cacerts -file c:\Git\bcrpuse\source\bcrp.pem
```

Notes:

- Password is `changeit`
- More information in the help file

