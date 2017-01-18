# Lanin Training Report
## Training (Startup) Parameters
The training process was started at 2017-01-17_20-55.

The startup Parameters are:

```r
opt
```

```
$xversion
[1] 6

$yversion
[1] 1

$aversion
[1] 2

$rate
[1] 5

$seed
[1] 666

$help
[1] FALSE
```

## Training and Validation Symbols
These Symbols were used for training:

```r
set1Syms
```

```
  [1] "WDC"   "NAV"   "EXPE"  "OXY"   "TSL"   "ATVI"  "SO"    "MGM"  
  [9] "AMD"   "WSM"   "UPS"   "RIO"   "RRC"   "ETN"   "SU"    "ETFC" 
 [17] "QQQ"   "VRTX"  "CDE"   "NVDA"  "SWN"   "BRK.B" "AUY"   "FSLR" 
 [25] "M"     "KEY"   "BCS"   "PBR"   "HAL"   "MS"    "VALE"  "LRCX" 
 [33] "FCX"   "XLY"   "LXK"   "CTL"   "XOP"   "DANG"  "COF"   "DVN"  
 [41] "NOV"   "CIEN"  "CSCO"  "FLR"   "VZ"    "CLNE"  "RGLD"  "NSC"  
 [49] "CLF"   "RL"    "USB"   "BX"    "ITUB"  "CBS"   "PRU"   "ZION" 
 [57] "LMT"   "UAL"   "ACN"   "MU"    "AXL"   "ECA"   "WFT"   "HUN"  
 [65] "RIG"   "LEN"   "ESRX"  "RF"    "HUM"   "FXY"   "CMG"   "EMR"  
 [73] "AKS"   "XLF"   "STX"   "MET"   "AXP"   "HIG"   "AU"    "AVP"  
 [81] "APC"   "FFIV"  "DO"    "CCI"   "GSK"   "A"     "KMB"   "T"    
 [89] "BHP"   "COH"   "AMAT"  "TOT"   "BA"    "MCD"   "SIRI"  "DIA"  
 [97] "NLY"   "XME"   "PFE"   "EWZ"   "URBN"  "MAT"   "HD"    "HES"  
[105] "CAR"   "MPEL"  "WY"    "TIF"   "LVS"   "AMTD"  "IBM"   "CMCSA"
[113] "APA"   "BID"   "BSX"   "GLD"   "DISH"  "GG"    "QCOM"  "TEVA" 
[121] "XLE"   "MSI"   "GDX"   "SCHW"  "PEP"   "WLL"   "WFC"   "EWW"  
[129] "CAG"   "EMC"   "NRG"   "BAC"   "CIT"   "AEM"   "TTWO"  "PAAS" 
[137] "EXC"   "GT"    "ESV"   "SPG"  
```

```r
set2Syms
```

```
  [1] "ABX"  "ADBE" "ADSK" "AEO"  "AEP"  "AIG"  "AKAM" "ALL"  "AMT"  "BBBY"
 [11] "BHI"  "BIIB" "BK"   "BMY"  "CA"   "CAT"  "CCJ"  "CHK"  "CHRW" "CI"  
 [21] "COP"  "CTXS" "CVS"  "CVX"  "CX"   "CY"   "DAL"  "DD"   "DHI"  "DOW" 
 [31] "DRI"  "EEM"  "EFA"  "ERX"  "EUO"  "EWT"  "EWY"  "FDX"  "FITB" "FXE" 
 [41] "FXI"  "GLW"  "GM"   "GME"  "GNW"  "GOLD" "GPS"  "GRMN" "GS"   "HL"  
 [51] "HOG"  "HON"  "HP"   "HRB"  "IBB"  "ILMN" "ISRG" "IWM"  "IYR"  "JCI" 
 [61] "JCP"  "JNPR" "JWN"  "KBH"  "KLAC" "KSS"  "LLY"  "LUV"  "MAR"  "MBI" 
 [71] "MDT"  "MDY"  "MJN"  "MMM"  "MO"   "MOS"  "MSFT" "MT"   "MYL"  "NBR" 
 [81] "NE"   "NEE"  "NEM"  "NFX"  "NGD"  "NTAP" "NTES" "NUE"  "ORCL" "PAYX"
 [91] "PCLN" "PG"   "PM"   "PNC"  "PNRA" "POT"  "PXD"  "RAX"  "RDN"  "RHT" 
[101] "RSX"  "RTN"  "SCO"  "SHLD" "SLW"  "SNE"  "SOHU" "SPLS" "SSRI" "STT" 
[111] "SWK"  "SWKS" "SYK"  "SYMC" "SYNA" "TCK"  "TEX"  "TGT"  "TLT"  "TOL" 
[121] "TRV"  "TSLA" "TWX"  "TXT"  "USG"  "UTX"  "VMW"  "VWO"  "WIN"  "WM"  
[131] "WMT"  "WNR"  "X"    "XLK"  "XLNX" "XLV"  "XRX"  "YHOO" "YUM" 
```

```r
vdSyms
```

```
 [1] "SPX"  "CMI"  "XLU"  "CNQ"  "GE"   "RUT"  "XLI"  "KGC"  "ADI"  "DFS" 
[11] "SLV"  "ADM"  "AZO"  "BP"   "CNX"  "SPY"  "AG"   "TSN"  "JBL"  "INTC"
[21] "WMB"  "MON"  "XLB"  "BKS"  "SLB"  "DE"   "AGO"  "WU"   "LOW"  "STI" 
[31] "IAG"  "GIS"  "XOM"  "JBLU" "MRK"  "IP"   "DECK" "SYY"  "RCL"  "KRE" 
[41] "CREE" "JNJ"  "BBT"  "TXN"  "WHR"  "OEF"  "F"    "LYB"  "WYNN" "XHB" 
[51] "AMGN" "ARMH" "BG"   "NUAN" "AFL"  "MRVL" "BIDU" "SINA" "TSO"  "AET" 
[61] "UNH"  "PHM"  "CPB"  "MAS"  "XLP"  "USO"  "VLO"  "SCCO" "JPM" 
```

## Training Set Generation
### X
Input Variables: Input features: ADX, SMA50, SMA9, RSI14, putcallratio, smoothputcallratio,
Output: from 1 to 30 periods in future

Example of raw data set:

```r
head(set1.RAW[[1]][complete.cases(set1.RAW[[1]])])
```

```
                  pcr       pcr_5      ADX        dADX     DInorm
2011-06-14  0.9757965  0.63501156 29.99336 -0.12578320 -0.2835817
2011-06-15  1.2925262  0.91995153 28.84255 -1.15080932 -0.1388203
2011-06-16  0.4652630  0.70327477 28.72189 -0.12065550 -0.2715337
2011-06-17 -1.5913542 -0.44386881 28.11968 -0.60221455 -0.2029089
2011-06-20  0.4107865 -0.26934477 28.15339  0.03371121 -0.2859163
2011-06-21  0.8971866 -0.05310884 27.36067 -0.79272260 -0.1705527
               C2SMA50  dSMA50       C2SMA9       dSMA9    RSI14  dRSI14_3
2011-06-14 -0.05559955 -0.0564  0.029663147  0.01111111 47.24137  6.453564
2011-06-15 -0.09084309 -0.0628 -0.001593807 -0.09666667 39.84856  2.835875
2011-06-16 -0.08635328 -0.0556  0.003341444 -0.07888889 40.59936  3.776951
2011-06-17 -0.10916044 -0.0840 -0.017063374 -0.09444444 36.36315 -3.626072
2011-06-20 -0.10560000 -0.0860 -0.013864013 -0.07666667 36.63700 -1.070519
2011-06-21 -0.06170066 -0.0798  0.020747550  0.12333333 47.30126  2.233969
           adv_1_30    dec_1_30
2011-06-14 3.152313  1.88540219
2011-06-15 4.217382  0.66742973
2011-06-16 4.179612  0.76348889
2011-06-17 4.862574 -0.02888658
2011-06-20 4.930669  0.70718764
2011-06-21 3.527583  1.93018717
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
0.8615062 2.2359704 4.0172270 
```

```r
set2.adv.boundaries
```

```
      25%       50%       75% 
0.9446338 2.3608165 4.1495168 
```

```r
vd.adv.boundaries 
```

```
      25%       50%       75% 
0.9663973 2.3418742 4.1025514 
```

```r
set1.dec.boundaries
```

```
      25%       50%       75% 
0.6934371 2.0297723 3.9560794 
```

```r
set2.dec.boundaries
```

```
      25%       50%       75% 
0.6426082 1.9540387 3.8726396 
```

```r
vd.dec.boundaries 
```

```
      25%       50%       75% 
0.6476853 1.9500922 3.7881544 
```

### Schema of Training Data Set
Example:

```r
head(trainDF1a.t)
```

```
         pcr       pcr_5      ADX        dADX     DInorm     C2SMA50
1  0.9757965  0.63501156 29.99336 -0.12578320 -0.2835817 -0.05559955
2  1.2925262  0.91995153 28.84255 -1.15080932 -0.1388203 -0.09084309
3  0.4652630  0.70327477 28.72189 -0.12065550 -0.2715337 -0.08635328
4 -1.5913542 -0.44386881 28.11968 -0.60221455 -0.2029089 -0.10916044
5  0.4107865 -0.26934477 28.15339  0.03371121 -0.2859163 -0.10560000
6  0.8971866 -0.05310884 27.36067 -0.79272260 -0.1705527 -0.06170066
   dSMA50       C2SMA9       dSMA9    RSI14  dRSI14_3 y
1 -0.0564  0.029663147  0.01111111 47.24137  6.453564 2
2 -0.0628 -0.001593807 -0.09666667 39.84856  2.835875 3
3 -0.0556  0.003341444 -0.07888889 40.59936  3.776951 3
4 -0.0840 -0.017063374 -0.09444444 36.36315 -3.626072 3
5 -0.0860 -0.013864013 -0.07666667 36.63700 -1.070519 3
6 -0.0798  0.020747550  0.12333333 47.30126  2.233969 2
```

## Training Algorithm
Training Algorithm: Use only single core processing to prevent excessive memory consumption

### Confusion Matrices

```
f1a.os :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2     3
         0 10598 11020 10831 10866
         1  9870 10512 10600 10433
         2  9323 10435 11538 11402
         3 11544 11458 12872 15147

Overall Statistics
                                          
               Accuracy : 0.2678          
                 95% CI : (0.2658, 0.2699)
    No Information Rate : 0.2681          
    P-Value [Acc > NIR] : 0.6124          
                                          
                  Kappa : 0.0227          
 Mcnemar's Test P-Value : <2e-16          

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.25639  0.24207  0.25170  0.31656
Specificity           0.76139  0.77113  0.76502  0.72532
Pos Pred Value        0.24467  0.25382  0.27022  0.29688
Neg Pred Value        0.77254  0.75982  0.74731  0.74338
Prevalence            0.23163  0.24335  0.25689  0.26813
Detection Rate        0.05939  0.05891  0.06466  0.08488
Detection Prevalence  0.24273  0.23208  0.23927  0.28591
Balanced Accuracy     0.50889  0.50660  0.50836  0.52094
-----------------------------------------------------------

f1a.vd :
Confusion Matrix and Statistics

          Reference
Prediction    0    1    2    3
         0 4903 5068 4862 5009
         1 4566 5200 5201 4844
         2 4621 5275 5794 5402
         3 5975 6614 7074 8173

Overall Statistics
                                          
               Accuracy : 0.2717          
                 95% CI : (0.2688, 0.2747)
    No Information Rate : 0.2645          
    P-Value [Acc > NIR] : 5.485e-07       
                                          
                  Kappa : 0.0271          
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.24436   0.2347  0.25267  0.34886
Specificity           0.78196   0.7800  0.76698  0.69820
Pos Pred Value        0.24710   0.2625  0.27470  0.29361
Neg Pred Value        0.77943   0.7534  0.74608  0.74887
Prevalence            0.22652   0.2501  0.25887  0.26448
Detection Rate        0.05535   0.0587  0.06541  0.09227
Detection Prevalence  0.22400   0.2236  0.23811  0.31424
Balanced Accuracy     0.51316   0.5074  0.50982  0.52353
-----------------------------------------------------------

f2a.os :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2     3
         0 12321 10750 10133  9754
         1 11328 11104 10161  8974
         2 11068 10954 10770 10167
         3 12631 12827 12857 13938

Overall Statistics
                                          
               Accuracy : 0.2678          
                 95% CI : (0.2658, 0.2699)
    No Information Rate : 0.2634          
    P-Value [Acc > NIR] : 1.371e-05       
                                          
                  Kappa : 0.0246          
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.26022  0.24332  0.24521  0.32540
Specificity           0.76858  0.77284  0.76300  0.72013
Pos Pred Value        0.28682  0.26713  0.25070  0.26674
Neg Pred Value        0.74392  0.75008  0.75763  0.77334
Prevalence            0.26343  0.25390  0.24436  0.23831
Detection Rate        0.06855  0.06178  0.05992  0.07755
Detection Prevalence  0.23900  0.23127  0.23901  0.29072
Balanced Accuracy     0.51440  0.50808  0.50410  0.52277
-----------------------------------------------------------

f2a.vd :
Confusion Matrix and Statistics

          Reference
Prediction    0    1    2    3
         0 5327 5090 4669 4722
         1 5005 5455 5226 4594
         2 5123 5476 5595 5440
         3 6043 6633 6933 7250

Overall Statistics
                                          
               Accuracy : 0.2667          
                 95% CI : (0.2638, 0.2697)
    No Information Rate : 0.2557          
    P-Value [Acc > NIR] : 4.467e-14       
                                          
                  Kappa : 0.0223          
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.24779  0.24080  0.24952  0.32946
Specificity           0.78413  0.77513  0.75757  0.70546
Pos Pred Value        0.26893  0.26898  0.25862  0.26993
Neg Pred Value        0.76486  0.74819  0.74864  0.76093
Prevalence            0.24269  0.25574  0.25314  0.24843
Detection Rate        0.06014  0.06158  0.06316  0.08185
Detection Prevalence  0.22361  0.22894  0.24423  0.30321
Balanced Accuracy     0.51596  0.50796  0.50354  0.51746
-----------------------------------------------------------

f1d.os :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2     3
         0 13563 11770 10984 11304
         1 11014 10735 10171  9446
         2 10437 10597 10439  9709
         3 12303 12044 11356 12577

Overall Statistics
                                          
               Accuracy : 0.2651          
                 95% CI : (0.2631, 0.2672)
    No Information Rate : 0.2652          
    P-Value [Acc > NIR] : 0.5073          
                                          
                  Kappa : 0.0199          
 Mcnemar's Test P-Value : <2e-16          

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity            0.2866  0.23778   0.2431  0.29224
Specificity            0.7403  0.77022   0.7731  0.73634
Pos Pred Value         0.2848  0.25951   0.2535  0.26050
Neg Pred Value         0.7420  0.74898   0.7632  0.76600
Prevalence             0.2652  0.25299   0.2407  0.24117
Detection Rate         0.0760  0.06016   0.0585  0.07048
Detection Prevalence   0.2669  0.23181   0.2308  0.27055
Balanced Accuracy      0.5135  0.50400   0.5081  0.51429
-----------------------------------------------------------

f1d.vd :
Confusion Matrix and Statistics

          Reference
Prediction    0    1    2    3
         0 7173 6363 5725 5355
         1 5255 5224 5087 4383
         2 4750 5124 5307 4425
         3 6160 5947 5962 6341

Overall Statistics
                                          
               Accuracy : 0.2714          
                 95% CI : (0.2685, 0.2744)
    No Information Rate : 0.2635          
    P-Value [Acc > NIR] : 3.891e-08       
                                          
                  Kappa : 0.0289          
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.30735  0.23056  0.24034  0.30926
Specificity           0.73265  0.77663  0.78498  0.73458
Pos Pred Value        0.29140  0.26187  0.27068  0.25977
Neg Pred Value        0.74728  0.74598  0.75681  0.77929
Prevalence            0.26347  0.25579  0.24927  0.23147
Detection Rate        0.08098  0.05897  0.05991  0.07158
Detection Prevalence  0.27789  0.22521  0.22133  0.27557
Balanced Accuracy     0.52000  0.50360  0.51266  0.52192
-----------------------------------------------------------

f2d.os :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2     3
         0 12737 12297 11671 11754
         1 10500 10779 10767 10542
         2  9647 10742 11550 10734
         3 10805 10774 11250 13188

Overall Statistics
                                          
               Accuracy : 0.2685          
                 95% CI : (0.2664, 0.2705)
    No Information Rate : 0.2571          
    P-Value [Acc > NIR] : < 2.2e-16       
                                          
                  Kappa : 0.0247          
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.29154  0.24172  0.25532  0.28534
Specificity           0.73743  0.76463  0.76860  0.75412
Pos Pred Value        0.26284  0.25310  0.27066  0.28659
Neg Pred Value        0.76423  0.75346  0.75422  0.75299
Prevalence            0.24307  0.24810  0.25169  0.25714
Detection Rate        0.07086  0.05997  0.06426  0.07337
Detection Prevalence  0.26961  0.23695  0.23742  0.25602
Balanced Accuracy     0.51448  0.50318  0.51196  0.51973
-----------------------------------------------------------

f2d.vd :
Confusion Matrix and Statistics

          Reference
Prediction    0    1    2    3
         0 6655 6172 5806 5541
         1 5242 5421 5416 4506
         2 4724 5143 5623 4622
         3 5776 5683 5740 6511

Overall Statistics
                                          
               Accuracy : 0.2733          
                 95% CI : (0.2704, 0.2763)
    No Information Rate : 0.255           
    P-Value [Acc > NIR] : < 2.2e-16       
                                          
                  Kappa : 0.0315          
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.29714   0.2418  0.24897   0.3074
Specificity           0.73530   0.7708  0.78046   0.7448
Pos Pred Value        0.27530   0.2633  0.27958   0.2746
Neg Pred Value        0.75559   0.7500  0.75227   0.7739
Prevalence            0.25284   0.2531  0.25496   0.2391
Detection Rate        0.07513   0.0612  0.06348   0.0735
Detection Prevalence  0.27290   0.2324  0.22705   0.2677
Balanced Accuracy     0.51622   0.5063  0.51471   0.5261
-----------------------------------------------------------
```
