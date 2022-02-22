# KWUFeatureExtraction
In main_preproc, RR interval was extracted using the ECG signals of CHF, AF, Healthy data, and outliers were removed.
This includes features extracting through complexity quantification based on various entropy such as Multiscale Dispersion Entropy(MDE), Multiscale Cumulative Residual Dispersio Entropy(MCRDE), and Multiscale Sample Entropy(MSE) with preprocessed RRI as input


> ## **main_feature_extraction.m** ##
+ **MDE.m**
  - DisEn_NCDF.m 
  - DisEn_NCDF_ms.m

+ **MCRDE.m**
  - DisEn_NCDF.m 
  - DisEn_NCDF_ms.m
  - CumulativeFunc.m

+ **MSE_mu.m**

+ **pe.m**
  - multiScale.m 

