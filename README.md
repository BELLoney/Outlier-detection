# Outlier-detection
Data set; Program files

In order to evaluate the effectiveness of an outlier detection algorithm, 16 data sets (including numeric, categorical, and mixed attributes) are selected from the UCI machine learning repository for experiments.

Most of these data sets are used for the evaluation of classification and clustering methods. By contrast, for the evaluation of outlier detection, there are very few existing data sets. Accordingly, this paper uses the downsampling method proposed in the document [1] to obtain some data sets for evaluating outlier detection. The method randomly downsamples a particular class to produce outliers while preserving all objects of the remaining classes to form an outlier detection data set. In addition, for the missing values of data set, this paper uses the maximum probability value method to complete the missing value, that is, the value of attribute with the highest frequency on other objects is used to fill the missing attribute value.
The details of data preprocessing and description are shown in Table I.

[1] G. O. Campos, A. Zimek, J. Sander, R. J. Campello, B. Micenkov´a, E. Schubert, I. Assent, and M. E. Houle, “On the evaluation of unsupervised outlier detection: measures, datasets, and an empirical study,” Data Mining and Knowledge Discovery, vol. 30, no. 4, pp. 891–927, 2016.
