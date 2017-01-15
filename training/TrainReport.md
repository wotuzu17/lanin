# Lanin Training Report
## Training (Startup) Parameters
The training process was started at 2017-01-15_17-27.

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
Input Variables: First toy model. Input features: ADX, EMA50, EMA9.

Example of raw data set:

```r
head(set1.RAW[[1]][complete.cases(set1.RAW[[1]])])
```

```
                ADX       dADX      DInorm     C2EMA50      dEMA50
2011-06-14 18.26131 -0.3042618 -0.14305909 -0.04835052 -0.04446275
2011-06-15 18.40959  0.1482766 -0.20337184 -0.06744807 -0.06075832
2011-06-16 18.91065  0.5010596 -0.25424422 -0.06109890 -0.05523839
2011-06-17 18.53816 -0.3724888 -0.13695805 -0.05320944 -0.04836630
2011-06-20 18.19228 -0.3458824 -0.13695805 -0.03767255 -0.03470487
2011-06-21 16.91554 -1.2767361  0.00317972 -0.02397837 -0.02236350
                  C2EMA9        dEMA9 adv_1_10   dec_1_10
2011-06-14 -0.0009926591 -0.005591152 2.634009  0.9931509
2011-06-15 -0.0174848975 -0.096472922 4.547280 -0.1724087
2011-06-16 -0.0110480068 -0.061178337 5.528583 -0.2632658
2011-06-17 -0.0044800485 -0.024942670 5.986399 -0.6651555
2011-06-20  0.0070971846  0.040045864 5.280862 -0.6161006
2011-06-21  0.0154112370  0.088036691 4.596229  0.0000000
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
       ADX       dADX      DInorm     C2EMA50      dEMA50        C2EMA9
1 18.26131 -0.3042618 -0.14305909 -0.04835052 -0.04446275 -0.0009926591
2 18.40959  0.1482766 -0.20337184 -0.06744807 -0.06075832 -0.0174848975
3 18.91065  0.5010596 -0.25424422 -0.06109890 -0.05523839 -0.0110480068
4 18.53816 -0.3724888 -0.13695805 -0.05320944 -0.04836630 -0.0044800485
5 18.19228 -0.3458824 -0.13695805 -0.03767255 -0.03470487  0.0070971846
6 16.91554 -1.2767361  0.00317972 -0.02397837 -0.02236350  0.0154112370
         dEMA9 y
1 -0.005591152 3
2 -0.096472922 3
3 -0.061178337 3
4 -0.024942670 3
5  0.040045864 3
6  0.088036691 3
```

## Training Algorithm
Training Algorithm: Algo Explanation

### Confusion Matrices

```
f1a.os :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2     3
         0 11359 10933 10993 10602
         1 10904 11068 10762 10319
         2 10925 11226 11411 11327
         3 11766 11873 12376 13391

Overall Statistics
                                          
               Accuracy : 0.2606          
                 95% CI : (0.2586, 0.2626)
    No Information Rate : 0.2518          
    P-Value [Acc > NIR] : < 2.2e-16       
                                          
                  Kappa : 0.014           
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.25268  0.24541  0.25056  0.29341
Specificity           0.76132  0.76505  0.75328  0.73439
Pos Pred Value        0.25882  0.25708  0.25420  0.27104
Neg Pred Value        0.75540  0.75372  0.74967  0.75538
Prevalence            0.24804  0.24885  0.25129  0.25182
Detection Rate        0.06268  0.06107  0.06296  0.07389
Detection Prevalence  0.24216  0.23755  0.24768  0.27261
Balanced Accuracy     0.50700  0.50523  0.50192  0.51390
-----------------------------------------------------------

f1a.vd :
Confusion Matrix and Statistics

          Reference
Prediction    0    1    2    3
         0 5599 5318 5293 5509
         1 5379 5285 5373 5198
         2 5540 5527 5705 5609
         3 6033 5930 6053 6612

Overall Statistics
                                         
               Accuracy : 0.2579         
                 95% CI : (0.255, 0.2608)
    No Information Rate : 0.2549         
    P-Value [Acc > NIR] : 0.01864        
                                         
                  Kappa : 0.0103         
 Mcnemar's Test P-Value : < 2e-16        

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.24828  0.23957  0.25441   0.2884
Specificity           0.76087  0.76511  0.75309   0.7312
Pos Pred Value        0.25779  0.24888  0.25490   0.2685
Neg Pred Value        0.75160  0.75592  0.75261   0.7503
Prevalence            0.25067  0.24521  0.24926   0.2549
Detection Rate        0.06224  0.05875  0.06341   0.0735
Detection Prevalence  0.24142  0.23604  0.24878   0.2738
Balanced Accuracy     0.50458  0.50234  0.50375   0.5098
-----------------------------------------------------------

f2a.os :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2     3
         0 11359 11083 10746 10646
         1 11019 11183 11033 10754
         2 10793 11071 11513 11546
         3 11800 11930 12461 13593

Overall Statistics
                                         
               Accuracy : 0.261          
                 95% CI : (0.259, 0.2631)
    No Information Rate : 0.255          
    P-Value [Acc > NIR] : 1.441e-09      
                                         
                  Kappa : 0.0145         
 Mcnemar's Test P-Value : < 2.2e-16      

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.25258  0.24705  0.25163  0.29208
Specificity           0.76392  0.76100  0.75573  0.73387
Pos Pred Value        0.25914  0.25422  0.25628  0.27304
Neg Pred Value        0.75766  0.75398  0.75118  0.75181
Prevalence            0.24638  0.24800  0.25066  0.25497
Detection Rate        0.06223  0.06127  0.06307  0.07447
Detection Prevalence  0.24015  0.24100  0.24611  0.27274
Balanced Accuracy     0.50825  0.50402  0.50368  0.51297
-----------------------------------------------------------

f2a.vd :
Confusion Matrix and Statistics

          Reference
Prediction    0    1    2    3
         0 5650 5407 5411 5340
         1 5403 5288 5429 5375
         2 5411 5369 5495 5667
         3 6020 5994 6023 6681

Overall Statistics
                                          
               Accuracy : 0.2569          
                 95% CI : (0.2541, 0.2598)
    No Information Rate : 0.2564          
    P-Value [Acc > NIR] : 0.3497          
                                          
                  Kappa : 0.0089          
 Mcnemar's Test P-Value : 2.5e-16         

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity            0.2513  0.23973  0.24577  0.28968
Specificity            0.7605  0.76133  0.75672  0.73039
Pos Pred Value         0.2591  0.24601  0.25043  0.27029
Neg Pred Value         0.7530  0.75507  0.75209  0.74892
Prevalence             0.2499  0.24519  0.24852  0.25636
Detection Rate         0.0628  0.05878  0.06108  0.07426
Detection Prevalence   0.2424  0.23893  0.24390  0.27476
Balanced Accuracy      0.5059  0.50053  0.50125  0.51004
-----------------------------------------------------------

f1d.os :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2     3
         0 12534 11897 11453 11341
         1 11207 11733 11283 10510
         2 10567 10794 10811 10758
         3 11538 11215 11348 12246

Overall Statistics
                                          
               Accuracy : 0.2611          
                 95% CI : (0.2591, 0.2631)
    No Information Rate : 0.253           
    P-Value [Acc > NIR] : 8.864e-16       
                                          
                  Kappa : 0.0148          
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.27339  0.25708  0.24081  0.27301
Specificity           0.74377  0.75663  0.76442  0.74996
Pos Pred Value        0.26541  0.26229  0.25183  0.26422
Neg Pred Value        0.75142  0.75161  0.75356  0.75825
Prevalence            0.25296  0.25182  0.24772  0.24750
Detection Rate        0.06916  0.06474  0.05965  0.06757
Detection Prevalence  0.26057  0.24682  0.23687  0.25573
Balanced Accuracy     0.50858  0.50686  0.50261  0.51148
-----------------------------------------------------------

f1d.vd :
Confusion Matrix and Statistics

          Reference
Prediction    0    1    2    3
         0 5915 5851 5703 5648
         1 5616 5625 5415 5365
         2 5305 5500 5580 5528
         3 5566 5617 5649 6080

Overall Statistics
                                         
               Accuracy : 0.2579         
                 95% CI : (0.255, 0.2608)
    No Information Rate : 0.2514         
    P-Value [Acc > NIR] : 4.628e-06      
                                         
                  Kappa : 0.0105         
 Mcnemar's Test P-Value : 0.0001137      

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.26404  0.24897  0.24970  0.26878
Specificity           0.74539  0.75663  0.75844  0.75005
Pos Pred Value        0.25587  0.25544  0.25464  0.26536
Neg Pred Value        0.75336  0.75026  0.75361  0.75331
Prevalence            0.24901  0.25114  0.24840  0.25145
Detection Rate        0.06575  0.06253  0.06203  0.06758
Detection Prevalence  0.25696  0.24478  0.24358  0.25468
Balanced Accuracy     0.50471  0.50280  0.50407  0.50941
-----------------------------------------------------------

f2d.os :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2     3
         0 21781  8887  8214  8273
         1  8647 20950  8287  7770
         2  7705  8018 20698  7797
         3  8099  7779  8233 21392

Overall Statistics
                                         
               Accuracy : 0.4647         
                 95% CI : (0.4624, 0.467)
    No Information Rate : 0.2533         
    P-Value [Acc > NIR] : < 2.2e-16      
                                         
                  Kappa : 0.2862         
 Mcnemar's Test P-Value : 1.279e-06      

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity            0.4711   0.4591   0.4556   0.4729
Specificity            0.8138   0.8195   0.8284   0.8244
Pos Pred Value         0.4619   0.4589   0.4681   0.4701
Neg Pred Value         0.8194   0.8197   0.8212   0.8260
Prevalence             0.2533   0.2500   0.2489   0.2478
Detection Rate         0.1193   0.1148   0.1134   0.1172
Detection Prevalence   0.2583   0.2501   0.2423   0.2493
Balanced Accuracy      0.6425   0.6393   0.6420   0.6487
-----------------------------------------------------------

f2d.vd :
Confusion Matrix and Statistics

          Reference
Prediction    0    1    2    3
         0 5947 5864 5637 5650
         1 5434 5556 5473 5482
         2 5362 5559 5484 5517
         3 5662 5549 5807 5980

Overall Statistics
                                          
               Accuracy : 0.2553          
                 95% CI : (0.2524, 0.2582)
    No Information Rate : 0.2515          
    P-Value [Acc > NIR] : 0.004803        
                                          
                  Kappa : 0.0071          
 Mcnemar's Test P-Value : 1.815e-05       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity            0.2654  0.24663  0.24481  0.26426
Specificity            0.7461  0.75697  0.75670  0.74726
Pos Pred Value         0.2575  0.25318  0.25016  0.26002
Neg Pred Value         0.7539  0.75048  0.75137  0.75138
Prevalence             0.2490  0.25041  0.24900  0.25154
Detection Rate         0.0661  0.06176  0.06096  0.06647
Detection Prevalence   0.2567  0.24393  0.24368  0.25564
Balanced Accuracy      0.5058  0.50180  0.50075  0.50576
-----------------------------------------------------------
```
