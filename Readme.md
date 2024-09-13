# Outlier-detection
Data set; Program files

Remark: Relevant algorithm code will be uploaded one after another, welcome to download, discuss and exchange!

In order to evaluate the effectiveness of an outlier detection algorithm, some data sets (including numeric, categorical, and mixed attributes) are selected from the UCI machine learning repository for experiments.

Most of these data sets are used for the evaluation of classification and clustering methods. By contrast, for the evaluation of outlier detection, there are very few existing data sets. Accordingly, this paper uses the downsampling method proposed in the document [1] to obtain some data sets for evaluating outlier detection. The method randomly downsamples a particular class to produce outliers while preserving all objects of the remaining classes to form an outlier detection data set. In addition, for the missing values of data set, this paper uses the maximum probability value method to complete the missing value, that is, the value of attribute with the highest frequency on other objects is used to fill the missing attribute value [4,5].

**The last column of the data matrix is the true label, where 1 denotes outliers and 0 denotes inliers.**

The details of data preprocessing and description are shown as Tables 1-3.

                                                   Table 1 Some nominal datasets
| No |  Raw Datasets |New Datasets | Preprocessing | Numerical | Categorical | Objects | Outliers | 
| -------- |--------|-------- |-------- |-------- | -------- | --------| -------- |
|  1| Audiology|Audiology_variant1|Classes "cochlear_age", "cochlear_age_and_noise", "cochlear_poss_noise","cochlear_unknown", and "normal_ear" are combined to form the inliers class and the rest of the classes are combined to form the outliers class| 0 | 69 | 226 | 53 | 
|  2| Breast cancer |Balance scale_variant1|Class "recurrence-events" is regarded as the outliers class| 0 | 9 | 286 | 85 | 
|  3| Chess |Chess_nowin_16_variant1|Downsampling the class "nowin" down to 16 objects| 0 | 36 | 1685 | 16 | 
|  4| Chess |Chess_nowin_34_variant1|Downsampling the class "nowin" down to 34 objects| 0 | 36 | 1703 | 34 |
|  5| Chess |Chess_nowin_87_variant1|Downsampling the class "nowin" down to 87 objects| 0 | 36 | 1756 | 87 |
|  6| Chess |Chess_nowin_145_variant1|Downsampling the class "nowin" down to 145 objects| 0 | 36 | 1814 | 145 |
|  7| Chess |Chess_nowin_185_variant1|Downsampling the class "nowin" down to 185 objects| 0 | 36 | 1854 | 185 |
|  8| Chess |Chess_nowin_227_variant1|Downsampling the class "nowin" down to 227 objects| 0 | 36 | 1896 | 227 |
|  9| Connect_4 |Connect_4_draw_617_variant1|Class "draw" is regarded as the outliers class and downsampled to 617 objects| 0 | 42 | 61725 | 617 | 
|  10| Connect_4 |Connect_4_draw_1247_variant1|Class "draw" is regarded as the outliers class and downsampled to 1247 objects| 0 | 42 | 62355 | 1247 | 
|  11| Lymphography|Lymphography| Classes ''1'' and ''4'' are considered as outliers [2] | 0 | 8 | 148 | 6 |
|  12| Monks |Monks_0_4_variant1|Downsampling the class "0" down to 4 objects| 0 | 6 | 232 | 4 |
|  13| Monks |Monks_0_12_variant1|Downsampling the class "0" down to 12 objects| 0 | 6 | 240 | 12 |
|  14| Monks |Monks_0_25_variant1|Downsampling the class "0" down to 25 objects| 0 | 6 | 253 | 25 |
|  15| Mushroom|Mushroom_p_85_variant1|Downsampling the class ''+" down to 85 objects | 0|22|4293|85|
|  16| Mushroom|Mushroom_p_221_variant1|Downsampling the class ''+" down to 221 objects | 0|22|4429|221|
|  17| Mushroom|Mushroom_p_365_variant1|Downsampling the class ''+" down to 365 objects | 0|22|4573|365|
|  18| Mushroom|Mushroom_p_467_variant1|Downsampling the class ''+" down to 467 objects | 0|22|4675|467|
|  19| Mushroom|Mushroom_p_573_variant1|Downsampling the class ''+" down to 573 objects | 0|22|4781|573|
|  20| Nursery|Nursery_variant1|Classes "recommend" and "very_recom" are combined to form the outliers class and the rest of the classes are combined to form the inliers class| 0 | 8 | 12960 | 330 | 
|  21| Tic-tac-toe|Tic-tac-toe_negative_12_variant1|Downsampling the class "negative" down to 12 objects | 0|9|638|12|
|  22| Tic-tac-toe|Tic-tac-toe_negative_26_variant1|Downsampling the class "negative" down to 26 objects | 0|9|652|26|
|  23| Tic-tac-toe|Tic-tac-toe_negative_32_variant1|Downsampling the class "negative" down to 32 objects | 0|9|658|32|
|  24| Tic-tac-toe|Tic-tac-toe_negative_54_variant1|Downsampling the class "negative" down to 54 objects | 0|9|680|54|
|  25| Tic-tac-toe|Tic-tac-toe_negative_69_variant1|Downsampling the class "negative" down to 69 objects | 0|9|695|69|
|  26| Vote|Vote_republican_29_variant1|Downsampling the class "republican" down to 29 objects | 0|16|296|29|
|  27| Zoo|Zoo_variant1|Classes "reptile", "amphibian" and "insect" are combined to form the outliers class and the rest of the classes are combined to form the inliers class| 0|16|101|17|
                                                   Table 2 Some numerical datasets
| No |  Raw Datasets |New Datasets | Preprocessing | Numerical | Categorical | Objects | Ouliers | 
| -------- |--------|-------- |-------- |-------- | -------- | --------| -------- |
|  1| ALOI|ALOI_variant1|The data is divided into 1508 outliers (3.04%) and 48492 inliers (96.98%)|27|0|50000|1508|
|  2| Cardiotocography|Cardiotocography_2and3_3_variant1|Downsampling the classes "2" and "3" down to 33 objects |21|0|1688|33|
|  3| Diabetes|Diabetes_tested_positive_26_variant1|Downsampling the class ''tested\_positive" down to 26 objects |8|0|526|26|
|  4| Ionosphere|Ionosphere_b_24_variant1| Downsampling the class ''b" down to 24 objects |34|0|249|24|
|  5| Iris|Iris_Irisvirginica_11_variant1| Downsampling the class ''Iris-virginica" down to 11 objects |4|0|111|11| 
|  6| Pima|Pima_TRUE_55_variant1| Downsampling the class ''TURE" down to 55 objects |9|0|555|55| 
|  7| Sonar|Sonar_M_10_variant1| Downsampling the class ''M" down to 10 objects|60|0|107|10|  
|  8| Wisconsin diagnostic breast cancer|Wdbc_M_39_variant1| Downsampling the class ``M" down to 39 objects | 31|0|396|39|
|  9| Page blocks|Pageblocks_258_variant1| Downsampling the class ''Non-text" down to 258 objects |10|0|5171|258|
| 10| Wisconsin breast cancer|Wisconsin_malignant_39_variant1|202 ''malignant" (outlier) and 14 ``benign" objects were removed [2] | 9|0|483|39|
| 11| Yeast|Yeast_ERL_5_variant1|Classes ''ERL" (outlier), ''CYT", ''NUC", and ''MIT" are selected [3]|8|0|1141|5|
| 12| Waveform|Waveform_0_100_variant1|Downsampling the class ''0" down to 100 objects|21|0|3443|100|
| 13| Spambase|Spambase_spam_56_variant1|Downsampling the class ''spam" down to 56 objects|58|0|2844|56|
| 14| Wisconsin prognostic breast cancer|Wpbc_variant1|Class ''R" (minority) is considered as outliers|33|0|198|47|
                                                    Table 3 Some mixed datasets
| No |  Raw Datasets |New Datasets |  Preprocessing | Numerical | Categorical |Objects | Ouliers | 
| -------- |--------|-------- |-------- |-------- | -------- | --------| -------- |
| 1| Abalone |Abalone_variant1|Classes "1-3", "20-27" and 29 are combined to form the outliers class and the rest of the classes are combined to form the inliers class|8|1|4177|79|
| 2| Adult |Adult_morethan50K_343_variant1|Downsampling the class ">50k" down to 343 objects|6|8|34357|343|
| 3| Adult |Adult_morethan50K_694_variant1|Downsampling the class ">50k" down to 694 objects|6|8|34708|694|
| 4| Adult |Adult_morethan50K_1790_variant1|Downsampling the class ">50k" down to 1790 objects|6|8|35804|1790|
| 5| Adult |Adult_morethan50K_2957_variant1|Downsampling the class ">50k" down to 2957 objects|6|8|36971|2957|
| 6| Adult |Adult_morethan50K_3779_variant1|Downsampling the class ">50k" down to 3779 objects|6|8|37793|3779|
| 7| Adult |Adult_morethan50K_4638_variant1|Downsampling the class ">50k" down to 4638 objects|6|8|38652|4638|
| 8| Autos |Autos_variant1|Classes "-2" and "-1" are combined to form the outliers class and the rest of the classes are combined to form the inliers class|15|10|205|25|Annealing
| 9| Annealing |Annealing_variant1|Classes "1" and "U" are combined to form the outliers class and the rest of the classes are combined to form the inliers class|10|28|798|42|
| 10| Arrhythmia |Arrhythmia_variant1|Classes 3, 4, 5, 7, 8, 9, 14, 15 are combined to form the outliers class and the rest of the classes are combined to form the inliers class|206|73|452|66|
| 11| Bands |Bands_band_6_variant1|Downsampling the class "band" down to 6 objects|20|19|318|6|
| 12| Bands |Bands_band_16_variant1|Downsampling the class "band" down to 16 objects|20|19|328|16|
| 13| Bands |Bands_band_27_variant1|Downsampling the class "band" down to 27 objects|20|19|339|27|
| 14| Bands |Bands_band_34_variant1|Downsampling the class "band" down to 34 objects|20|19|346|34|
| 15| Bands |Bands_band_42_variant1|Downsampling the class "band" down to 42 objects|20|19|354|42|
| 16| Credit approval|CreditA_plus_42_variant1|Downsampling the class ``+" down to 42 objects|6|9|425|42|
| 17| German|German_1_14_variant1|Downsampling the class ``1" down to 14 objects|7|13|714|14|
| 18| Heart disease |Heart_2_16_variant1|Downsampling the class ``2" down to 16 objects| 6|7|166|16|
| 19| Hepatitis |Hepatitis_2_9_variant1|Downsampling the class ``2" down to 9 objects |6|13|94|9|
| 20| Horse |Horse_1_12_variant1|Downsampling the class ``1" down to 12 objects|8|19|256|12|
| 21| Sick |Sick_sick_35_variant1|Downsampling the class "sick" down to 35 objects|7|22|3576|35|
| 22| Sick |Sick_sick_72_variant1|Downsampling the class "sick" down to 72 objects|7|22|3613|72|
| 23| Thyroid_disease |Thyroid_disease_variant1|Classes ``SVHD" and ``WEST" are combined to form the outliers class and the rest of the classes are combined to form the inliers class|7|21|9172|74|

[1] G. O. Campos, A. Zimek, J. Sander, R. J. Campello, B. Micenkov´a, E. Schubert, I. Assent, and M. E. Houle, “On the evaluation of unsupervised outlier detection: measures, datasets, and an empirical study,” Data Mining and Knowledge Discovery, vol. 30, no. 4, pp. 891–927, 2016.

[2] Z. Y. He, X. F. Xu, and S. C. Deng, “Discovering cluster-based local outliers,” Pattern Recognition Letters, vol. 24, no. 9–10, pp. 1641–1650, 2003.

[3] F. Jiang and Y. M. Chen, “Outlier detection based on granular computing and rough set theory,” Applied Intelligence, vol. 42, no. 2, pp. 303–322, 2015.

[4] Zhong Yuan, Hongmei Chen, Tianrui Li, Jia Liu, Shu Wang. Fuzzy information entropy based adaptive approach for hybrid feature outlier detection[J]. Fuzzy Sets and Systems, 2021, 421: 1-18.

[5] Zhong Yuan, Xianyong Zhang, Feng Shan. Hybrid data-driven outlier detection based on neighborhood information entropy and its developmental measures[J]. Expert Systems with Applications, 2018, 112: 243-257.

[6]	Zhong Yuan, Hongmei Chen, Tianrui Li, Binbin Sang, Shu Wang. Outlier detection based on fuzzy rough granules in mixed attribute data[J]. IEEE Transactions on Cybernetics, 2022, 52(8): 8399-8412.

[7]	Zhong Yuan, Hongmei Chen, Tianrui Li, Xianyong Zhang, Binbin Sang. Multigranulation relative entropy based mixed attribute outlier detection in neighborhood systems[J]. IEEE Transactions on Systems, Man and Cybernetics: Systems, 2022, 52(8): 5175-5187.
	
About more datasets, such as Outlier Detection DataSets (ODDS). 

[1] http://odds.cs.stonybrook.edu/
