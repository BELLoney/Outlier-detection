# Outlier-detection
Data set; Program files

Remark: Relevant algorithm code will be uploaded one after another, welcome to download, discuss and exchange!

In order to evaluate the effectiveness of an outlier detection algorithm, 16 data sets (including numeric, categorical, and mixed attributes) are selected from the UCI machine learning repository for experiments.

Most of these data sets are used for the evaluation of classification and clustering methods. By contrast, for the evaluation of outlier detection, there are very few existing data sets. Accordingly, this paper uses the downsampling method proposed in the document [1] to obtain some data sets for evaluating outlier detection. The method randomly downsamples a particular class to produce outliers while preserving all objects of the remaining classes to form an outlier detection data set. In addition, for the missing values of data set, this paper uses the maximum probability value method to complete the missing value, that is, the value of attribute with the highest frequency on other objects is used to fill the missing attribute value [4,5].

The details of data preprocessing and description are shown as Tables 1-3.

                                                   Table 1 Some nominal datasets
| No |  Raw Datasets |New Datasets | Preprocessing | numerical | categorical | Objects | Outliers | 
| -------- |--------|-------- |-------- |-------- | -------- | --------| -------- |
|  1| Lymphography|Lymphography| Classes ''1'' and ''4'' are considered as outliers [2] | 0 | 8 | 148 | 6 |  
|  2| Mushroom|Mushroom_p_221variant1|Downsampling the class ''+" down to 221 objects | 0|22|4429|221| 
|  3| Diabetes|Diabetes_tested_positive_26variant1|Diab| Downsampling the class ''tested\_positive" down to 26 objects |8|0|526|26|
                                                   Table 2 Some numerical datasets
| No |  Raw Datasets |New Datasets | Preprocessing | numerical | categorical | Objects | Ouliers | 
| -------- |--------|-------- |-------- |-------- | -------- | --------| -------- |
|  1| Ionosphere|Ionosphere_b_24variant1| Downsampling the class ''b" down to 24 objects |34|0|249|24|
|  2| Iris|Iris_Irisvirginica_11_variant1| Downsampling the class ''Iris-virginica" down to 11 objects |4|0|111|11| 
|  3| Pima|Pima_TRUE_55variant1| Downsampling the class ''TURE" down to 55 objects |9|0|555|55| 
|  4| Sonar|Sonar_M_10variant1| Downsampling the class ''M" down to 10 objects|60|0|107|10|  
|  5| Wisconsin diagnostic breast cancer|Wdbc_M_39variant1| Downsampling the class ``M" down to 39 objects | 31|0|396|39|
|  6| Page blocks|Pageblocks_258variant1| Downsampling the class ''Non-text" down to 258 objects |10|0|5171|258|
| 7| Wisconsin breast cancer|Wisconsin_malignant_39variant1|202 ''malignant" (outlier) and 14 ``benign" objects were removed [2] | 9|0|483|39|
| 8| Yeast|Yeast_ERL_5_variant1|Classes ''ERL" (outlier), ''CYT", ''NUC", and ''MIT" are selected [3]|8|0|1141|5|
                                                    Table 3 Some mixed datasets
| No |  Raw Datasets |New Datasets |  Preprocessing | numerical | categorical |Objects | Ouliers | 
| -------- |--------|-------- |-------- |-------- | -------- | --------| -------- |
| 1| Credit approval|CreditA_plus_42variant1|Downsampling the class ``+" down to 42 objects|6|9|425|42|
| 2| German|German_1_14variant1|Downsampling the class ``2" down to 14 objects|7|13|714|14|
| 3| Heart disease |Heart_2_16variant1|Downsampling the class ``2" down to 16 objects| 6|7|166|16|
| 4| Hepatitis |Hepatitis_2_9variant1|Downsampling the class ``2" down to 9 objects |6|13|94|9|
| 5| Horse |Horse_1_12variant1|Downsampling the class ``1" down to 12 objects|8|19|256|12|
| 6| Arrhythmia |Arrhythmia_v1|Classes 3, 4, 5, 7, 8, 9, 14, 15 are combined to form the outliers class and the rest of the classes are combined to form the inliers class|206|73|452|66|


[1] G. O. Campos, A. Zimek, J. Sander, R. J. Campello, B. Micenkov´a, E. Schubert, I. Assent, and M. E. Houle, “On the evaluation of unsupervised outlier detection: measures, datasets, and an empirical study,” Data Mining and Knowledge Discovery, vol. 30, no. 4, pp. 891–927, 2016.

[2] Z. Y. He, X. F. Xu, and S. C. Deng, “Discovering cluster-based local outliers,” Pattern Recognition Letters, vol. 24, no. 9–10, pp. 1641–1650, 2003.

[3] F. Jiang and Y. M. Chen, “Outlier detection based on granular computing and rough set theory,” Applied Intelligence, vol. 42, no. 2, pp. 303–322, 2015.

[4] Z. Yuan and H.M Chen, et al. "Fuzzy information entropy-based adaptive approach for hybrid feature outlier detection." Fuzzy Sets and Systems (2020). DOI:https://doi.org/10.1016/j.fss.2020.10.017.

[5] Z. Yuan, X.Y. Zhang, and S. Feng. "Hybrid data-driven outlier detection based on neighborhood information entropy and its developmental measures." Expert Systems with Applications 112 (2018): 243-257.

About more datasets

[1] http://odds.cs.stonybrook.edu/
