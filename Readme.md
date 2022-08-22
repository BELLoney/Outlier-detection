# Outlier-detection
Data set; Program files

Remark: Relevant algorithm code will be uploaded one after another, welcome to download, discuss and exchange!

In order to evaluate the effectiveness of an outlier detection algorithm, 16 data sets (including numeric, categorical, and mixed attributes) are selected from the UCI machine learning repository for experiments.

Most of these data sets are used for the evaluation of classification and clustering methods. By contrast, for the evaluation of outlier detection, there are very few existing data sets. Accordingly, this paper uses the downsampling method proposed in the document [1] to obtain some data sets for evaluating outlier detection. The method randomly downsamples a particular class to produce outliers while preserving all objects of the remaining classes to form an outlier detection data set. In addition, for the missing values of data set, this paper uses the maximum probability value method to complete the missing value, that is, the value of attribute with the highest frequency on other objects is used to fill the missing attribute value [4,5].

The details of data preprocessing and description are shown as fllows.

                                         Tabel 1 Some nominal datasets
| No |  Raw Datasets |New Datasets | Abbreviation | Preprocessing | numerical | categorical | Oulier | Normal | 
| -------- |--------|-------- |-------- |-------- |-------- | -------- | --------| -------- |
|  1| Lymphography|Lymphography| Lymp | Classes ''1'' and ''4'' are considered as outliers [2] | 0 | 8 | 6 | 142 |  
|  2| Mushroom|Mushroom_p_221variant1|Mush| Downsampling the class ''+" down to 221 objects | 0|22|221|4208| 
|  3| Diabetes|Diabetes_tested_positive_26variant1|Diab| Downsampling the class ''tested\_positive" down to 26 objects |8|0|26|500|
                                          Tabel 2 Some numerical datasets
|  4| Ionosphere|Ionosphere_b_24variant1|Iono| Downsampling the class ''b" down to 24 objects |34|0|24|225|
|  5| Iris|Iris_Irisvirginica_11_variant1|Iris| Downsampling the class ''Iris-virginica" down to 11 objects |4|0|11|100| 
|  6| Pima|Pima_TRUE_55variant1|Pima| Downsampling the class ''TURE" down to 55 objects |9|0|55|500| 
|  7| Sonar|Sonar_M_10variant1|Sonar| Downsampling the class ''M" down to 10 objects|60|0|10|97|  
|  8| Wisconsin diagnostic breast cancer|Wdbc_M_39variant1|Wdbc| Downsampling the class ``M" down to 39 objects | 31|0|39|357|
|  9| Page blocks|Pageblocks_258variant1|Page| Downsampling the class ''Non-text" down to 258 objects |10|0|258|4913|
| 10| Wisconsin breast cancer|Wisconsin_malignant_39variant1|Wbc|202 ''malignant" (outlier) and 14 ``benign" objects were removed [2] | 9|0|39|444|
| 11| Yeast|Yeast_ERL_5_variant1|Yeast|Classes ''ERL" (outlier), ''CYT", ''NUC", and ''MIT" are selected [3]|8|0|5|1136|
                                           Tabel 3 Some mixed datasets
| 12| Credit approval|CreditA_plus_42variant1|Cred| Downsampling the class ``+" down to 42 objects|6|9|42|383|
| 13| German|German_1_14variant1|Germ| Downsampling the class ``2" down to 14 objects|7|13|14|700|
| 14| Heart disease |Heart_2_16variant1|Heart| Downsampling the class ``2" down to 16 objects| 6|7|16|150|
| 15| Hepatitis |Hepatitis_2_9variant1|Hepa| Downsampling the class ``2" down to 9 objects |6|13|9|85|
| 16| Horse |Horse_1_12variant1|Horse| Downsampling the class ``1" down to 12 objects|8|19|12|244|


[1] G. O. Campos, A. Zimek, J. Sander, R. J. Campello, B. Micenkov´a, E. Schubert, I. Assent, and M. E. Houle, “On the evaluation of unsupervised outlier detection: measures, datasets, and an empirical study,” Data Mining and Knowledge Discovery, vol. 30, no. 4, pp. 891–927, 2016.

[2] Z. Y. He, X. F. Xu, and S. C. Deng, “Discovering cluster-based local outliers,” Pattern Recognition Letters, vol. 24, no. 9–10, pp. 1641–1650, 2003.

[3] F. Jiang and Y. M. Chen, “Outlier detection based on granular computing and rough set theory,” Applied Intelligence, vol. 42, no. 2, pp. 303–322, 2015.

[4] Z. Yuan and H.M Chen, et al. "Fuzzy information entropy-based adaptive approach for hybrid feature outlier detection." Fuzzy Sets and Systems (2020). DOI:https://doi.org/10.1016/j.fss.2020.10.017.

[5] Z. Yuan, X.Y. Zhang, and S. Feng. "Hybrid data-driven outlier detection based on neighborhood information entropy and its developmental measures." Expert Systems with Applications 112 (2018): 243-257.

About more datasets

[1] http://odds.cs.stonybrook.edu/
