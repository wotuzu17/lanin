# Lanin Training Report
## Training (Startup) Parameters
The training process was started at 2017-01-16_18-05.

The startup Parameters are:

```r
opt
```

```
$xversion
[1] 3

$yversion
[1] 1

$aversion
[1] 2

$rate
[1] 4

$seed
[1] 234

$help
[1] FALSE
```

## Training and Validation Symbols
These Symbols were used for training:

```r
set1Syms
```

```
  [1] "MYL"   "WM"    "FCX"   "MPEL"  "EMC"   "AMGN"  "GDX"   "LVS"  
  [9] "GG"    "BRK.B" "BBT"   "MET"   "KRE"   "ERX"   "SWKS"  "USB"  
 [17] "NAV"   "DFS"   "VALE"  "EMR"   "SNE"   "STX"   "STT"   "BK"   
 [25] "BIIB"  "IWM"   "VMW"   "EWZ"   "VRTX"  "NEE"   "ILMN"  "QCOM" 
 [33] "PBR"   "CSCO"  "GLW"   "DOW"   "STI"   "XLF"   "WY"    "VZ"   
 [41] "JCI"   "NEM"   "CAT"   "LEN"   "LLY"   "CLF"   "AEP"   "BMY"  
 [49] "BAC"   "WSM"   "GSK"   "NBR"   "XHB"   "JBLU"  "SYMC"  "LMT"  
 [57] "BA"    "M"     "MAT"   "WFC"   "BG"    "GT"    "DISH"  "MCD"  
 [65] "RL"    "FLR"   "USO"   "KEY"   "AXL"   "TSO"   "COP"   "NRG"  
 [73] "PNRA"  "HOG"   "SYK"   "PFE"   "QQQ"   "DANG"  "DAL"   "TXN"  
 [81] "DVN"   "HL"    "COF"   "PXD"   "SPY"   "AKS"   "BX"    "SLB"  
 [89] "GNW"   "GPS"   "GM"    "RUT"   "BID"   "AET"   "CCJ"   "SLV"  
 [97] "AMTD"  "JNPR"  "MJN"   "PCLN"  "XLI"   "ETN"   "TWX"   "MSFT" 
[105] "VWO"   "AU"    "SWK"   "DD"    "CTL"   "CMI"   "TOT"   "CLNE" 
[113] "TSLA"  "AZO"   "NFX"   "LXK"   "ISRG"  "GE"    "AKAM"  "JCP"  
[121] "KLAC"  "T"     "DHI"   "SIRI"  "TIF"   "OEF"   "IBM"   "CNQ"  
[129] "NUAN"  "HP"    "UTX"   "XOM"   "MT"    "GOLD"  "UNH"   "AUY"  
[137] "EWW"   "NSC"   "TRV"   "ACN"  
```

```r
set2Syms
```

```
  [1] "ABX"   "ADBE"  "ADI"   "ADM"   "AEM"   "AEO"   "AFL"   "AG"   
  [9] "AGO"   "AIG"   "ALL"   "AMAT"  "AMD"   "AMT"   "APC"   "ATVI" 
 [17] "AVP"   "AXP"   "BBBY"  "BHI"   "BHP"   "BSX"   "CA"    "CAG"  
 [25] "CAR"   "CCI"   "CDE"   "CHK"   "CHRW"  "CIEN"  "CIT"   "CMCSA"
 [33] "CMG"   "CPB"   "CREE"  "CTXS"  "CVX"   "CX"    "CY"    "DE"   
 [41] "DECK"  "DIA"   "DO"    "DRI"   "EEM"   "EFA"   "ESRX"  "ETFC" 
 [49] "EWT"   "F"     "FDX"   "FFIV"  "FITB"  "FSLR"  "FXE"   "FXY"  
 [57] "GIS"   "GLD"   "GS"    "HAL"   "HD"    "HON"   "HUM"   "HUN"  
 [65] "IAG"   "IBB"   "INTC"  "IP"    "JBL"   "JNJ"   "JPM"   "JWN"  
 [73] "KGC"   "KSS"   "LRCX"  "LYB"   "MAS"   "MDY"   "MGM"   "MMM"  
 [81] "MRK"   "MS"    "MSI"   "MU"    "NE"    "NGD"   "NTES"  "OXY"  
 [89] "PAAS"  "PAYX"  "PEP"   "PG"    "PHM"   "POT"   "RAX"   "RCL"  
 [97] "RF"    "RHT"   "RIG"   "RIO"   "RRC"   "RSX"   "RTN"   "SCCO" 
[105] "SCHW"  "SCO"   "SLW"   "SO"    "SOHU"  "SPX"   "SU"    "TCK"  
[113] "TEVA"  "TGT"   "TLT"   "TOL"   "TSL"   "TSN"   "TTWO"  "UPS"  
[121] "URBN"  "USG"   "VLO"   "WHR"   "WIN"   "WLL"   "WMB"   "WMT"  
[129] "WYNN"  "XLB"   "XLE"   "XLNX"  "XLU"   "XLV"   "XME"   "XRX"  
[137] "YHOO"  "YUM"   "ZION" 
```

```r
vdSyms
```

```
 [1] "SINA" "SSRI" "ADSK" "SPG"  "APA"  "NUE"  "WFT"  "RDN"  "WDC"  "ECA" 
[11] "MBI"  "MAR"  "MO"   "XLK"  "A"    "HRB"  "ESV"  "XLY"  "BKS"  "TEX" 
[21] "KMB"  "MDT"  "SYY"  "MRVL" "IYR"  "FXI"  "ORCL" "CI"   "SPLS" "SYNA"
[31] "MON"  "CVS"  "CBS"  "NVDA" "KBH"  "NOV"  "NTAP" "BP"   "ITUB" "EWY" 
[41] "LUV"  "SWN"  "SHLD" "CNX"  "WNR"  "PNC"  "COH"  "WU"   "LOW"  "BCS" 
[51] "TXT"  "EXPE" "X"    "PRU"  "XOP"  "BIDU" "ARMH" "GRMN" "PM"   "MOS" 
[61] "EUO"  "HES"  "UAL"  "RGLD" "GME"  "EXC"  "NLY"  "HIG"  "XLP" 
```

## Training Set Generation
### X
Input Variables: Third toy model. Input features: ADX, SMA50, SMA9, RSI14

Example of raw data set:

```r
head(set1.RAW[[1]][complete.cases(set1.RAW[[1]])])
```

```
                ADX       dADX      DInorm     C2SMA50  dSMA50
2011-06-14 18.26131 -0.3042618 -0.14305909 -0.04970262 -0.0140
2011-06-15 18.40959  0.1482766 -0.20337184 -0.07040326 -0.0260
2011-06-16 18.91065  0.5010596 -0.25424422 -0.06547178 -0.0236
2011-06-17 18.53816 -0.3724888 -0.13695805 -0.05889537 -0.0186
2011-06-20 18.19228 -0.3458824 -0.13695805 -0.04422685 -0.0134
2011-06-21 16.91554 -1.2767361  0.00317972 -0.03091466 -0.0118
                  C2SMA9        dSMA9    RSI14  dRSI14_3 adv_1_10
2011-06-14 -0.0001972678 -0.075555556 41.10264  1.375056 2.634009
2011-06-15 -0.0151538036 -0.130000000 35.89203  1.527000 4.547280
2011-06-16 -0.0080260848 -0.076666667 37.37885  1.664960 5.528583
2011-06-17 -0.0018460310 -0.016666667 39.64020 -0.487481 5.986399
2011-06-20  0.0114212573  0.001111111 44.98861  3.032194 5.280862
2011-06-21  0.0219790907  0.035555556 49.48743  4.036193 4.596229
             dec_1_10
2011-06-14  0.9931509
2011-06-15 -0.1724087
2011-06-16 -0.2632658
2011-06-17 -0.6651555
2011-06-20 -0.6161006
2011-06-21  0.0000000
```

### Y
Output Variables: First toy model: Class of upward/downward price shift in quartiles of ATR returns. 
Classify price advances / declines.

Boundaries:

```r
set1.adv.boundaries
```

```
      25%       50%       75% 
0.3220842 1.1125340 2.1268391 
```

```r
set2.adv.boundaries
```

```
      25%       50%       75% 
0.3196582 1.1093502 2.1198646 
```

```r
vd.adv.boundaries 
```

```
      25%       50%       75% 
0.3125126 1.1146236 2.1390453 
```

```r
set1.dec.boundaries
```

```
      25%       50%       75% 
0.1884738 0.9601374 2.0398022 
```

```r
set2.dec.boundaries
```

```
      25%       50%       75% 
0.1887112 0.9575838 2.0392385 
```

```r
vd.dec.boundaries 
```

```
      25%       50%       75% 
0.1991069 0.9716258 2.0609612 
```

### Schema of Training Data Set
Example:

```r
head(trainDF1a.t)
```

```
       ADX       dADX      DInorm     C2SMA50  dSMA50        C2SMA9
1 18.26131 -0.3042618 -0.14305909 -0.04970262 -0.0140 -0.0001972678
2 18.40959  0.1482766 -0.20337184 -0.07040326 -0.0260 -0.0151538036
3 18.91065  0.5010596 -0.25424422 -0.06547178 -0.0236 -0.0080260848
4 18.53816 -0.3724888 -0.13695805 -0.05889537 -0.0186 -0.0018460310
5 18.19228 -0.3458824 -0.13695805 -0.04422685 -0.0134  0.0114212573
6 16.91554 -1.2767361  0.00317972 -0.03091466 -0.0118  0.0219790907
         dSMA9    RSI14  dRSI14_3 y
1 -0.075555556 41.10264  1.375056 3
2 -0.130000000 35.89203  1.527000 3
3 -0.076666667 37.37885  1.664960 3
4 -0.016666667 39.64020 -0.487481 3
5  0.001111111 44.98861  3.032194 3
6  0.035555556 49.48743  4.036193 3
```

## Training Algorithm
Training Algorithm: Use only single core processing to prevent excessive memory consumption

### Confusion Matrices

```
f1a.os :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2     3
         0 11887 11175 10584 10152
         1 10304 10812 10441  9651
         2 10453 11116 11768 11305
         3 12310 11997 12749 14531

Overall Statistics
                                          
               Accuracy : 0.2704          
                 95% CI : (0.2683, 0.2724)
    No Information Rate : 0.2518          
    P-Value [Acc > NIR] : < 2.2e-16       
                                          
                  Kappa : 0.027           
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.26443  0.23973  0.25840  0.31839
Specificity           0.76584  0.77672  0.75773  0.72672
Pos Pred Value        0.27141  0.26238  0.26361  0.28168
Neg Pred Value        0.75940  0.75513  0.75274  0.76006
Prevalence            0.24804  0.24885  0.25129  0.25182
Detection Rate        0.06559  0.05966  0.06493  0.08018
Detection Prevalence  0.24166  0.22737  0.24632  0.28464
Balanced Accuracy     0.51513  0.50823  0.50807  0.52255
-----------------------------------------------------------

f1a.vd :
Confusion Matrix and Statistics

          Reference
Prediction    0    1    2    3
         0 5841 5396 5285 5263
         1 5199 5332 5140 4961
         2 5411 5399 5645 5615
         3 6100 5933 6354 7089

Overall Statistics
                                          
               Accuracy : 0.2657          
                 95% CI : (0.2629, 0.2686)
    No Information Rate : 0.2549          
    P-Value [Acc > NIR] : 4.579e-14       
                                          
                  Kappa : 0.0207          
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.25901  0.24170  0.25174   0.3092
Specificity           0.76348  0.77468  0.75681   0.7257
Pos Pred Value        0.26812  0.25843  0.25578   0.2783
Neg Pred Value        0.75491  0.75872  0.75286   0.7544
Prevalence            0.25067  0.24521  0.24926   0.2549
Detection Rate        0.06493  0.05927  0.06275   0.0788
Detection Prevalence  0.24216  0.22934  0.24532   0.2832
Balanced Accuracy     0.51125  0.50819  0.50427   0.5174
-----------------------------------------------------------

f2a.os :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2     3
         0 11828 10778 10251 10523
         1 10812 11222 10913 10205
         2 10449 11115 11539 11107
         3 11882 12152 13050 14704

Overall Statistics
                                         
               Accuracy : 0.2701         
                 95% CI : (0.268, 0.2721)
    No Information Rate : 0.255          
    P-Value [Acc > NIR] : < 2.2e-16      
                                         
                  Kappa : 0.0264         
 Mcnemar's Test P-Value : < 2.2e-16      

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity            0.2630  0.24791  0.25220  0.31595
Specificity            0.7706  0.76738  0.76114  0.72731
Pos Pred Value         0.2727  0.26006  0.26100  0.28393
Neg Pred Value         0.7618  0.75574  0.75265  0.75651
Prevalence             0.2464  0.24800  0.25066  0.25497
Detection Rate         0.0648  0.06148  0.06322  0.08056
Detection Prevalence   0.2377  0.23641  0.24221  0.28372
Balanced Accuracy      0.5168  0.50764  0.50667  0.52163
-----------------------------------------------------------

f2a.vd :
Confusion Matrix and Statistics

          Reference
Prediction    0    1    2    3
         0 5775 5454 5291 5445
         1 5433 5371 5337 5067
         2 5236 5320 5430 5490
         3 6040 5913 6300 7061

Overall Statistics
                                          
               Accuracy : 0.2627          
                 95% CI : (0.2599, 0.2656)
    No Information Rate : 0.2564          
    P-Value [Acc > NIR] : 6.267e-06       
                                          
                  Kappa : 0.0166          
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.25685   0.2435  0.24287  0.30616
Specificity           0.76007   0.7668  0.76265  0.72716
Pos Pred Value        0.26292   0.2533  0.25284  0.27894
Neg Pred Value        0.75427   0.7573  0.75283  0.75248
Prevalence            0.24992   0.2452  0.24852  0.25636
Detection Rate        0.06419   0.0597  0.06036  0.07849
Detection Prevalence  0.24416   0.2357  0.23872  0.28138
Balanced Accuracy     0.50846   0.5051  0.50276  0.51666
-----------------------------------------------------------

f1d.os :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2     3
         0 13124 11987 11012 11276
         1 11512 11916 11247 10328
         2  9822 10691 11125 10244
         3 11388 11045 11511 13007

Overall Statistics
                                          
               Accuracy : 0.2713          
                 95% CI : (0.2693, 0.2734)
    No Information Rate : 0.253           
    P-Value [Acc > NIR] : < 2.2e-16       
                                          
                  Kappa : 0.0284          
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.28626  0.26109  0.24780  0.28998
Specificity           0.74684  0.75599  0.77441  0.75111
Pos Pred Value        0.27688  0.26478  0.26563  0.27703
Neg Pred Value        0.75551  0.75246  0.75767  0.76283
Prevalence            0.25296  0.25182  0.24772  0.24750
Detection Rate        0.07241  0.06575  0.06138  0.07177
Detection Prevalence  0.26153  0.24831  0.23109  0.25906
Balanced Accuracy     0.51655  0.50854  0.51110  0.52054
-----------------------------------------------------------

f1d.vd :
Confusion Matrix and Statistics

          Reference
Prediction    0    1    2    3
         0 6036 5839 5508 5550
         1 5638 5872 5491 5374
         2 5185 5438 5498 5378
         3 5543 5444 5850 6319

Overall Statistics
                                          
               Accuracy : 0.2637          
                 95% CI : (0.2608, 0.2666)
    No Information Rate : 0.2514          
    P-Value [Acc > NIR] : < 2.2e-16       
                                          
                  Kappa : 0.0183          
 Mcnemar's Test P-Value : 7.245e-06       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.26944  0.25990  0.24603  0.27934
Specificity           0.74990  0.75504  0.76335  0.74998
Pos Pred Value        0.26320  0.26244  0.25573  0.27289
Neg Pred Value        0.75584  0.75260  0.75390  0.75598
Prevalence            0.24901  0.25114  0.24840  0.25145
Detection Rate        0.06709  0.06527  0.06111  0.07024
Detection Prevalence  0.25492  0.24871  0.23898  0.25739
Balanced Accuracy     0.50967  0.50747  0.50469  0.51466
-----------------------------------------------------------

f2d.os :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2     3
         0 13437 12294 11499 11297
         1 11385 11820 11453 10471
         2 10081 10495 11105 10307
         3 11329 11025 11375 13157

Overall Statistics
                                          
               Accuracy : 0.2713          
                 95% CI : (0.2693, 0.2733)
    No Information Rate : 0.2533          
    P-Value [Acc > NIR] : < 2.2e-16       
                                          
                  Kappa : 0.0283          
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.29064  0.25902  0.24443  0.29088
Specificity           0.74255  0.75668  0.77474  0.75434
Pos Pred Value        0.27690  0.26192  0.26448  0.28062
Neg Pred Value        0.75527  0.75390  0.75575  0.76354
Prevalence            0.25328  0.25001  0.24890  0.24781
Detection Rate        0.07362  0.06476  0.06084  0.07208
Detection Prevalence  0.26586  0.24724  0.23003  0.25687
Balanced Accuracy     0.51660  0.50785  0.50958  0.52261
-----------------------------------------------------------

f2d.vd :
Confusion Matrix and Statistics

          Reference
Prediction    0    1    2    3
         0 6315 6052 5785 5814
         1 5616 5934 5654 5421
         2 5082 5201 5410 5283
         3 5392 5341 5552 6111

Overall Statistics
                                          
               Accuracy : 0.2642          
                 95% CI : (0.2613, 0.2671)
    No Information Rate : 0.2515          
    P-Value [Acc > NIR] : < 2.2e-16       
                                          
                  Kappa : 0.019           
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity            0.2819  0.26341  0.24151  0.27005
Specificity            0.7387  0.75249  0.76960  0.75815
Pos Pred Value         0.2635  0.26228  0.25791  0.27286
Neg Pred Value         0.7562  0.75357  0.75371  0.75553
Prevalence             0.2490  0.25041  0.24900  0.25154
Detection Rate         0.0702  0.06596  0.06014  0.06793
Detection Prevalence   0.2664  0.25149  0.23316  0.24895
Balanced Accuracy      0.5103  0.50795  0.50556  0.51410
-----------------------------------------------------------
```
