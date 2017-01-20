# Lanin Training Report
## Training (Startup) Parameters
The training process was started at 2017-01-20_17-59.

The startup Parameters are:

```r
opt
```

```
$xversion
[1] 7

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
Input Variables: Input features: ADX, SMA50, SMA9, RSI14, putcallratio, smoothputcallratio,
candlesticks: GapUp, GapDown, Hammer, InvertedHammer, PiercingPattern, DarkCloudCover;
Output: from 1 to 10 periods in future

Example of raw data set:

```r
head(set1.RAW[[1]][complete.cases(set1.RAW[[1]])])
```

```
                 pcr     pcr_5      ADX       dADX      DInorm     C2SMA50
2011-06-14 2.1555519 1.0120063 18.26131 -0.3042618 -0.14305909 -0.04970262
2011-06-15 1.7495219 1.2284987 18.40959  0.1482766 -0.20337184 -0.07040326
2011-06-16 0.3606511 0.7554847 18.91065  0.5010596 -0.25424422 -0.06547178
2011-06-17 0.5143998 0.7112670 18.53816 -0.3724888 -0.13695805 -0.05889537
2011-06-20 0.3649577 0.4800268 18.19228 -0.3458824 -0.13695805 -0.04422685
2011-06-21 2.1850968 0.7459637 16.91554 -1.2767361  0.00317972 -0.03091466
            dSMA50        C2SMA9        dSMA9    RSI14  dRSI14_3 GapUp
2011-06-14 -0.0140 -0.0001972678 -0.075555556 41.10264  1.375056     0
2011-06-15 -0.0260 -0.0151538036 -0.130000000 35.89203  1.527000     0
2011-06-16 -0.0236 -0.0080260848 -0.076666667 37.37885  1.664960     0
2011-06-17 -0.0186 -0.0018460310 -0.016666667 39.64020 -0.487481     0
2011-06-20 -0.0134  0.0114212573  0.001111111 44.98861  3.032194     0
2011-06-21 -0.0118  0.0219790907  0.035555556 49.48743  4.036193     0
           GapDown Hammer InvertedHammer PiercingPattern DarkCloudCover
2011-06-14       0      0              0               0              0
2011-06-15       0      0              0               0              0
2011-06-16       0      0              0               0              0
2011-06-17       0      0              0               0              0
2011-06-20       0      0              0               0              0
2011-06-21       0      0              0               0              0
           adv_1_10   dec_1_10
2011-06-14 2.634009  0.9931509
2011-06-15 4.547280 -0.1724087
2011-06-16 5.528583 -0.2632658
2011-06-17 5.986399 -0.6651555
2011-06-20 5.280862 -0.6161006
2011-06-21 4.596229  0.0000000
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
        pcr     pcr_5      ADX       dADX      DInorm     C2SMA50  dSMA50
1 2.1555519 1.0120063 18.26131 -0.3042618 -0.14305909 -0.04970262 -0.0140
2 1.7495219 1.2284987 18.40959  0.1482766 -0.20337184 -0.07040326 -0.0260
3 0.3606511 0.7554847 18.91065  0.5010596 -0.25424422 -0.06547178 -0.0236
4 0.5143998 0.7112670 18.53816 -0.3724888 -0.13695805 -0.05889537 -0.0186
5 0.3649577 0.4800268 18.19228 -0.3458824 -0.13695805 -0.04422685 -0.0134
6 2.1850968 0.7459637 16.91554 -1.2767361  0.00317972 -0.03091466 -0.0118
         C2SMA9        dSMA9    RSI14  dRSI14_3 GapUp GapDown Hammer
1 -0.0001972678 -0.075555556 41.10264  1.375056     0       0      0
2 -0.0151538036 -0.130000000 35.89203  1.527000     0       0      0
3 -0.0080260848 -0.076666667 37.37885  1.664960     0       0      0
4 -0.0018460310 -0.016666667 39.64020 -0.487481     0       0      0
5  0.0114212573  0.001111111 44.98861  3.032194     0       0      0
6  0.0219790907  0.035555556 49.48743  4.036193     0       0      0
  InvertedHammer PiercingPattern DarkCloudCover y
1              0               0              0 3
2              0               0              0 3
3              0               0              0 3
4              0               0              0 3
5              0               0              0 3
6              0               0              0 3
```

## Training Algorithm
Training Algorithm: Use only single core processing to prevent excessive memory consumption

### Used TrainIt function

```r
trainIt
```

```
## function (train) 
## {
##     fitControl <- trainControl(method = "cv", returnData = TRUE, 
##         returnResamp = "none")
##     fit <- train(y ~ ., data = train, method = "rf", trControl = fitControl)
##     return(fit)
## }
```

### train objects
required time:


```r
time.1a
```

```
## Time difference of 49.63439 mins
```

```r
time.2a
```

```
## Time difference of 46.50643 mins
```

```r
time.1d
```

```
## Time difference of 50.64741 mins
```

```r
time.2d
```

```
## Time difference of 49.47797 mins
```


```
f1a :
Random Forest 

45634 samples
   17 predictors
    4 classes: '0', '1', '2', '3' 

No pre-processing
Resampling: Cross-Validated (10 fold) 
Summary of sample sizes: 41072, 41069, 41072, 41070, 41070, 41070, ... 
Resampling results across tuning parameters:

  mtry  Accuracy   Kappa     
   2    0.2972343  0.06219143
   9    0.3037646  0.07140977
  17    0.3064819  0.07505580

Accuracy was used to select the optimal model using  the largest value.
The final value used for the model was mtry = 17. 
-----------------------------------------------------------

f2a :
Random Forest 

45311 samples
   17 predictors
    4 classes: '0', '1', '2', '3' 

No pre-processing
Resampling: Cross-Validated (10 fold) 
Summary of sample sizes: 40779, 40780, 40780, 40781, 40778, 40781, ... 
Resampling results across tuning parameters:

  mtry  Accuracy   Kappa     
   2    0.2982279  0.06338405
   9    0.3099245  0.07967526
  17    0.3088215  0.07821303

Accuracy was used to select the optimal model using  the largest value.
The final value used for the model was mtry = 9. 
-----------------------------------------------------------

f1d :
Random Forest 

45633 samples
   17 predictors
    4 classes: '0', '1', '2', '3' 

No pre-processing
Resampling: Cross-Validated (10 fold) 
Summary of sample sizes: 41069, 41070, 41071, 41070, 41069, 41070, ... 
Resampling results across tuning parameters:

  mtry  Accuracy   Kappa     
   2    0.3001558  0.06682519
   9    0.3088991  0.07847794
  17    0.3089432  0.07853477

Accuracy was used to select the optimal model using  the largest value.
The final value used for the model was mtry = 17. 
-----------------------------------------------------------

f2d :
Random Forest 

45310 samples
   17 predictors
    4 classes: '0', '1', '2', '3' 

No pre-processing
Resampling: Cross-Validated (10 fold) 
Summary of sample sizes: 40779, 40779, 40778, 40780, 40779, 40778, ... 
Resampling results across tuning parameters:

  mtry  Accuracy   Kappa     
   2    0.2962922  0.06118505
   9    0.3044361  0.07248913
  17    0.3057161  0.07419852

Accuracy was used to select the optimal model using  the largest value.
The final value used for the model was mtry = 17. 
-----------------------------------------------------------
```

### Confusion Matrices

```
f1a.os :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2     3
         0 11623 11053 10570 10006
         1 10342 10738 10348  9691
         2 10503 10979 11451 10837
         3 12486 12330 13173 15105

Overall Statistics
                                         
               Accuracy : 0.2699         
                 95% CI : (0.2679, 0.272)
    No Information Rate : 0.2518         
    P-Value [Acc > NIR] : < 2.2e-16      
                                         
                  Kappa : 0.0264         
 Mcnemar's Test P-Value : < 2.2e-16      

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.25855  0.23809  0.25144  0.33097
Specificity           0.76791  0.77683  0.76182  0.71984
Pos Pred Value        0.26873  0.26114  0.26162  0.28450
Neg Pred Value        0.75844  0.75476  0.75200  0.76172
Prevalence            0.24804  0.24885  0.25129  0.25182
Detection Rate        0.06413  0.05925  0.06318  0.08334
Detection Prevalence  0.23865  0.22688  0.24151  0.29296
Balanced Accuracy     0.51323  0.50746  0.50663  0.52540
-----------------------------------------------------------

f1a.vd :
Confusion Matrix and Statistics

          Reference
Prediction    0    1    2    3
         0 5779 5400 5131 5151
         1 5243 5175 5126 4900
         2 5190 5444 5656 5561
         3 6339 6041 6511 7316

Overall Statistics
                                          
               Accuracy : 0.266           
                 95% CI : (0.2631, 0.2689)
    No Information Rate : 0.2549          
    P-Value [Acc > NIR] : 1.521e-14       
                                          
                  Kappa : 0.0209          
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.25626  0.23459  0.25223  0.31909
Specificity           0.76737  0.77514  0.76021  0.71819
Pos Pred Value        0.26928  0.25313  0.25884  0.27916
Neg Pred Value        0.75516  0.75712  0.75382  0.75513
Prevalence            0.25067  0.24521  0.24926  0.25486
Detection Rate        0.06424  0.05752  0.06287  0.08132
Detection Prevalence  0.23855  0.22725  0.24289  0.29131
Balanced Accuracy     0.51182  0.50486  0.50622  0.51864
-----------------------------------------------------------

f2a.os :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2     3
         0 11416 10534 10223  9963
         1 10701 11178 10701 10150
         2 10356 10792 11184 10692
         3 12498 12763 13645 15733

Overall Statistics
                                          
               Accuracy : 0.2713          
                 95% CI : (0.2692, 0.2733)
    No Information Rate : 0.255           
    P-Value [Acc > NIR] : < 2.2e-16       
                                          
                  Kappa : 0.0279          
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.25385  0.24693  0.24444  0.33807
Specificity           0.77668  0.77013  0.76721  0.71391
Pos Pred Value        0.27093  0.26160  0.25995  0.28794
Neg Pred Value        0.76099  0.75616  0.75220  0.75913
Prevalence            0.24638  0.24800  0.25066  0.25496
Detection Rate        0.06254  0.06124  0.06127  0.08619
Detection Prevalence  0.23085  0.23410  0.23571  0.29934
Balanced Accuracy     0.51526  0.50853  0.50583  0.52599
-----------------------------------------------------------

f2a.vd :
Confusion Matrix and Statistics

          Reference
Prediction    0    1    2    3
         0 5754 5467 5254 5252
         1 5295 5269 5176 4997
         2 5138 5133 5215 5283
         3 6297 6189 6713 7531

Overall Statistics
                                          
               Accuracy : 0.2642          
                 95% CI : (0.2613, 0.2671)
    No Information Rate : 0.2564          
    P-Value [Acc > NIR] : 3.936e-08       
                                          
                  Kappa : 0.0184          
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.25592  0.23887  0.23325  0.32654
Specificity           0.76329  0.77221  0.76993  0.71302
Pos Pred Value        0.26483  0.25409  0.25110  0.28174
Neg Pred Value        0.75482  0.75748  0.75225  0.75437
Prevalence            0.24992  0.24519  0.24852  0.25636
Detection Rate        0.06396  0.05857  0.05797  0.08371
Detection Prevalence  0.24151  0.23051  0.23086  0.29712
Balanced Accuracy     0.50960  0.50554  0.50159  0.51978
-----------------------------------------------------------

f1d.os :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2     3
         0 13504 12341 11650 11518
         1 11304 11726 10961 10052
         2  9609 10410 10703 10267
         3 11429 11162 11581 13018

Overall Statistics
                                          
               Accuracy : 0.2701          
                 95% CI : (0.2681, 0.2721)
    No Information Rate : 0.253           
    P-Value [Acc > NIR] : < 2.2e-16       
                                          
                  Kappa : 0.0267          
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.29455   0.2569  0.23840  0.29022
Specificity           0.73773   0.7617  0.77786  0.74944
Pos Pred Value        0.27552   0.2662  0.26112  0.27586
Neg Pred Value        0.75540   0.7528  0.75620  0.76249
Prevalence            0.25296   0.2518  0.24772  0.24750
Detection Rate        0.07451   0.0647  0.05906  0.07183
Detection Prevalence  0.27044   0.2430  0.22616  0.26038
Balanced Accuracy     0.51614   0.5093  0.50813  0.51983
-----------------------------------------------------------

f1d.vd :
Confusion Matrix and Statistics

          Reference
Prediction    0    1    2    3
         0 6301 5976 5703 5776
         1 5733 5870 5436 5196
         2 4982 5236 5477 5363
         3 5386 5511 5731 6286

Overall Statistics
                                          
               Accuracy : 0.266           
                 95% CI : (0.2632, 0.2689)
    No Information Rate : 0.2514          
    P-Value [Acc > NIR] : < 2.2e-16       
                                          
                  Kappa : 0.0214          
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.28127  0.25981  0.24509  0.27788
Specificity           0.74164  0.75709  0.76957  0.75308
Pos Pred Value        0.26524  0.26400  0.26009  0.27433
Neg Pred Value        0.75681  0.75309  0.75517  0.75637
Prevalence            0.24901  0.25114  0.24840  0.25145
Detection Rate        0.07004  0.06525  0.06088  0.06987
Detection Prevalence  0.26406  0.24716  0.23407  0.25470
Balanced Accuracy     0.51146  0.50845  0.50733  0.51548
-----------------------------------------------------------

f2d.os :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2     3
         0 13892 12727 11871 11753
         1 11202 11598 11308 10471
         2  9928 10385 10969 10253
         3 11210 10923 11284 12755

Overall Statistics
                                          
               Accuracy : 0.2696          
                 95% CI : (0.2676, 0.2717)
    No Information Rate : 0.2533          
    P-Value [Acc > NIR] : < 2.2e-16       
                                          
                  Kappa : 0.026           
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.30048  0.25416  0.24144  0.28199
Specificity           0.73330  0.75908  0.77705  0.75661
Pos Pred Value        0.27650  0.26017  0.26409  0.27625
Neg Pred Value        0.75553  0.75328  0.75557  0.76182
Prevalence            0.25329  0.25000  0.24890  0.24781
Detection Rate        0.07611  0.06354  0.06009  0.06988
Detection Prevalence  0.27526  0.24423  0.22755  0.25296
Balanced Accuracy     0.51689  0.50662  0.50924  0.51930
-----------------------------------------------------------

f2d.vd :
Confusion Matrix and Statistics

          Reference
Prediction    0    1    2    3
         0 6521 6166 5834 5807
         1 5408 5647 5581 5496
         2 4928 5179 5374 5201
         3 5548 5536 5612 6125

Overall Statistics
                                         
               Accuracy : 0.2631         
                 95% CI : (0.2602, 0.266)
    No Information Rate : 0.2515         
    P-Value [Acc > NIR] : 1.068e-15      
                                         
                  Kappa : 0.0174         
 Mcnemar's Test P-Value : < 2.2e-16      

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.29105  0.25067  0.23990  0.27067
Specificity           0.73642  0.75554  0.77342  0.75204
Pos Pred Value        0.26805  0.25515  0.25984  0.26839
Neg Pred Value        0.75799  0.75113  0.75423  0.75419
Prevalence            0.24905  0.25041  0.24900  0.25154
Detection Rate        0.07249  0.06277  0.05974  0.06808
Detection Prevalence  0.27042  0.24601  0.22989  0.25367
Balanced Accuracy     0.51374  0.50310  0.50666  0.51136
-----------------------------------------------------------
```

The script completed at 2017-01-20_18-49.
