# Outlier-detection
Data set; Program files

Remark: Relevant algorithm code will be uploaded one after another, welcome to download, discuss and exchange!

In order to evaluate the effectiveness of an outlier detection algorithm, 16 data sets (including numeric, categorical, and mixed attributes) are selected from the UCI machine learning repository for experiments.

Most of these data sets are used for the evaluation of classification and clustering methods. By contrast, for the evaluation of outlier detection, there are very few existing data sets. Accordingly, this paper uses the downsampling method proposed in the document [1] to obtain some data sets for evaluating outlier detection. The method randomly downsamples a particular class to produce outliers while preserving all objects of the remaining classes to form an outlier detection data set. In addition, for the missing values of data set, this paper uses the maximum probability value method to complete the missing value, that is, the value of attribute with the highest frequency on other objects is used to fill the missing attribute value [4,5].

The details of data preprocessing and description are shown as Tables 1-3.

                                                   Table 1 Some nominal datasets
| No |  Raw Datasets |New Datasets | Preprocessing | Numerical | Categorical | Objects | Outliers | 
| -------- |--------|-------- |-------- |-------- | -------- | --------| -------- |
|  1| Audiology|Audiology_variant1|Classes "cochlear_age", "cochlear_age_and_noise", "cochlear_poss_noise","cochlear_unknown", and "normal_ear" are combined to form the inliers class and the rest of the classes are combined to form the outliers class| 0 | 69 | 226 | 53 | 
|  2| Balance scale|Balance scale_variant1|Class "B" is regarded as the outliers class| 0 | 4 | 625 | 49 |
|  3| Breast cancer |Balance scale_variant1|Class "recurrence-events" is regarded as the outliers class| 0 | 9 | 286 | 85 | 
|  4| Car |Car_variant1|Classes "good" and "v-good"  are regarded as the outliers class| 0 | 6 | 1728 | 134 | 
|  5| Chess |Chess_nowin_16_variant1|Downsampling the class "nowin" down to 16 objects| 0 | 36 | 1685 | 16 | 
|  6| Chess |Chess_nowin_34_variant1|Downsampling the class "nowin" down to 34 objects| 0 | 36 | 1703 | 34 |
|  7| Chess |Chess_nowin_16_variant1|Downsampling the class "nowin" down to 87 objects| 0 | 36 | 1756 | 87 |
|  8| Chess |Chess_nowin_16_variant1|Downsampling the class "nowin" down to 145 objects| 0 | 36 | 1814 | 145 |
|  9| Chess |Chess_nowin_16_variant1|Downsampling the class "nowin" down to 185 objects| 0 | 36 | 1854 | 185 |
|  10| Connect-4 |Connect-4_variant1|Class "draw" is regarded as the outliers class| 0 | 42 | 67557 | 6449 | 
|  11| Lung cancer |Lung cancer_variant1|Class "1" is regarded as the outliers class| 0 | 57 | 32 | 9 | 

|  1| Lymphography|Lymphography| Classes ''1'' and ''4'' are considered as outliers [2] | 0 | 8 | 148 | 6 |  
|  2| Mushroom|Mushroom_p_221_variant1|Downsampling the class ''+" down to 221 objects | 0|22|4429|221|

|  4| Tic tac toe|Tic tac toe_negative_26_variant1|Downsampling the class "negative" down to 26 objects | 0|9|652|26|
|  4| Vote|Vote_republican_29_variant1|Downsampling the class "republican" down to 29 objects | 0|16|296|29|
|  3| Zoo|Zoo_variant1|Classes "reptile", "amphibian" and "insect" are combined to form the outliers class and the rest of the classes are combined to form the inliers class| 0|16|101|17|

                                                   Table 2 Some numerical datasets
| No |  Raw Datasets |New Datasets | Preprocessing | Numerical | Categorical | Objects | Ouliers | 
| -------- |--------|-------- |-------- |-------- | -------- | --------| -------- |
|  1| Diabetes|Diabetes_tested_positive_26_variant1|Downsampling the class ''tested\_positive" down to 26 objects |8|0|526|26|
|  2| Ionosphere|Ionosphere_b_24_variant1| Downsampling the class ''b" down to 24 objects |34|0|249|24|
|  3| Iris|Iris_Irisvirginica_11_variant1| Downsampling the class ''Iris-virginica" down to 11 objects |4|0|111|11| 
|  4| Pima|Pima_TRUE_55_variant1| Downsampling the class ''TURE" down to 55 objects |9|0|555|55| 
|  5| Sonar|Sonar_M_10_variant1| Downsampling the class ''M" down to 10 objects|60|0|107|10|  
|  6| Wisconsin diagnostic breast cancer|Wdbc_M_39_variant1| Downsampling the class ``M" down to 39 objects | 31|0|396|39|
|  7| Page blocks|Pageblocks_258_variant1| Downsampling the class ''Non-text" down to 258 objects |10|0|5171|258|
| 8| Wisconsin breast cancer|Wisconsin_malignant_39_variant1|202 ''malignant" (outlier) and 14 ``benign" objects were removed [2] | 9|0|483|39|
| 9| Yeast|Yeast_ERL_5_variant1|Classes ''ERL" (outlier), ''CYT", ''NUC", and ''MIT" are selected [3]|8|0|1141|5|
| 10| Waveform|Waveform_0_100_variant1|Downsampling the class ''0" down to 100 objects|21|0|3443|100|
| 11| Spambase|Spambase_spam_56_variant1|Downsampling the class ''spam" down to 56 objects|58|0|2788|56|
| 12| Wilt|Wilt_w_93_variant1|Downsampling the class ''w" down to 93 objects|5|0|4671|93|
| 13| Wisconsin prognostic breast cancer|Wpbc_variant1|Class ''R" (minority) is considered as outliers|33|0|198|47|
                                                    Table 3 Some mixed datasets
| No |  Raw Datasets |New Datasets |  Preprocessing | Numerical | Categorical |Objects | Ouliers | 
| -------- |--------|-------- |-------- |-------- | -------- | --------| -------- |
| 1| Credit approval|CreditA_plus_42_variant1|Downsampling the class ``+" down to 42 objects|6|9|425|42|
| 2| German|German_1_14_variant1|Downsampling the class ``2" down to 14 objects|7|13|714|14|
| 3| Heart disease |Heart_2_16_variant1|Downsampling the class ``2" down to 16 objects| 6|7|166|16|
| 4| Hepatitis |Hepatitis_2_9_variant1|Downsampling the class ``2" down to 9 objects |6|13|94|9|
| 5| Horse |Horse_1_12_variant1|Downsampling the class ``1" down to 12 objects|8|19|256|12|
| 6| Arrhythmia |Arrhythmia_variant1|Classes 3, 4, 5, 7, 8, 9, 14, 15 are combined to form the outliers class and the rest of the classes are combined to form the inliers class|206|73|452|66|
| 7| Sick |Sick_variant1|Class ``sick"  are regarded as outliers|7|22|3772|231|
| 8| Thyroid_disease |Thyroid_disease_variant1|Classes ``SVHD" and ``WEST" are combined to form the outliers class and the rest of the classes are combined to form the inliers class|7|21|9172|74|
| 9| Labor |Labor_variant1|Class ``bad" is regarded as the outliers class|8|8|57|20|
| 10| Bands |Bands_band_6_variant1|Downsampling the class "band" down to 6 objects|20|20|318|6|
| 11| Bands |Bands_band_16_variant1|Downsampling the class "band" down to 16 objects|20|20|328|16|
| 12| Bands |Bands_band_27_variant1|Downsampling the class "band" down to 27 objects|20|20|339|27|
| 13| Bands |Bands_band_34_variant1|Downsampling the class "band" down to 34 objects|20|20|346|34|
| 14| Bands |Bands_band_42_variant1|Downsampling the class "band" down to 42 objects|20|20|354|42|
| 15| Autos |Autos_variant1|Classes "-2" and "-1" are combined to form the outliers class and the rest of the classes are combined to form the inliers class|15|10|205|23|Annealing
| 16| Annealing |Annealing_variant1|Classes "1" and "U" are combined to form the outliers class and the rest of the classes are combined to form the inliers class|9|29|798|42|
| 17| Adult |Adult_morethan50K_343_variant1|Downsampling the class ">50k" down to 343 objects|6|8|34357|343|
| 18| Adult |Adult_morethan50K_694_variant1|Downsampling the class ">50k" down to 694 objects|6|8|34708|694|
| 19| Adult |Adult_morethan50K_1790_variant1|Downsampling the class ">50k" down to 1790 objects|6|8|35804|1790|
| 20| Adult |Adult_morethan50K_2957_variant1|Downsampling the class ">50k" down to 2957 objects|6|8|36971|2957|
| 21| Adult |Adult_morethan50K_3779_variant1|Downsampling the class ">50k" down to 3779 objects|6|8|37793|3779|
| 22| Adult |Adult_morethan50K_4638_variant1|Downsampling the class ">50k" down to 4638 objects|6|8|38652|4638|
| 23| Abalone |Abalone_variant1|Classes "1-3", "20-27" and 29 are combined to form the outliers class and the rest of the classes are combined to form the inliers class|8|1|4177|79|

[1] G. O. Campos, A. Zimek, J. Sander, R. J. Campello, B. Micenkov´a, E. Schubert, I. Assent, and M. E. Houle, “On the evaluation of unsupervised outlier detection: measures, datasets, and an empirical study,” Data Mining and Knowledge Discovery, vol. 30, no. 4, pp. 891–927, 2016.

[2] Z. Y. He, X. F. Xu, and S. C. Deng, “Discovering cluster-based local outliers,” Pattern Recognition Letters, vol. 24, no. 9–10, pp. 1641–1650, 2003.

[3] F. Jiang and Y. M. Chen, “Outlier detection based on granular computing and rough set theory,” Applied Intelligence, vol. 42, no. 2, pp. 303–322, 2015.

[4] Zhong Yuan, Hongmei Chen, Tianrui Li, Jia Liu, Shu Wang. Fuzzy information entropy based adaptive approach for hybrid feature outlier detection[J]. Fuzzy Sets and Systems, 2021, 421: 1-18.

[5] Zhong Yuan, Xianyong Zhang, Feng Shan. Hybrid data-driven outlier detection based on neighborhood information entropy and its developmental measures[J]. Expert Systems with Applications, 2018, 112: 243-257.

[6]	Zhong Yuan, Hongmei Chen, Tianrui Li, Binbin Sang, Shu Wang. Outlier detection based on fuzzy rough granules in mixed attribute data[J]. IEEE Transactions on Cybernetics, 2022, 52(8): 8399-8412.

[7]	Zhong Yuan, Hongmei Chen, Tianrui Li, Xianyong Zhang, Binbin Sang. Multigranulation relative entropy based mixed attribute outlier detection in neighborhood systems[J]. IEEE Transactions on Systems, Man and Cybernetics: Systems, 2022, 52(8): 5175-5187.
	
About more datasets

[1] http://odds.cs.stonybrook.edu/
