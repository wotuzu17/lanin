# Lanin Training Report
## Training (Startup) Parameters
The training process was started at 2017-01-20_21-01.

The startup Parameters are:

```r
opt
```

```
$xversion
[1] 8

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
Input Variables: Input features: ADX, SMA50, SMA9, putcallratio, smoothputcallratio,
iv30call, iv30put, putcallIVratio30, vola2meanvola.
Output: from 10 to 20 periods in future

Example of raw data set:

```r
head(set1.RAW[[1]][complete.cases(set1.RAW[[1]])])
```

```
                 pcr iv30mean     pcr_5     pcIVr30    v2mIV30      ADX
2011-06-14 2.1555519   0.2852 1.0120063 0.026477293 0.02123393 18.26131
2011-06-15 1.7495219   0.3070 1.2284987 0.009610686 0.09753918 18.40959
2011-06-16 0.3606511   0.3244 0.7554847 0.007861878 0.15420195 18.91065
2011-06-17 0.5143998   0.3092 0.7112670 0.019728331 0.09585804 18.53816
2011-06-20 0.3649577   0.3106 0.4800268 0.001126670 0.09605477 18.19228
2011-06-21 2.1850968   0.2933 0.7459637 0.019093079 0.03268588 16.91554
                 dADX      DInorm     C2SMA50  dSMA50        C2SMA9
2011-06-14 -0.3042618 -0.14305909 -0.04970262 -0.0140 -0.0001972678
2011-06-15  0.1482766 -0.20337184 -0.07040326 -0.0260 -0.0151538036
2011-06-16  0.5010596 -0.25424422 -0.06547178 -0.0236 -0.0080260848
2011-06-17 -0.3724888 -0.13695805 -0.05889537 -0.0186 -0.0018460310
2011-06-20 -0.3458824 -0.13695805 -0.04422685 -0.0134  0.0114212573
2011-06-21 -1.2767361  0.00317972 -0.03091466 -0.0118  0.0219790907
                  dSMA9 adv_10_20 dec_10_20
2011-06-14 -0.075555556  3.216945 11.118972
2011-06-15 -0.130000000  4.547280 10.236767
2011-06-16 -0.076666667  5.528583  9.850531
2011-06-17 -0.016666667  5.986399  9.711270
2011-06-20  0.001111111  4.862794 10.891778
2011-06-21  0.035555556  4.119262 11.794097
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
 2.603633  6.664296 12.361669 
```

```r
set2.adv.boundaries
```

```
      25%       50%       75% 
 2.368625  6.260554 11.996860 
```

```r
vd.adv.boundaries 
```

```
      25%       50%       75% 
 2.531805  6.395427 12.130455 
```

```r
set1.dec.boundaries
```

```
     25%      50%      75% 
1.062696 4.135415 8.627499 
```

```r
set2.dec.boundaries
```

```
     25%      50%      75% 
1.124345 4.224446 8.773160 
```

```r
vd.dec.boundaries 
```

```
     25%      50%      75% 
1.203924 4.369595 8.718396 
```

### Schema of Training Data Set
Example:

```r
head(trainDF1a.t)
```

```
        pcr iv30mean     pcr_5     pcIVr30    v2mIV30      ADX       dADX
1 2.1555519   0.2852 1.0120063 0.026477293 0.02123393 18.26131 -0.3042618
2 1.7495219   0.3070 1.2284987 0.009610686 0.09753918 18.40959  0.1482766
3 0.3606511   0.3244 0.7554847 0.007861878 0.15420195 18.91065  0.5010596
4 0.5143998   0.3092 0.7112670 0.019728331 0.09585804 18.53816 -0.3724888
5 0.3649577   0.3106 0.4800268 0.001126670 0.09605477 18.19228 -0.3458824
6 2.1850968   0.2933 0.7459637 0.019093079 0.03268588 16.91554 -1.2767361
       DInorm     C2SMA50  dSMA50        C2SMA9        dSMA9 y
1 -0.14305909 -0.04970262 -0.0140 -0.0001972678 -0.075555556 1
2 -0.20337184 -0.07040326 -0.0260 -0.0151538036 -0.130000000 1
3 -0.25424422 -0.06547178 -0.0236 -0.0080260848 -0.076666667 1
4 -0.13695805 -0.05889537 -0.0186 -0.0018460310 -0.016666667 1
5 -0.13695805 -0.04422685 -0.0134  0.0114212573  0.001111111 1
6  0.00317972 -0.03091466 -0.0118  0.0219790907  0.035555556 1
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
## Time difference of 26.02295 mins
```

```r
time.2a
```

```
## Time difference of 23.74574 mins
```

```r
time.1d
```

```
## Time difference of 24.62274 mins
```

```r
time.2d
```

```
## Time difference of 25.20326 mins
```


```
f1a :
Random Forest 

38984 samples
   12 predictors
    4 classes: '0', '1', '2', '3' 

No pre-processing
Resampling: Cross-Validated (10 fold) 
Summary of sample sizes: 35085, 35086, 35085, 35085, 35085, 35086, ... 
Resampling results across tuning parameters:

  mtry  Accuracy   Kappa    
   2    0.4314847  0.2416750
   7    0.4413091  0.2547911
  12    0.4379232  0.2502982

Accuracy was used to select the optimal model using  the largest value.
The final value used for the model was mtry = 7. 
-----------------------------------------------------------

f2a :
Random Forest 

38709 samples
   12 predictors
    4 classes: '0', '1', '2', '3' 

No pre-processing
Resampling: Cross-Validated (10 fold) 
Summary of sample sizes: 34837, 34838, 34839, 34838, 34839, 34838, ... 
Resampling results across tuning parameters:

  mtry  Accuracy   Kappa    
   2    0.4293571  0.2387472
   7    0.4510834  0.2678040
  12    0.4514449  0.2682937

Accuracy was used to select the optimal model using  the largest value.
The final value used for the model was mtry = 12. 
-----------------------------------------------------------

f1d :
Random Forest 

38984 samples
   12 predictors
    4 classes: '0', '1', '2', '3' 

No pre-processing
Resampling: Cross-Validated (10 fold) 
Summary of sample sizes: 35085, 35084, 35086, 35085, 35087, 35086, ... 
Resampling results across tuning parameters:

  mtry  Accuracy   Kappa    
   2    0.4040632  0.2052935
   7    0.4123484  0.2164057
  12    0.4108602  0.2144502

Accuracy was used to select the optimal model using  the largest value.
The final value used for the model was mtry = 7. 
-----------------------------------------------------------

f2d :
Random Forest 

38708 samples
   12 predictors
    4 classes: '0', '1', '2', '3' 

No pre-processing
Resampling: Cross-Validated (10 fold) 
Summary of sample sizes: 34836, 34837, 34838, 34838, 34837, 34838, ... 
Resampling results across tuning parameters:

  mtry  Accuracy   Kappa    
   2    0.4088039  0.2113555
   7    0.4127825  0.2167326
  12    0.4148751  0.2195265

Accuracy was used to select the optimal model using  the largest value.
The final value used for the model was mtry = 12. 
-----------------------------------------------------------
```

### Confusion Matrices

```
f1a.os :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2     3
         0 11876  9407  7858  7607
         1  9190  9997  7887  6274
         2  8355  9228  8829  8505
         3 10594 11327 12541 15350

Overall Statistics
                                          
               Accuracy : 0.2974          
                 95% CI : (0.2952, 0.2997)
    No Information Rate : 0.2585          
    P-Value [Acc > NIR] : < 2.2e-16       
                                          
                  Kappa : 0.064           
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.29679  0.25018  0.23788  0.40677
Specificity           0.78336  0.79671  0.77837  0.70568
Pos Pred Value        0.32317  0.29978  0.25286  0.30816
Neg Pred Value        0.76169  0.75335  0.76410  0.78683
Prevalence            0.25845  0.25809  0.23972  0.24373
Detection Rate        0.07671  0.06457  0.05703  0.09914
Detection Prevalence  0.23735  0.21539  0.22553  0.32173
Balanced Accuracy     0.54008  0.52345  0.50813  0.55623
-----------------------------------------------------------

f1a.vd :
Confusion Matrix and Statistics

          Reference
Prediction    0    1    2    3
         0 5583 5122 4219 3913
         1 4787 5184 3992 3359
         2 4036 4191 4473 4483
         3 4722 5422 6139 7228

Overall Statistics
                                          
               Accuracy : 0.2924          
                 95% CI : (0.2891, 0.2956)
    No Information Rate : 0.2592          
    P-Value [Acc > NIR] : < 2.2e-16       
                                          
                  Kappa : 0.0568          
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.29188  0.26025   0.2376  0.38076
Specificity           0.77039  0.78681   0.7810  0.71863
Pos Pred Value        0.29638  0.29927   0.2603  0.30743
Neg Pred Value        0.76653  0.75248   0.7595  0.77963
Prevalence            0.24889  0.25918   0.2449  0.24700
Detection Rate        0.07265  0.06745   0.0582  0.09405
Detection Prevalence  0.24510  0.22539   0.2236  0.30592
Balanced Accuracy     0.53113  0.52353   0.5093  0.54969
-----------------------------------------------------------

f2a.os :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2     3
         0 10054  8882  8328  7676
         1  8527 10058  9853  8041
         2  8293  9347 10952 11010
         3  8922  9383 11726 14878

Overall Statistics
                                          
               Accuracy : 0.2946          
                 95% CI : (0.2924, 0.2969)
    No Information Rate : 0.2668          
    P-Value [Acc > NIR] : < 2.2e-16       
                                          
                  Kappa : 0.0578          
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.28087   0.2670  0.26804  0.35760
Specificity           0.79285   0.7766  0.75102  0.73732
Pos Pred Value        0.28775   0.2757  0.27655  0.33129
Neg Pred Value        0.78724   0.7688  0.74291  0.75926
Prevalence            0.22956   0.2416  0.26203  0.26682
Detection Rate        0.06448   0.0645  0.07024  0.09541
Detection Prevalence  0.22407   0.2339  0.25397  0.28801
Balanced Accuracy     0.53686   0.5218  0.50953  0.54746
-----------------------------------------------------------

f2a.vd :
Confusion Matrix and Statistics

          Reference
Prediction    0    1    2    3
         0 5276 4974 4235 4106
         1 4582 5349 4847 3877
         2 3942 4594 5092 4882
         3 4077 4578 5457 6985

Overall Statistics
                                          
               Accuracy : 0.2954          
                 95% CI : (0.2922, 0.2986)
    No Information Rate : 0.2583          
    P-Value [Acc > NIR] : < 2.2e-16       
                                          
                  Kappa : 0.0602          
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.29513   0.2744  0.25939  0.35189
Specificity           0.77423   0.7680  0.76551  0.75243
Pos Pred Value        0.28379   0.2867  0.27509  0.33109
Neg Pred Value        0.78372   0.7569  0.75080  0.76926
Prevalence            0.23261   0.2537  0.25544  0.25829
Detection Rate        0.06865   0.0696  0.06626  0.09089
Detection Prevalence  0.24190   0.2427  0.24085  0.27451
Balanced Accuracy     0.53468   0.5212  0.51245  0.55216
-----------------------------------------------------------

f1d.os :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2     3
         0 13050 11221 10374  9797
         1  8827 10405  9040  7536
         2  7626  8675  9424  7642
         3  9242  8868  9898 13200

Overall Statistics
                                          
               Accuracy : 0.2976          
                 95% CI : (0.2953, 0.2999)
    No Information Rate : 0.253           
    P-Value [Acc > NIR] : < 2.2e-16       
                                          
                  Kappa : 0.0636          
 Mcnemar's Test P-Value : < 2.2e-16       

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.33682   0.2656  0.24329  0.34578
Specificity           0.72957   0.7804  0.79375  0.75990
Pos Pred Value        0.29364   0.2906  0.28243  0.32033
Neg Pred Value        0.76722   0.7583  0.75867  0.78018
Prevalence            0.25025   0.2530  0.25019  0.24657
Detection Rate        0.08429   0.0672  0.06087  0.08526
Detection Prevalence  0.28705   0.2313  0.21551  0.26616
Balanced Accuracy     0.53319   0.5230  0.51852  0.55284
-----------------------------------------------------------

f1d.vd :
Confusion Matrix and Statistics

          Reference
Prediction    0    1    2    3
         0 6063 5405 5313 4887
         1 4435 4919 4604 3693
         2 3872 4549 5123 3795
         3 4384 4308 5071 6432

Overall Statistics
                                        
               Accuracy : 0.2932        
                 95% CI : (0.29, 0.2965)
    No Information Rate : 0.2617        
    P-Value [Acc > NIR] : < 2.2e-16     
                                        
                  Kappa : 0.0583        
 Mcnemar's Test P-Value : < 2.2e-16     

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.32329  0.25645  0.25474  0.34200
Specificity           0.73141  0.77923  0.78471  0.76289
Pos Pred Value        0.27981  0.27868  0.29546  0.31849
Neg Pred Value        0.77003  0.75910  0.74816  0.78158
Prevalence            0.24402  0.24958  0.26168  0.24471
Detection Rate        0.07889  0.06401  0.06666  0.08369
Detection Prevalence  0.28194  0.22967  0.22561  0.26277
Balanced Accuracy     0.52735  0.51784  0.51972  0.55245
-----------------------------------------------------------

f2d.os :
Confusion Matrix and Statistics

          Reference
Prediction     0     1     2     3
         0 13692 11293 10501  9695
         1 10721 11799 10213  8108
         2  7834  8579  9174  7726
         3  8496  7920  8953 11226

Overall Statistics
                                         
               Accuracy : 0.2943         
                 95% CI : (0.292, 0.2966)
    No Information Rate : 0.2613         
    P-Value [Acc > NIR] : < 2.2e-16      
                                         
                  Kappa : 0.0581         
 Mcnemar's Test P-Value : < 2.2e-16      

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.33606  0.29802  0.23619  0.30543
Specificity           0.72663  0.75037  0.79384  0.78713
Pos Pred Value        0.30305  0.28890  0.27539  0.30676
Neg Pred Value        0.75574  0.75852  0.75805  0.78607
Prevalence            0.26129  0.25390  0.24909  0.23571
Detection Rate        0.08781  0.07567  0.05883  0.07199
Detection Prevalence  0.28975  0.26192  0.21364  0.23469
Balanced Accuracy     0.53134  0.52419  0.51502  0.54628
-----------------------------------------------------------

f2d.vd :
Confusion Matrix and Statistics

          Reference
Prediction    0    1    2    3
         0 6083 5440 5187 4633
         1 4984 5477 5576 4225
         2 3988 4421 4661 3748
         3 4116 3898 4673 5743

Overall Statistics
                                         
               Accuracy : 0.2858         
                 95% CI : (0.2826, 0.289)
    No Information Rate : 0.2615         
    P-Value [Acc > NIR] : < 2.2e-16      
                                         
                  Kappa : 0.048          
 Mcnemar's Test P-Value : < 2.2e-16      

Statistics by Class:

                     Class: 0 Class: 1 Class: 2 Class: 3
Sensitivity           0.31730  0.28473  0.23193  0.31299
Specificity           0.73545  0.74339  0.78580  0.78314
Pos Pred Value        0.28501  0.27031  0.27714  0.31161
Neg Pred Value        0.76422  0.75687  0.74288  0.78423
Prevalence            0.24945  0.25030  0.26150  0.23875
Detection Rate        0.07915  0.07127  0.06065  0.07473
Detection Prevalence  0.27771  0.26365  0.21883  0.23981
Balanced Accuracy     0.52637  0.51406  0.50886  0.54807
-----------------------------------------------------------
```

The script completed at 2017-01-20_21-26.
