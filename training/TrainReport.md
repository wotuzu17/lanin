# Lanin Training Report
## Training (Startup) Parameters
The training process was started at 2017-01-06_14-11.

The startup Parameters are:

```r
opt
```

```
$xversion
[1] 1

$yversion
[1] 1

$aversion
[1] 1

$seed
[1] 123

$help
[1] FALSE
```

## Training and Validation Symbols
These Symbols were used for training:

```r
set1Syms
```

```
  [1] "IBM"  "SHLD" "NGD"  "RCL"  "A"    "JCI"  "CPB"  "GLW"  "MSI"  "FITB"
 [11] "BA"   "CY"   "NSC"  "GT"   "SCO"  "AXP"  "HL"   "WIN"  "TEVA" "SYY" 
 [21] "CBS"  "BHP"  "MT"   "EWT"  "WFC"  "ERX"  "CCJ"  "RDN"  "ATVI" "HON" 
 [31] "IYR"  "LYB"  "ESRX" "HUN"  "WM"   "HP"   "SOHU" "SSRI" "LUV"  "FXI" 
 [41] "BK"   "STI"  "DFS"  "ALL"  "TOL"  "MU"   "WFT"  "UPS"  "SPY"  "JWN" 
 [51] "FDX"  "LXK"  "DHI"  "DE"   "CHK"  "UAL"  "SPX"  "BID"  "APA"  "BG"  
 [61] "MAS"  "SYMC" "QCOM" "LRCX" "MO"   "WYNN" "KRE"  "YHOO" "MSFT" "RTN" 
 [71] "FCX"  "CVX"  "ETFC" "ACN"  "BP"   "NE"   "CCI"  "CDE"  "AMAT" "SU"  
 [81] "SO"   "VWO"  "TSL"  "DRI"  "RIG"  "APC"  "DOW"  "GS"   "CA"   "RUT" 
 [91] "POT"  "XLK"  "DAL"  "TXT"  "SWK"  "XLE"  "FXE"  "SPG"  "BX"   "DISH"
[101] "VLO"  "HAL"  "BHI"  "MAT"  "XLY"  "USO"  "GOLD" "SCCO" "F"    "UNH" 
[111] "XOM"  "KSS"  "CIT"  "TTWO" "CAR"  "ORCL" "ECA"  "CAG"  "NAV"  "TSLA"
[121] "LMT"  "MS"   "CI"   "MCD"  "FSLR" "LOW"  "TLT"  "CREE" "FXY"  "ARMH"
[131] "ETN"  "TRV"  "VALE" "WDC"  "NUAN" "CNQ"  "ITUB" "CIEN" "NUE"  "UTX" 
```

```r
set2Syms
```

```
  [1] "ABX"   "ADBE"  "ADI"   "ADM"   "ADSK"  "AEO"   "AEP"   "AET"  
  [9] "AFL"   "AG"    "AIG"   "AKS"   "AMD"   "AMGN"  "AMT"   "AMTD" 
 [17] "AUY"   "AVP"   "AXL"   "AZO"   "BBT"   "BKS"   "BRK.B" "BSX"  
 [25] "CAT"   "CLF"   "CLNE"  "CMCSA" "CMI"   "COH"   "COP"   "CSCO" 
 [33] "CTL"   "DANG"  "DD"    "DECK"  "DIA"   "DVN"   "EEM"   "EMC"  
 [41] "ESV"   "EUO"   "EWZ"   "EXC"   "FFIV"  "FLR"   "GDX"   "GE"   
 [49] "GG"    "GM"    "GME"   "GPS"   "GRMN"  "GSK"   "HD"    "HOG"  
 [57] "HRB"   "HUM"   "IBB"   "INTC"  "ISRG"  "IWM"   "JBL"   "JBLU" 
 [65] "JCP"   "JNJ"   "JPM"   "KBH"   "KEY"   "KGC"   "KLAC"  "KMB"  
 [73] "LEN"   "M"     "MAR"   "MDT"   "MGM"   "MJN"   "MMM"   "MON"  
 [81] "MOS"   "MPEL"  "MRK"   "MRVL"  "MYL"   "NEE"   "NEM"   "NLY"  
 [89] "NOV"   "NRG"   "OEF"   "OXY"   "PCLN"  "PEP"   "PG"    "PHM"  
 [97] "PM"    "PNC"   "PRU"   "PXD"   "QQQ"   "RAX"   "RF"    "RGLD" 
[105] "RHT"   "RIO"   "RRC"   "RSX"   "SIRI"  "SLB"   "SLV"   "SLW"  
[113] "SNE"   "SPLS"  "STX"   "SWKS"  "SWN"   "SYK"   "T"     "TCK"  
[121] "TGT"   "TIF"   "TSN"   "TSO"   "TWX"   "VRTX"  "WLL"   "WNR"  
[129] "WSM"   "WU"    "WY"    "XLB"   "XLF"   "XLNX"  "XLU"   "XLV"  
[137] "XME"   "YUM"   "ZION" 
```

```r
vdSyms
```

```
 [1] "EMR"  "STT"  "HIG"  "URBN" "WMT"  "AKAM" "LVS"  "XRX"  "MBI"  "IP"  
[11] "XOP"  "ILMN" "PAYX" "MET"  "BAC"  "TXN"  "CX"   "AGO"  "EWW"  "VZ"  
[21] "TOT"  "PAAS" "NBR"  "XLP"  "NFX"  "PBR"  "LLY"  "MDY"  "DO"   "BMY" 
[31] "USG"  "TEX"  "NTAP" "RL"   "AEM"  "IAG"  "PNRA" "CMG"  "EFA"  "COF" 
[41] "BIIB" "GLD"  "GIS"  "EXPE" "WHR"  "BIDU" "CNX"  "HES"  "CVS"  "SCHW"
[51] "XHB"  "GNW"  "VMW"  "BBBY" "JNPR" "CHRW" "BCS"  "NTES" "SINA" "X"   
[61] "XLI"  "AU"   "EWY"  "CTXS" "PFE"  "USB"  "WMB"  "SYNA" "NVDA"
```

## Training Set Generation
Input Variables: Input Variable Generation Explanation

Output Variables: Output Variable Generation Explanation

## Training Algorithm
Training Algorithm: Algo Explanation

