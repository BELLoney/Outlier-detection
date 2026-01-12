# Outlier detection datasets
Data set; Program files

# 1. Overview

In order to evaluate the effectiveness of an outlier detection algorithm, some data sets (including numeric, categorical, and mixed attributes) are selected from the UCI machine learning repository for experiments.

Most of these data sets are used for the evaluation of classification and clustering methods. By contrast, for the evaluation of outlier detection, there are very few existing data sets. Accordingly, this paper uses the downsampling method proposed in the document [1] to obtain some data sets for evaluating outlier detection. 

The method randomly downsamples a particular class to produce outliers while preserving all objects of the remaining classes to form an outlier detection data set. In addition, for the missing values of data set, this paper uses the maximum probability value method to complete the missing value, that is, the value of attribute with the highest frequency on other objects is used to fill the missing attribute value [4,5].

**The last column of the data matrix is the true label, where 1 denotes outliers and 0 denotes inliers.**

**-ori.csv represents the original dataset and the rest represent the results of minimum-maximum normalization.**

The details of data preprocessing and description are shown as follows.

# 2. Nominal datasets

## 2.1 Preprocessing details

| No. | Raw Datasets | Preprocessing |
|-----|--------------|---------------|
| 1 | Audiology | Classes "cochlear_age", "cochlear_age_and_noise", "cochlear_poss_noise","cochlear_unknown", and "normal_ear" are combined to form the inliers class and the rest of the classes are combined to form the outliers class |
| 2 | Breast cancer | Class "recurrence-events" is regarded as the outliers class |
| 3 | Chess | Downsampling the class "nowin" down to 16 objects |
| 4 | Chess | Downsampling the class "nowin" down to 34 objects |
| 5 | Chess | Downsampling the class "nowin" down to 87 objects |
| 6 | Chess | Downsampling the class "nowin" down to 145 objects |
| 7 | Chess | Downsampling the class "nowin" down to 185 objects |
| 8 | Chess | Downsampling the class "nowin" down to 227 objects |
| 9 | Connect_4 | Class "draw" is regarded as the outliers class and downsampled to 617 objects |
| 10 | Connect_4 | Class "draw" is regarded as the outliers class and downsampled to 1247 objects |
| 11 | Lymphography | Classes ''1'' and ''4'' are considered as outliers [2] |
| 12 | Monks | Downsampling the class "0" down to 4 objects |
| 13 | Monks | Downsampling the class "0" down to 12 objects |
| 14 | Monks | Downsampling the class "0" down to 25 objects |
| 15 | Mushroom | Downsampling the class ''+" down to 85 objects |
| 16 | Mushroom | Downsampling the class ''+" down to 221 objects |
| 17 | Mushroom | Downsampling the class ''+" down to 365 objects |
| 18 | Mushroom | Downsampling the class ''+" down to 467 objects |
| 19 | Mushroom | Downsampling the class ''+" down to 573 objects |
| 20 | Nursery | Classes "recommend" and "very_recom" are combined to form the outliers class and the rest of the classes are combined to form the inliers class |
| 21 | Tic-tac-toe | Downsampling the class "negative" down to 12 objects |
| 22 | Tic-tac-toe | Downsampling the class "negative" down to 26 objects |
| 23 | Tic-tac-toe | Downsampling the class "negative" down to 32 objects |
| 24 | Tic-tac-toe | Downsampling the class "negative" down to 54 objects |
| 25 | Tic-tac-toe | Downsampling the class "negative" down to 69 objects |
| 26 | Vote | Downsampling the class "republican" down to 29 objects |
| 27 | Zoo | Classes "reptile", "amphibian" and "insect" are combined to form the outliers class and the rest of the classes are combined to form the inliers class |

## 2.2 Dataset statistics

| No. | New Datasets | #Objects | #Nominal | #Outliers |
|-----|--------------|----------|----------|-----------|
| 1 | Audiology_variant1 | 226 | 69 | 53 |
| 2 | Breast cancer_variant1 | 286 | 9 | 85 |
| 3 | Chess_nowin_16_variant1 | 1685 | 36 | 16 |
| 4 | Chess_nowin_34_variant1 | 1703 | 36 | 34 |
| 5 | Chess_nowin_87_variant1 | 1756 | 36 | 87 |
| 6 | Chess_nowin_145_variant1 | 1814 | 36 | 145 |
| 7 | Chess_nowin_185_variant1 | 1854 | 36 | 185 |
| 8 | Chess_nowin_227_variant1 | 1896 | 36 | 227 |
| 9 | Connect_4_draw_617_variant1 | 61725 | 42 | 617 |
| 10 | Connect_4_draw_1247_variant1 | 62355 | 42 | 1247 |
| 11 | Lymphography | 148 | 8 | 6 |
| 12 | Monks_0_4_variant1 | 232 | 6 | 4 |
| 13 | Monks_0_12_variant1 | 240 | 6 | 12 |
| 14 | Monks_0_25_variant1 | 253 | 6 | 25 |
| 15 | Mushroom_p_85_variant1 | 4293 | 22 | 85 |
| 16 | Mushroom_p_221_variant1 | 4429 | 22 | 221 |
| 17 | Mushroom_p_365_variant1 | 4573 | 22 | 365 |
| 18 | Mushroom_p_467_variant1 | 4675 | 22 | 467 |
| 19 | Mushroom_p_573_variant1 | 4781 | 22 | 573 |
| 20 | Nursery_variant1 | 12960 | 8 | 330 |
| 21 | Tic-tac-toe_negative_12_variant1 | 638 | 9 | 12 |
| 22 | Tic-tac-toe_negative_26_variant1 | 652 | 9 | 26 |
| 23 | Tic-tac-toe_negative_32_variant1 | 658 | 9 | 32 |
| 24 | Tic-tac-toe_negative_54_variant1 | 680 | 9 | 54 |
| 25 | Tic-tac-toe_negative_69_variant1 | 695 | 9 | 69 |
| 26 | Vote_republican_29_variant1 | 296 | 16 | 29 |
| 27 | Zoo_variant1 | 101 | 16 | 17 |

# 3. Numerical datasets

## 3.1 Preprocessing details
| No. | Raw Datasets | Preprocessing |
|-----|--------------|---------------|
| 1 | ALOI | The data is divided into 1508 outliers (3.04%) and 48492 inliers (96.98%) |
| 2 | Cardiotocography | Downsampling the classes "2" and "3" down to 33 objects |
| 3 | Diabetes | Downsampling the class ''tested_positive" down to 26 objects |
| 4 | Ionosphere | Downsampling the class ''b" down to 24 objects |
| 5 | Iris | Downsampling the class ''Iris-virginica" down to 11 objects |
| 6 | Pima | Downsampling the class ''TRUE" down to 55 objects |
| 7 | Sonar | Downsampling the class ''M" down to 10 objects |
| 8 | Wisconsin diagnostic breast cancer | Downsampling the class "M" down to 39 objects |
| 9 | Page blocks | Downsampling the class ''Non-text" down to 258 objects |
| 10 | Wisconsin breast cancer | 202 ''malignant" (outlier) and 14 ``benign" objects were removed [2] |
| 11 | Yeast | Classes ''ERL" (outlier), ''CYT", ''NUC", and ''MIT" are selected [3] |
| 12 | Waveform | Downsampling the class ''0" down to 100 objects |
| 13 | Spambase | Downsampling the class ''spam" down to 56 objects |
| 14 | Wisconsin prognostic breast cancer | Class ''R" (minority) is considered as outliers |

## 3.2 Dataset statistics
| No. | New Datasets | #Objects | #Numerical | #Outliers |
|-----|--------------|----------|------------|-----------|
| 1 | ALOI_variant1 | 50000 | 27 | 1508 |
| 2 | Cardiotocography_2and3_3_variant1 | 1688 | 21 | 33 |
| 3 | Diabetes_tested_positive_26_variant1 | 526 | 8 | 26 |
| 4 | Ionosphere_b_24_variant1 | 249 | 34 | 24 |
| 5 | Iris_Irisvirginica_11_variant1 | 111 | 4 | 11 |
| 6 | Pima_TRUE_55_variant1 | 555 | 9 | 55 |
| 7 | Sonar_M_10_variant1 | 107 | 60 | 10 |
| 8 | Wdbc_M_39_variant1 | 396 | 31 | 39 |
| 9 | Pageblocks_258_variant1 | 5171 | 10 | 258 |
| 10 | Wisconsin_malignant_39_variant1 | 483 | 9 | 39 |
| 11 | Yeast_ERL_5_variant1 | 1141 | 8 | 5 |
| 12 | Waveform_0_100_variant1 | 3443 | 21 | 100 |
| 13 | Spambase_spam_56_variant1 | 2844 | 58 | 56 |
| 14 | Wpbc_variant1 | 198 | 33 | 47 |

# 4. Mixed datasets

## 4.1. Preprocessing details
| No. | Raw Datasets | Preprocessing |
|-----|--------------|---------------|
| 1 | Abalone | Classes "1-3", "20-27" and 29 are combined to form the outliers class and the rest of the classes are combined to form the inliers class |
| 2 | Adult | Downsampling the class ">50k" down to 343 objects |
| 3 | Adult | Downsampling the class ">50k" down to 694 objects |
| 4 | Adult | Downsampling the class ">50k" down to 1790 objects |
| 5 | Adult | Downsampling the class ">50k" down to 2957 objects |
| 6 | Adult | Downsampling the class ">50k" down to 3779 objects |
| 7 | Adult | Downsampling the class ">50k" down to 4638 objects |
| 8 | Autos | Classes "-2" and "-1" are combined to form the outliers class and the rest of the classes are combined to form the inliers class |
| 9 | Annealing | Classes "1" and "U" are combined to form the outliers class and the rest of the classes are combined to form the inliers class |
| 10 | Arrhythmia | Classes 3, 4, 5, 7, 8, 9, 14, 15 are combined to form the outliers class and the rest of the classes are combined to form the inliers class |
| 11 | Bands | Downsampling the class "band" down to 6 objects |
| 12 | Bands | Downsampling the class "band" down to 16 objects |
| 13 | Bands | Downsampling the class "band" down to 27 objects |
| 14 | Bands | Downsampling the class "band" down to 34 objects |
| 15 | Bands | Downsampling the class "band" down to 42 objects |
| 16 | Credit approval | Downsampling the class "+" down to 42 objects |
| 17 | German | Downsampling the class "1" down to 14 objects |
| 18 | Heart disease | Downsampling the class "2" down to 16 objects |
| 19 | Hepatitis | Downsampling the class "2" down to 9 objects |
| 20 | Horse | Downsampling the class "1" down to 12 objects |
| 21 | Sick | Downsampling the class "sick" down to 35 objects |
| 22 | Sick | Downsampling the class "sick" down to 72 objects |
| 23 | Thyroid_disease | Classes "SVHD" and "WEST" are combined to form the outliers class and the rest of the classes are combined to form the inliers class |

## 4.2. Dataset statistics
| No. | New Datasets | #Objects | #Numerical | #Categorical | #Outliers |
|-----|--------------|----------|------------|--------------|-----------|
| 1 | Abalone_variant1 | 4177 | 8 | 1 | 79 |
| 2 | Adult_morethan50K_343_variant1 | 34357 | 6 | 8 | 343 |
| 3 | Adult_morethan50K_694_variant1 | 34708 | 6 | 8 | 694 |
| 4 | Adult_morethan50K_1790_variant1 | 35804 | 6 | 8 | 1790 |
| 5 | Adult_morethan50K_2957_variant1 | 36971 | 6 | 8 | 2957 |
| 6 | Adult_morethan50K_3779_variant1 | 37793 | 6 | 8 | 3779 |
| 7 | Adult_morethan50K_4638_variant1 | 38652 | 6 | 8 | 4638 |
| 8 | Autos_variant1 | 205 | 15 | 10 | 25 |
| 9 | Annealing_variant1 | 798 | 10 | 28 | 42 |
| 10 | Arrhythmia_variant1 | 452 | 206 | 73 | 66 |
| 11 | Bands_band_6_variant1 | 318 | 20 | 19 | 6 |
| 12 | Bands_band_16_variant1 | 328 | 20 | 19 | 16 |
| 13 | Bands_band_27_variant1 | 339 | 20 | 19 | 27 |
| 14 | Bands_band_34_variant1 | 346 | 20 | 19 | 34 |
| 15 | Bands_band_42_variant1 | 354 | 20 | 19 | 42 |
| 16 | CreditA_plus_42_variant1 | 425 | 6 | 9 | 42 |
| 17 | German_1_14_variant1 | 714 | 7 | 13 | 14 |
| 18 | Heart_2_16_variant1 | 166 | 6 | 7 | 16 |
| 19 | Hepatitis_2_9_variant1 | 94 | 6 | 13 | 9 |
| 20 | Horse_1_12_variant1 | 256 | 8 | 19 | 12 |
| 21 | Sick_sick_35_variant1 | 3576 | 7 | 22 | 35 |
| 22 | Sick_sick_72_variant1 | 3613 | 7 | 22 | 72 |
| 23 | Thyroid_disease_variant1 | 9172 | 7 | 21 | 74 |

# 5.ODDS
				
| No. | Datasets               | #Objects  | #Numerical | #outliers (%) |
|-----|-----------------------|----------|-------|---------------|
| 1   | Annthyroid            | 7200     | 6     | 534 (7.42%)   |
| 2   | Arrhythmia            | 452      | 274   | 66 (15%)      |
| 3   | BreastW               | 683      | 9     | 239 (35%)     |
| 4   | Cardio                | 1831     | 21    | 176 (9.6%)    |
| 5   | Ecoli                 | 336      | 7     | 9 (2.6%)      |
| 6   | ForestCover           | 286048   | 10    | 2747 (0.9%)   |
| 7   | Glass                 | 214      | 9     | 9 (4.2%)      |
| 8   | Http (KDDCUP99)       | 567479   | 3     | 2211 (0.4%)   |
| 9   | Ionosphere            | 351      | 33    | 126 (36%)     |
| 10  | Letter Recognition    | 1600     | 32    | 100 (6.25%)   |
| 11  | Lympho                | 148      | 18    | 6 (4.1%)      |
| 12  | Mammography           | 11183    | 6     | 260 (2.32%)   |
| 13  | Mnist                 | 7603     | 100   | 700 (9.2%)    |
| 14  | Musk                  | 3062     | 166   | 97 (3.2%)     |
| 15  | Optdigits             | 5216     | 64    | 150 (3%)      |
| 16  | Pendigits             | 6870     | 16    | 156 (2.27%)   |
| 17  | Pima                  | 768      | 8     | 268 (35%)     |
| 18  | Satellite             | 6435     | 36    | 2036 (32%)    |
| 19  | Satimage-2            | 5803     | 36    | 71 (1.2%)     |
| 20  | Shuttle               | 49097    | 9     | 3511 (7%)     |
| 21  | Smtp (KDDCUP99)       | 95156    | 3     | 30 (0.03%)    |
| 22  | Speech                | 3686     | 400   | 61 (1.65%)    |
| 23  | Thyroid               | 3772     | 6     | 93 (2.5%)     |
| 24  | Vertebral             | 240      | 6     | 30 (12.5%)    |
| 25  | Vowels                | 1456     | 12    | 50 (3.4%)     |
| 26  | WBC                   | 378      | 30    | 21 (5.6%)     |
| 27  | Wine                  | 129      | 13    | 10 (7.7%)     |

# References
[1] G. O. Campos, A. Zimek, J. Sander, R. J. Campello, B. Micenkov´a, E. Schubert, I. Assent, and M. E. Houle, “On the evaluation of unsupervised outlier detection: measures, datasets, and an empirical study,” Data Mining and Knowledge Discovery, vol. 30, no. 4, pp. 891–927, 2016.

[2] Z. Y. He, X. F. Xu, and S. C. Deng, “Discovering cluster-based local outliers,” Pattern Recognition Letters, vol. 24, no. 9–10, pp. 1641–1650, 2003.

[3] F. Jiang and Y. M. Chen, “Outlier detection based on granular computing and rough set theory,” Applied Intelligence, vol. 42, no. 2, pp. 303–322, 2015.

[4] Zhong Yuan, Hongmei Chen, Tianrui Li, Jia Liu, Shu Wang. Fuzzy information entropy based adaptive approach for hybrid feature outlier detection[J]. Fuzzy Sets and Systems, 2021, 421: 1-18.

[5] Zhong Yuan, Xianyong Zhang, Feng Shan. Hybrid data-driven outlier detection based on neighborhood information entropy and its developmental measures[J]. Expert Systems with Applications, 2018, 112: 243-257.

[6]	Zhong Yuan, Hongmei Chen, Tianrui Li, Binbin Sang, Shu Wang. Outlier detection based on fuzzy rough granules in mixed attribute data[J]. IEEE Transactions on Cybernetics, 2022, 52(8): 8399-8412.

[7]	Zhong Yuan, Hongmei Chen, Tianrui Li, Xianyong Zhang, Binbin Sang. Multigranulation relative entropy based mixed attribute outlier detection in neighborhood systems[J]. IEEE Transactions on Systems, Man and Cybernetics: Systems, 2022, 52(8): 5175-5187.

# Others	
About more datasets, such as Outlier Detection DataSets (ODDS) and ADBench. 

[1] http://odds.cs.stonybrook.edu/

[2] https://github.com/Minqi824/ADBench/tree/main/adbench/datasets

**Note**: Since Link [1] is invalid, please refer to the ODDS folders, where -ori.mat represents the original dataset, and the rest represent the results of minimum-maximum normalization.
