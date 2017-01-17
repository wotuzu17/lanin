# Lanin Training Report
## Training (Startup) Parameters
The training process was started at 2017-01-16_21-50.

The startup Parameters are:

```r
opt
```

```
$xversion
[1] 3

$yversion
[1] 2

$aversion
[1] 2

$rate
[1] 5

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
                  C2SMA9        dSMA9    RSI14  dRSI14_3 adv_1_20
2011-06-14 -0.0001972678 -0.075555556 41.10264  1.375056 5.289608
2011-06-15 -0.0151538036 -0.130000000 35.89203  1.527000 6.271367
2011-06-16 -0.0080260848 -0.076666667 37.37885  1.664960 6.208686
2011-06-17 -0.0018460310 -0.016666667 39.64020 -0.487481 6.008571
2011-06-20  0.0114212573  0.001111111 44.98861  3.032194 5.302866
2011-06-21  0.0219790907  0.035555556 49.48743  4.036193 4.617909
             dec_1_20
2011-06-14  0.9931509
2011-06-15 -0.1724087
2011-06-16 -0.2632658
2011-06-17 -0.6651555
2011-06-20 -0.6161006
2011-06-21  0.0000000
```

### Y
Output Variables: Class of upward/downward price shift in 3 equal classes of ATR returns. 
Classify price advances / declines.

Boundaries:

```r
set1.adv.boundaries
```

```
   33.3%    66.7% 
1.008646 2.673864 
```

```r
set2.adv.boundaries
```

```
   33.3%    66.7% 
1.010787 2.658423 
```

```r
vd.adv.boundaries 
```

```
   33.3%    66.7% 
1.012376 2.672948 
```

```r
set1.dec.boundaries
```

```
    33.3%     66.7% 
0.7840227 2.4878537 
```

```r
set2.dec.boundaries
```

```
    33.3%     66.7% 
0.7868784 2.4818193 
```

```r
vd.dec.boundaries 
```

```
    33.3%     66.7% 
0.8083776 2.4966987 
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
1 -0.075555556 41.10264  1.375056 2
2 -0.130000000 35.89203  1.527000 2
3 -0.076666667 37.37885  1.664960 2
4 -0.016666667 39.64020 -0.487481 2
5  0.001111111 44.98861  3.032194 2
6  0.035555556 49.48743  4.036193 2
```

## Training Algorithm
Training Algorithm: Use only single core processing to prevent excessive memory consumption

### Confusion Matrices

```
f1a.os :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2
         0 20299 19222 17546
         1 18306 19982 18698
         2 20545 21356 23891

Overall Statistics
                                         
               Accuracy : 0.3568         
                 95% CI : (0.3546, 0.359)
    No Information Rate : 0.3367         
    P-Value [Acc > NIR] : < 2.2e-16      
                                         
                  Kappa : 0.0352         
 Mcnemar's Test P-Value : < 2.2e-16      

Statistics by Class:

                     Class: 0 Class: 1 Class: 2
Sensitivity            0.3432   0.3300   0.3973
Specificity            0.6954   0.6898   0.6500
Pos Pred Value         0.3557   0.3506   0.3631
Neg Pred Value         0.6836   0.6697   0.6822
Prevalence             0.3289   0.3367   0.3344
Detection Rate         0.1129   0.1111   0.1328
Detection Prevalence   0.3173   0.3169   0.3658
Balanced Accuracy      0.5193   0.5099   0.5236
-----------------------------------------------------------

f1a.vd :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2
         0 10005  9733  9326
         1  9287  9838  9281
         2 10098 10321 11384

Overall Statistics
                                          
               Accuracy : 0.3498          
                 95% CI : (0.3467, 0.3529)
    No Information Rate : 0.3359          
    P-Value [Acc > NIR] : < 2.2e-16       
                                          
                  Kappa : 0.0246          
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2
Sensitivity            0.3404   0.3291   0.3796
Specificity            0.6817   0.6873   0.6556
Pos Pred Value         0.3442   0.3463   0.3580
Neg Pred Value         0.6780   0.6705   0.6762
Prevalence             0.3292   0.3348   0.3359
Detection Rate         0.1121   0.1102   0.1275
Detection Prevalence   0.3256   0.3182   0.3562
Balanced Accuracy      0.5111   0.5082   0.5176
-----------------------------------------------------------

f2a.os :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2
         0 19938 18216 17768
         1 19838 21119 20252
         2 19895 20646 23458

Overall Statistics
                                         
               Accuracy : 0.3562         
                 95% CI : (0.354, 0.3584)
    No Information Rate : 0.3394         
    P-Value [Acc > NIR] : < 2.2e-16      
                                         
                  Kappa : 0.034          
 Mcnemar's Test P-Value : < 2.2e-16      

Statistics by Class:

                     Class: 0 Class: 1 Class: 2
Sensitivity            0.3341   0.3521   0.3816
Specificity            0.7037   0.6691   0.6612
Pos Pred Value         0.3565   0.3450   0.3665
Neg Pred Value         0.6827   0.6759   0.6754
Prevalence             0.3294   0.3311   0.3394
Detection Rate         0.1101   0.1166   0.1295
Detection Prevalence   0.3087   0.3379   0.3533
Balanced Accuracy      0.5189   0.5106   0.5214
-----------------------------------------------------------

f2a.vd :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2
         0  9721  9110  9060
         1  9644 10121  9754
         2 10064 10395 11404

Overall Statistics
                                          
               Accuracy : 0.35            
                 95% CI : (0.3469, 0.3531)
    No Information Rate : 0.3385          
    P-Value [Acc > NIR] : 2.112e-13       
                                          
                  Kappa : 0.0247          
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2
Sensitivity            0.3303   0.3416   0.3774
Specificity            0.6964   0.6748   0.6536
Pos Pred Value         0.3485   0.3429   0.3579
Neg Pred Value         0.6789   0.6736   0.6723
Prevalence             0.3297   0.3319   0.3385
Detection Rate         0.1089   0.1134   0.1277
Detection Prevalence   0.3124   0.3307   0.3569
Balanced Accuracy      0.5133   0.5082   0.5155
-----------------------------------------------------------

f1d.os :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2
         0 22872 20981 19599
         1 18771 19839 18501
         2 18911 19380 20991

Overall Statistics
                                         
               Accuracy : 0.3542         
                 95% CI : (0.352, 0.3564)
    No Information Rate : 0.3367         
    P-Value [Acc > NIR] : < 2.2e-16      
                                         
                  Kappa : 0.0312         
 Mcnemar's Test P-Value : < 2.2e-16      

Statistics by Class:

                     Class: 0 Class: 1 Class: 2
Sensitivity            0.3777   0.3296   0.3552
Specificity            0.6598   0.6885   0.6829
Pos Pred Value         0.3605   0.3474   0.3541
Neg Pred Value         0.6763   0.6712   0.6840
Prevalence             0.3367   0.3347   0.3286
Detection Rate         0.1272   0.1103   0.1167
Detection Prevalence   0.3528   0.3176   0.3296
Balanced Accuracy      0.5188   0.5090   0.5191
-----------------------------------------------------------

f1d.vd :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2
         0 10669 10306  9696
         1  9558 10134  9574
         2  9316  9716 10304

Overall Statistics
                                          
               Accuracy : 0.3484          
                 95% CI : (0.3453, 0.3516)
    No Information Rate : 0.3378          
    P-Value [Acc > NIR] : 9.755e-12       
                                          
                  Kappa : 0.0227          
 Mcnemar's Test P-Value : 5.054e-08       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2
Sensitivity            0.3611   0.3361   0.3484
Specificity            0.6651   0.6764   0.6812
Pos Pred Value         0.3479   0.3463   0.3512
Neg Pred Value         0.6779   0.6663   0.6785
Prevalence             0.3309   0.3378   0.3313
Detection Rate         0.1195   0.1135   0.1154
Detection Prevalence   0.3436   0.3278   0.3286
Balanced Accuracy      0.5131   0.5062   0.5148
-----------------------------------------------------------

f2d.os :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2
         0 23269 20888 20164
         1 19123 20075 18806
         2 18815 19075 20915

Overall Statistics
                                         
               Accuracy : 0.3548         
                 95% CI : (0.3526, 0.357)
    No Information Rate : 0.3379         
    P-Value [Acc > NIR] : < 2.2e-16      
                                         
                  Kappa : 0.0319         
 Mcnemar's Test P-Value : < 2.2e-16      

Statistics by Class:

                     Class: 0 Class: 1 Class: 2
Sensitivity            0.3802   0.3344   0.3493
Specificity            0.6577   0.6868   0.6875
Pos Pred Value         0.3618   0.3461   0.3557
Neg Pred Value         0.6752   0.6754   0.6814
Prevalence             0.3379   0.3315   0.3306
Detection Rate         0.1285   0.1108   0.1155
Detection Prevalence   0.3551   0.3202   0.3247
Balanced Accuracy      0.5189   0.5106   0.5184
-----------------------------------------------------------

f2d.vd :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2
         0 11121 10678 10184
         1  9454  9989  9491
         2  9030  9340  9986

Overall Statistics
                                          
               Accuracy : 0.3483          
                 95% CI : (0.3452, 0.3515)
    No Information Rate : 0.3361          
    P-Value [Acc > NIR] : 7.352e-15       
                                          
                  Kappa : 0.0226          
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2
Sensitivity            0.3756   0.3329   0.3367
Specificity            0.6504   0.6803   0.6918
Pos Pred Value         0.3477   0.3452   0.3522
Neg Pred Value         0.6774   0.6682   0.6770
Prevalence             0.3316   0.3361   0.3323
Detection Rate         0.1246   0.1119   0.1119
Detection Prevalence   0.3583   0.3241   0.3176
Balanced Accuracy      0.5130   0.5066   0.5143
-----------------------------------------------------------
```
